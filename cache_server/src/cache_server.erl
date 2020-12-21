-module(cache_server).
-behaviour(gen_server).

-export([stop/0, start_link/2, insert/3, lookup/1, lookup_by_date/2]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-record(state, {table_name, drop_interval}).

%% API
start_link(TableName, [{drop_interval, DropInterval}]) ->
    Args = [TableName, DropInterval],
    gen_server:start_link({local, ?MODULE}, ?MODULE, Args, []).

stop() ->
	gen_server:call(?MODULE, stop).

insert(Key, Value, TimeToLive) ->
    gen_server:call(?MODULE, {insert, Key, Value, TimeToLive}).

lookup(Key) ->
    gen_server:call(?MODULE, {lookup, Key}).

lookup_by_date(DateFrom, DateTo) ->
    gen_server:call(?MODULE, {lookup_by_date, DateFrom, DateTo}).

%% gen_server
init([TableName, DropInterval]) ->
    my_cache:create(TableName),
    timer:send_after(DropInterval * 1000, delete_obsolete),
    State = #state{table_name = TableName, drop_interval = DropInterval},
    {ok, State}.

handle_call({insert, Key, Value, TimeToLive}, _From, State) ->
    #state{table_name = TableName, drop_interval = _DropInterval} = State,
    my_cache:insert(TableName, Key, Value, TimeToLive),
    {reply, ok, State};
handle_call({lookup, Key}, _From, State) ->
    #state{table_name = TableName, drop_interval = _DropInterval} = State,
    Result = my_cache:lookup(TableName, Key),
    {reply, Result, State};
handle_call({lookup_by_date, DateFrom, DateTo}, _From, State) ->
    #state{table_name = TableName, drop_interval = _DropInterval} = State,
    Values = my_cache:lookup_by_date(TableName, DateFrom, DateTo),
    {reply, {ok, Values}, State};
handle_call(stop, _From, State) ->
    {stop, normal, stopped, State};
handle_call(_Request, _From, State) ->
    {reply, ok, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(delete_obsolete, State) ->
    #state{table_name = TableName, drop_interval = DropInterval} = State,    
    my_cache:delete_obsolete(TableName),
    timer:send_after(DropInterval * 1000, delete_obsolete),
    {noreply, State};
handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

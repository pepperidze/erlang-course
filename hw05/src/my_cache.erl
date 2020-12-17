-module(my_cache).
-export([create/1, insert/4, lookup/2, delete_obsolete/1]).

create(TableName) ->
    ets:new(TableName, [set, public, named_table]), ok.

current_datetime_to_seconds() ->
    calendar:datetime_to_gregorian_seconds(calendar:local_time()).

insert(TableName, Key, Value, TimeToLive) ->
    TimeToDie = TimeToLive + current_datetime_to_seconds(),
    ets:insert(TableName, {Key, Value, TimeToDie}), ok.

lookup(TableName, Key) ->
    [{Key, Value, TimeToDie}] = ets:lookup(TableName, Key),
    TimeNow = current_datetime_to_seconds(),
    if
        TimeToDie > TimeNow -> {ok, Value};
        true -> ok
    end.

delete_obsolete(TableName) ->
    MatchHead = {'$1', '$2', '$3'},
    Guard = [{'<', '$3', current_datetime_to_seconds()}],
    Result = [true],
    MatchSpec = [{MatchHead, Guard, Result}],
    ets:select_delete(TableName, MatchSpec), ok.

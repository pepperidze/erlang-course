-module(cache_server_handler).

-export([init/2]).

init(Req0, Opts) ->
	Method = cowboy_req:method(Req0),
	HasBody = cowboy_req:has_body(Req0),
	Req = process_http_method(Method, HasBody, Req0),
	{ok, Req, Opts}.

process_http_method(<<"POST">>, true, Req0) ->
	{ok, Bin, Req} = cowboy_req:read_body(Req0),
	Proplist = jsone:decode(Bin, [{object_format, proplist}]),
	Action = proplists:get_value(<<"action">>, Proplist),	
	process_lib_method(Action, Proplist, Req);
process_http_method(<<"POST">>, false, Req) ->
	cowboy_req:reply(400, [], <<"Missing body.">>, Req);
process_http_method(_, _, Req) ->
	%% Method not allowed.
	cowboy_req:reply(405, Req).

process_lib_method(<<"insert">>, Proplist, Req) ->
	Key = proplists:get_value(<<"key">>, Proplist),
	Value = proplists:get_value(<<"value">>, Proplist),
	TimeToLive = proplists:get_value(<<"time_to_live">>, Proplist),
	ok = cache_server:insert(Key, Value, TimeToLive),
	Res = [{insert_result, ok}],
	cowboy_req:reply(200, #{<<"content-type">> => <<"text/plain; charset=utf-8">>}, jsone:encode(Res), Req);
process_lib_method(<<"lookup">>, Proplist, Req) ->
	Key = proplists:get_value(<<"key">>, Proplist),
	{ok, Value} = cache_server:lookup(Key),
	Res = [{lookup_result, Value}],
	cowboy_req:reply(200, #{<<"content-type">> => <<"text/plain; charset=utf-8">>}, jsone:encode(Res), Req);
process_lib_method(<<"lookup_by_date">>, Proplist, Req) ->
	DateFrom = proplists:get_value(<<"date_from">>, Proplist),
	DateTo = proplists:get_value(<<"date_to">>, Proplist),
	{ok, Values} = cache_server:lookup_by_date(bin_to_datetime(DateFrom), bin_to_datetime(DateTo)),
	Res = [{lookup_result, Values}],
	cowboy_req:reply(200, #{<<"content-type">> => <<"text/plain; charset=utf-8">>}, jsone:encode(Res), Req).

bin_to_datetime(DateTime) ->
	[Date, Time] = binary:split(DateTime, <<" ">>),
	[Hour, Minute, Second] = binary:split(Time, <<":">>, [global]),
	[Year, Month, Day] = binary:split(Date, <<"/">>, [global]),
	NewDate = {binary_to_integer(Year), binary_to_integer(Month), binary_to_integer(Day)},
	NewTime = {binary_to_integer(Hour), binary_to_integer(Minute), binary_to_integer(Second)},
	{NewDate, NewTime}.

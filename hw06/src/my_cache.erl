-module(my_cache).
-export([create/1, insert/4, lookup/2, lookup_by_date/3, delete_obsolete/1]).

create(TableName) ->
    ets:new(TableName, [set, public, named_table]), ok.

current_datetime_to_seconds() ->
    calendar:datetime_to_gregorian_seconds(calendar:local_time()).

insert(TableName, Key, Value, TimeToLive) ->
    TimeCreated = current_datetime_to_seconds(),
    TimeToDie = TimeCreated + TimeToLive,
    ets:insert(TableName, {Key, Value, TimeCreated, TimeToDie}), ok.

lookup(TableName, Key) ->
    [{Key, Value, _TimeCreated, TimeToDie}] = ets:lookup(TableName, Key),
    TimeNow = current_datetime_to_seconds(),
    if
        TimeToDie > TimeNow -> {ok, Value};
        true -> ok
    end.

lookup_by_date(TableName, DateFrom, DateTo) ->
    DateFromSec = calendar:datetime_to_gregorian_seconds(DateFrom),
    DateToSec = calendar:datetime_to_gregorian_seconds(DateTo),
    MatchHead = {'$1', '$2', '$3', '$4'},
    Guard = [{'>=', '$3', DateFromSec}, {'=<', '$3', DateToSec}],
    Result = ['$2'],
    MatchSpec = [{MatchHead, Guard, Result}],
    ets:select(TableName, MatchSpec).

delete_obsolete(TableName) ->
    MatchHead = {'$1', '$2', '$3', '$4'},
    Guard = [{'<', '$4', current_datetime_to_seconds()}],
    Result = [true],
    MatchSpec = [{MatchHead, Guard, Result}],
    ets:select_delete(TableName, MatchSpec), ok.

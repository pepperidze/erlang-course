-module(bs03_tests).
-include_lib("eunit/include/eunit.hrl").

words_test() ->
    ?_assert(bs03:split(<<"Col1-:-Col2-:-Col3-:-Col4-:-Col5">>, "-:-") =:= [<<"Col1">>, <<"Col2">>, <<"Col3">>, <<"Col4">>, <<"Col5">>]).

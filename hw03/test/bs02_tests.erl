-module(bs02_tests).
-include_lib("eunit/include/eunit.hrl").

words_test() ->
    ?_assert(bs02:words(<<"Text with four words">>) =:= [<<"Text">>, <<"with">>, <<"four">>, <<"words">>]).

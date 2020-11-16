-module(bs01_tests).
-include_lib("eunit/include/eunit.hrl").

first_word_test_() -> [
    ?_assert(bs01:first_word(<<"">>) =:= <<"">>),
    ?_assert(bs01:first_word(<<"Some text">>) =:= <<"Some">>)
].

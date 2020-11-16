-module(p08_tests).
-include_lib("eunit/include/eunit.hrl").

compress_test_() -> [
    ?_assert(p08:compress([]) =:= []),
    ?_assert(p08:compress("") =:= ""),
    ?_assert(p08:compress([a]) =:= [a]),
    ?_assert(p08:compress("a") =:= "a"),
    ?_assert(p08:compress([a, a]) =:= [a]),
    ?_assert(p08:compress("aa") =:= "a"),
    ?_assert(p08:compress([a, a, b, c, c, a, a]) =:= [a, b, c, a]),
    ?_assertException(error, function_clause, p08:compress(a)),
    ?_assertException(error, function_clause, p08:compress(1)),
    ?_assertException(error, function_clause, p08:compress(<<"aba">>))
].

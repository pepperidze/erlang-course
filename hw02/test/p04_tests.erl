-module(p04_tests).
-include_lib("eunit/include/eunit.hrl").

len_test_() -> [
    ?_assert(p04:len("") =:= 0),
    ?_assert(p04:len([]) =:= 0),
    ?_assert(p04:len("a") =:= 1),
    ?_assert(p04:len([a]) =:= 1),
    ?_assert(p04:len("ab") =:= 2),
    ?_assert(p04:len([a, b]) =:= 2),
    ?_assert(p04:len([a, b, c]) =:= 3),
    ?_assertException(error, function_clause, p04:len(a)),
    ?_assertException(error, function_clause, p04:len(1))
].

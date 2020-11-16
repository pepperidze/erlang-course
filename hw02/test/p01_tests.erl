-module(p01_tests).
-include_lib("eunit/include/eunit.hrl").

last_test_() -> [
    ?_assert(p01:last([a]) =:= a),
    ?_assert(p01:last([a,b]) =:= b),
    ?_assert(p01:last([a,b,c]) =:= c),
    ?_assert(p01:last("a") =:= 97),
    ?_assert(p01:last("ab") =:= 98),
    ?_assert(p01:last("abc") =:= 99),
	?_assertException(error, function_clause, p01:last("")),
    ?_assertException(error, function_clause, p01:last(1)),
    ?_assertException(error, function_clause, p01:last(a)),
    ?_assertException(error, function_clause, p01:last([]))
].

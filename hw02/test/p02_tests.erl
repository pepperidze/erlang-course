-module(p02_tests).
-include_lib("eunit/include/eunit.hrl").

but_last_test_() -> [
    ?_assert(p02:but_last([a, b]) =:= [a, b]),
    ?_assert(p02:but_last([a, b, c]) =:= [b, c]),
    ?_assert(p02:but_last([a, b, c, d]) =:= [c, d]),
	?_assert(p02:but_last("ab") =:= "ab"),
    ?_assert(p02:but_last("abc") =:= "bc"),
    ?_assertException(error, function_clause, p02:but_last(1)),
    ?_assertException(error, function_clause, p02:but_last(a)),
    ?_assertException(error, function_clause, p02:but_last([])),
    ?_assertException(error, function_clause, p02:but_last([a])),
    ?_assertException(error, function_clause, p02:but_last("")),
    ?_assertException(error, function_clause, p02:but_last("a"))
].

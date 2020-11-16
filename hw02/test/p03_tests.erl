-module(p03_tests).
-include_lib("eunit/include/eunit.hrl").

element_at_test_() -> [
    ?_assert(p03:element_at([], 1) =:= undefined),
    ?_assert(p03:element_at([a, b], -1) =:= undefined),
    ?_assert(p03:element_at([a, b], 0) =:= undefined),
    ?_assert(p03:element_at([a], 1) =:= a),
    ?_assert(p03:element_at([a, b], 1) =:= a),
    ?_assert(p03:element_at([a, b], 2) =:= b),
    ?_assert(p03:element_at("ab", 2) =:= 98),
    ?_assert(p03:element_at([a, b], 3) =:= undefined),
	?_assertException(error, function_clause, p03:element_at(1, 1)),
    ?_assertException(error, function_clause, p03:element_at(a, 1))
].

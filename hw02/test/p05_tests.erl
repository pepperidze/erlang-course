-module(p05_tests).
-include_lib("eunit/include/eunit.hrl").

reverse_test_() -> [
    ?_assert(p05:reverse([]) =:= []),
    ?_assert(p05:reverse([a]) =:= [a]),
    ?_assert(p05:reverse([a, b]) =:= [b, a]),
    ?_assert(p05:reverse([a, b, c]) =:= [c, b, a]),
    ?_assert(p05:reverse("") =:= ""),
    ?_assert(p05:reverse("a") =:= "a"),
    ?_assert(p05:reverse("ab") =:= "ba"),
    ?_assert(p05:reverse("abc") =:= "cba"),
    ?_assertException(error, function_clause, p05:reverse(a)),
    ?_assertException(error, function_clause, p05:reverse(1)),
    ?_assertException(error, function_clause, p05:reverse(<<"abc">>))
].

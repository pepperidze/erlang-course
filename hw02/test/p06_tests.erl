-module(p06_tests).
-include_lib("eunit/include/eunit.hrl").

is_palindrome_test_() -> [
    ?_assert(p06:is_palindrome([]) =:= true),
    ?_assert(p06:is_palindrome("") =:= true),
    ?_assert(p06:is_palindrome([a]) =:= true),
    ?_assert(p06:is_palindrome("a") =:= true),
    ?_assert(p06:is_palindrome([a, b, a]) =:= true),
    ?_assert(p06:is_palindrome("aba") =:= true),
    ?_assert(p06:is_palindrome([a, b, a, b]) =:= false),
    ?_assert(p06:is_palindrome("abab") =:= false),
    ?_assertException(error, function_clause, p06:is_palindrome(a)),
	?_assertException(error, function_clause, p06:is_palindrome(1)),
    ?_assertException(error, function_clause, p06:is_palindrome(<<"aba">>))
].

-module(p09_tests).
-include_lib("eunit/include/eunit.hrl").

pack_test_() -> [
    ?_assert(p09:pack([]) =:= []),
    ?_assert(p09:pack([a]) =:= [[a]]),
    ?_assert(p09:pack([a,b,c,d]) =:= [[a],[b],[c],[d]]),
    ?_assert(p09:pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e]) =:= [[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]),
    ?_assertException(error, function_clause, p09:pack(a)),
    ?_assertException(error, function_clause, p09:pack(1)),
    ?_assertException(error, function_clause, p09:pack(<<"aba">>))
].

-module(p10_tests).
-include_lib("eunit/include/eunit.hrl").

encode_test_() -> [
    ?_assert(p10:encode([]) =:= []),
    ?_assert(p10:encode([a]) =:= [{1,a}]),
    ?_assert(p10:encode("a") =:= [{1,97}]),
    ?_assert(p10:encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e]) =:= [{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}]),
    ?_assertException(error, function_clause, p10:encode(a)),
	?_assertException(error, function_clause, p10:encode(1)),
    ?_assertException(error, function_clause, p10:encode(<<"aba">>))
].

-module(p15_tests).
-include_lib("eunit/include/eunit.hrl").

replicate_test_() -> [
    ?_assert(p15:replicate([], 1) =:= []),
    ?_assert(p15:replicate([a,b,c], 3) =:= [a,a,a,b,b,b,c,c,c])
].

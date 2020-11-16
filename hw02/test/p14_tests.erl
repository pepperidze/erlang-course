-module(p14_tests).
-include_lib("eunit/include/eunit.hrl").

duplicate_test_() -> [
    ?_assert(p14:duplicate([]) =:= []),
    ?_assert(p14:duplicate([a,b,c,c,d]) =:= [a,a,b,b,c,c,c,c,d,d])
].

-module(p07_tests).
-include_lib("eunit/include/eunit.hrl").

flatten_test_() -> [
    ?_assert(p07:flatten([]) =:= []),
    ?_assert(p07:flatten([[]]) =:= []),
    ?_assert(p07:flatten([a]) =:= [a]),
    ?_assert(p07:flatten([a,[],[b,[c,d],e]]) =:= [a,b,c,d,e])
].

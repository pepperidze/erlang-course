-module(p10).
-import(p05, [reverse/1]).
-export([encode/1]).

% p10:encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
% [{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}]

encode(L) ->
    encode(L, 0, []).

encode([H, H|T], I, Acc) ->
    encode([H|T], I + 1, Acc);
encode([H|T], I, Acc) ->
    encode(T, 0, [{I + 1, H}|Acc]);
encode([], 0, Acc) ->
    reverse(Acc).

-module(p10).
-export([encode/1]).

% p10:encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
% [{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}]

encode(L) ->
    encode(L, [], 1).

encode([H, H|T], Acc, I) ->
    encode([H|T], Acc, I + 1);
encode([H|T], Acc, I) ->
    [[{I, H}|Acc]|encode(T)];
encode([], _Acc, _I) ->
    [].

-module(p09).
-export([pack/1]).

% p09:pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
% [[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]

pack(L) ->
    pack(L, []).

pack([H, H|T], Acc) ->
    pack([H|T], [H|Acc]);
pack([H|T], Acc) ->
    [[H|Acc]|pack(T)];
pack([], _Acc) ->
    [].

-module(p09).
-import(p05, [reverse/1]).
-export([pack/1]).

% p09:pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
% [[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]

pack(L) ->
    pack(L, 0, []).

pack([H, H|T], I, Acc) ->
    pack([H|T], I + 1, Acc);
pack([H|T], I, Acc) ->
    pack(T, 0, [replicate(H, I + 1)|Acc]);
pack([], 0, Acc) ->
    reverse(Acc).

replicate(Symbol, I) ->
    replicate(Symbol, I, []).

replicate(_Symbol, 0, Acc) ->
    Acc;
replicate(Symbol, I, Acc) ->
    replicate(Symbol, I - 1, [Symbol|Acc]).

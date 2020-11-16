-module(p08).
-import(p05, [reverse/1]).
-export([compress/1]).

% p08:compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
% [a,b,c,a,d,e]

compress(L) ->
    compress(L, []).

compress([H, H|T], Acc) ->
    compress([H|T], Acc);
compress([H|T], Acc) ->
    compress(T, [H|Acc]);
compress([], Acc) ->
    reverse(Acc).

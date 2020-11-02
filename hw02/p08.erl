-module(p08).
-export([compress/1]).

% p08:compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
% [a,b,c,a,d,e]

compress([H, H|T]) ->
    compress([H|T]);
compress([H|T]) ->
    [H|compress(T)];
compress([]) ->
    [].

-module(p04).
-export([len/1]).

% p04:len([]).
% 0
% p04:len([a,b,c,d]).
% 4

len(L) ->
    len(L, 0).

len([_|T], X) ->
    len(T, X + 1);
len([], I) ->
    I.

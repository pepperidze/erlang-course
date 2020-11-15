-module(p15).
-export([replicate/2]).
-import(p05, [reverse/1]).

% p15:replicate([a,b,c], 3).
% [a,a,a,b,b,b,c,c,c]

replicate(L, K) ->
    replicate(L, K, []).

replicate([_|_] = L, K, Acc) ->
    replicate(L, K, Acc, K);
replicate([], _, Acc) ->
    reverse(Acc).

replicate([_|T], K, Acc, 0) ->
    replicate(T, K, Acc);
replicate([H|_] = L, K, Acc, I) ->
    replicate(L, K, [H|Acc], I - 1).

-module(p07).
-export([flatten/1]).

% p07:flatten([a,[],[b,[c,d],e]]).
% [a,b,c,d,e]

flatten(L) ->
    flatten(L, []).

flatten([H|T], F) ->
    flatten(H, flatten(T, F));
flatten([], F) ->
    F;
flatten(H, F) ->
    [H|F].

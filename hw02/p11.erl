-module(p11).
-export([encode_modified/1]).

% p11:encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
% [{4,a},b,{2,c},{2,a},d,{4,e}]

encode_modified(L) ->
    encode_modified(L, [], 1).

encode_modified([H, H|T], Acc, I) ->
    encode_modified([H|T], Acc, I + 1);
encode_modified([H|T], Acc, 1) ->
    [[H|Acc]|encode_modified(T)];
encode_modified([H|T], Acc, I) ->
    [[{I, H}|Acc]|encode_modified(T)];
encode_modified([], _Acc, _I) ->
    [].

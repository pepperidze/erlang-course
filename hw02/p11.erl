-module(p11).
-import(p05, [reverse/1]).
-export([encode_modified/1]).

% p11:encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
% [{4,a},b,{2,c},{2,a},d,{4,e}]

encode_modified(L) ->
    encode_modified(L, 0, []).

encode_modified([H, H|T], I, Acc) ->
    encode_modified([H|T], I + 1, Acc);
encode_modified([H|T], 0, Acc) ->
    encode_modified(T, 0, [H|Acc]);
encode_modified([H|T], I, Acc) ->
    encode_modified(T, 0, [{I + 1, H}|Acc]);
encode_modified([], 0, Acc) ->
    reverse(Acc).

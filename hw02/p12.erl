-module(p12).
-import(p05, [reverse/1]).
-export([decode_modified/1]).

% p12:decode_modified([{4,a},b,{2,c},{2,a},d,{4,e}]).
% [a,a,a,a,b,c,c,a,a,d,e,e,e,e]

decode_modified(L) ->
    decode_modified(L, []).

decode_modified([{K, Symbol}|T], Acc) ->
    decode_modified([{K, Symbol}|T], K, Acc);
decode_modified([H|T], Acc) ->
    decode_modified(T, [H|Acc]);
decode_modified([], Acc) ->
    reverse(Acc).

decode_modified([{_, _}|T], 0, Acc) ->
    decode_modified(T, Acc);
decode_modified([{K, Symbol}|T], I, Acc) ->
    decode_modified([{K, Symbol}|T], I - 1, [Symbol|Acc]).

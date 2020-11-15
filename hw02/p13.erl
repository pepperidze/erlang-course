-module(p13).
-import(p05, [reverse/1]).
-export([decode/1]).

% p13:decode([{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}]).
% [a,a,a,a,b,c,c,a,a,d,e,e,e,e]

decode(L) ->
    decode(L, []).

decode([{K, Symbol}|T], Acc) ->
    decode([{K, Symbol}|T], K, Acc);
decode([], Acc) ->
    reverse(Acc).

decode([{_, _}|T], 0, Acc) ->
    decode(T, Acc);
decode([{K, Symbol}|T], I, Acc) ->
    decode([{K, Symbol}|T], I - 1, [Symbol|Acc]).

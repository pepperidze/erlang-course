-module(bs03).
-import(help, [reverse/1]).
-export([split/2]).

split(B, Delimiter) ->
    split(B, list_to_binary(Delimiter), <<>>, []).

% trying to pass separator length via args, but whatever I do, variable is unbound
split(<<Delimiter:3/binary, Rest/binary>>, Delimiter, AccWord, AccList) ->
    split(Rest, Delimiter, <<>>, [AccWord|AccList]);
split(<<X/utf8, Rest/binary>>, Delimiter, AccWord, AccList) ->
    split(Rest, Delimiter, <<AccWord/binary, X/utf8>>, AccList);
split(<<>>, _Delimiter, AccWord, AccList) ->
    reverse([AccWord|AccList]).

-module(bs02).
-import(help, [reverse/1]).
-export([words/1]).

words(B) ->
    words(B, <<>>, []).

words(<<" ", Rest/binary>>, AccWord, AccList) ->
    words(Rest, <<>>, [AccWord|AccList]);
words(<<X/utf8, Rest/binary>>, AccWord, AccList) ->
    words(Rest, <<AccWord/binary, X/utf8>>, AccList);
words(<<>>, AccWord, AccList) ->
    reverse([AccWord|AccList]).

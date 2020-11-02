-module(p06).
-import(p05, [reverse/1]).
-export([is_palindrome/1]).

% p06:is_palindrome([1,2,3,2,1]).
% true

is_palindrome(L) ->
    is_palindrome(L, reverse(L)).
is_palindrome([H|T1], [H|T2]) ->
    is_palindrome(T1, T2);
is_palindrome([], []) ->
    true;
is_palindrome(_, _) ->
    false.

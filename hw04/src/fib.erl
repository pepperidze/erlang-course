-module(fib).
-export([fib/1]).

fib(0) ->
    1;
fib(1) ->
    1;
fib(N) ->
    fib(N, 1, 1).

fib(2, Acc1, Acc2) ->
    Acc1 + Acc2;
fib(N, Acc1, Acc2) ->
    fib(N - 1, Acc2, Acc1 + Acc2).

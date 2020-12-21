-module(cache_server_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
	Dispatch = cowboy_router:compile([
		{'_', [
			{"/", cache_server_handler, []}
		]}
	]),
	{ok, _} = cowboy:start_clear(http, [{port, 8080}], #{
		env => #{dispatch => Dispatch}
	}),
	cache_server_sup:start_link(),
	cache_server:start_link(cache_server, [{drop_interval, 600}]).

stop(_State) ->
	ok = cowboy:stop_listener(http).

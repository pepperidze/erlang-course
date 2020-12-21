{application, 'cache_server', [
	{description, "New project"},
	{vsn, "0.1.0"},
	{modules, ['cache_server','cache_server_app','cache_server_handler','cache_server_sup','jsone','jsone_decode','jsone_encode','my_cache']},
	{registered, [cache_server_sup]},
	{applications, [kernel,stdlib,cowboy]},
	{mod, {cache_server_app, []}},
	{env, []}
]}.
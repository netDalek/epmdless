-module(epmdless_epmd_client_SUITE).

-compile(export_all).

-define(MOD, epmdless_epmd_client).

all() ->
    [start_link, register_node, port_please, names].

start_link(_) ->
    ignore = ?MOD:start_link().

register_node(_) ->
    ?MOD:register_node(1, 2).

port_please(_) ->
    {port, 3000, 5} = ?MOD:port_please("a_port3000@app", ip),
    {port, 4370, 5} = ?MOD:port_please("a_port@app", ip).

names(_) ->
    {error, address} = ?MOD:names(host).

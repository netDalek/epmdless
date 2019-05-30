-module(epmdless_epmd_client).

-export([start_link/0,
         register_node/2,
         register_node/3,
         port_please/2,
         names/1]).

start_link() ->
    ignore.

register_node(_Name, _Port) ->
    {ok, rand:uniform(3)}.

register_node(Name, Port, _Family) ->
    register_node(Name, Port).

port_please(Name, _IP) ->
    Port = epmdless:dist_port(Name),
    {port, Port, _Version = 5}.

names(_Hostname) ->
    {error, address}.

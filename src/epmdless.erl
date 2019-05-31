-module(epmdless).

-export([dist_port/1]).

%%====================================================================
%% API functions
%%====================================================================

dist_port(Name) when is_atom(Name) ->
    dist_port(atom_to_list(Name));
dist_port(Name) when is_list(Name) ->
    NodeName = re:replace(Name, "@.*$", ""),
    case re:run(NodeName, "_port([0-9]+)$", [{capture, all_but_first, list}]) of
        nomatch ->
            application:get_env(kernel, epmdless_default_port, 4370);
        {match, [OffsetAsString | _]} ->
            list_to_integer(OffsetAsString)
    end.

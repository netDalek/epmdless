-module(epmdless_dist_SUITE).
-compile(export_all).

all() ->
    [listen].

listen(_) ->
    {ok, _} = epmdless_dist:listen(dd@app).

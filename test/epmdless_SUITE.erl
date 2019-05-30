-module(epmdless_SUITE).
-compile(export_all).

all() ->
    [dist_port].

dist_port(_) ->
    4370 = epmdless:dist_port(dd@app),
    4371 = epmdless:dist_port(dd_port4371@app).

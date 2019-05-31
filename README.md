epmdless
=====

Erlang (and Elixir) distribution without epmd described in https://www.erlang-solutions.com/blog/erlang-and-elixir-distribution-without-epmd.html with some modification

Test
-----

    $ make test

Erlang usage
-----

Run this to start erlang node on 4379 port number

    $ erl -proto_dist epmdless -start_epmd false -epmd_module epmdless_epmd_client -pa _build/default/lib/epmdless/ebin -sname foo_port4379

You can omit port number and run on port from config (`application:get_env(epmdless, inet_dist_default_port, 4370)`)

    $ erl -proto_dist epmdless -start_epmd false -epmd_module epmdless_epmd_client -pa _build/default/lib/epmdless/ebin -sname foo

Running with config

    $ erl -proto_dist epmdless -start_epmd false -epmd_module epmdless_epmd_client -pa _build/default/lib/epmdless/ebin -sname foo -config config/sys.config

Elixir usage
-----

Add to deps

```elixir
def deps do
  [{:epmdless, github: "netDalek/epmdless"}]
end
```

Run this to start erlang node on 4379 port number

    $ iex --erl "-proto_dist epmdless -start_epmd false -epmd_module epmdless_epmd_client -pa _build/${MIX_ENV:-dev}/lib/epmdless/ebin/" --sname foo_port4379 -S mix

Note that you must add `-pa` option with path to epmdless beam files

You can omit port number and run on port from config (`application:get_env(epmdless, inet_dist_default_port, 4370)`)

    $ iex --erl "-proto_dist epmdless -start_epmd false -epmd_module epmdless_epmd_client -pa _build/${MIX_ENV:-dev}/lib/epmdless/ebin/" --sname foll -S mix

In order to connect with remsh run something like this

    $ iex --erl "-proto_dist epmdless -start_epmd false -epmd_module epmdless_epmd_client -pa _build/${MIX_ENV:-dev}/lib/epmdless/ebin" --remsh foo_port4379@localhost --sname foo

Comments
-----

* Suddenly fails on erlang 21.0.4 but works on 21.2.5



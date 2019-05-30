epmdless
=====

Erlang (and Elixir) distribution without epmd described in https://www.erlang-solutions.com/blog/erlang-and-elixir-distribution-without-epmd.html with some modification

Test
-----

    $ make test

Usage
-----

Run this to start erlang node on 4379 port number

    $ erl -proto_dist epmdless -start_epmd false -epmd_module epmdless_epmd_client -pa _build/default/lib/epmdless/ebin -sname foo_port4379

If you omit port number in node name like this

    $ erl -proto_dist epmdless -start_epmd false -epmd_module epmdless_epmd_client -pa _build/default/lib/epmdless/ebin -sname foo

or even this

    $ erl -proto_dist epmdless -start_epmd false -epmd_module epmdless_epmd_client -pa _build/default/lib/epmdless/ebin -sname foo_port

erlang node will start on `application:get_env(epmdless, inet_dist_default_port, 4370)` port number

Comments
-----

* Suddenly fails on erlang 21.0.4 but works on 21.2.5



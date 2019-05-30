.PHONY: test
.PHONY: down

test:
	ERL_FLAGS="-args_file config/vm.args" rebar3 ct

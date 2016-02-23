# Microbenchmark experiments

The idea is to compare perfomance between Redis GET/SET and a similar application using Erlang ETS.

## Requirements

You need a local Redis instance.

## Installation/Usage

Fetch & compile the required deps:

```mix do deps.get, deps.compile```

Run the benchmarks:

```mix bench```

# Microbenchmark experiments

The idea is to compare perfomance between Redis GET/SET and a similar application using Erlang ETS.

## Requirements

You need a local Redis instance.

## Installation/Usage

Fetch & compile the required deps:

```mix do deps.get, deps.compile```

Run the benchmarks:

```mix bench```

## Output

On my computer:

```
## BasicBench
[02:41:18] 1/7: hello list
## ETSBench
[02:41:20] 2/7: read a existing key
[02:41:22] 3/7: insert one item
[02:41:25] 4/7: insert five items
[02:41:27] 5/7: insert and retrieve five items
## RedixBench
[02:41:29] 6/7: read an existing key
[02:41:32] 7/7: insert and retrieve five items

Finished in 17.53 seconds

## BasicBench
hello list                          500000   3.50 µs/op
## ETSBench
read a existing key               10000000   0.20 µs/op
insert one item                   10000000   0.22 µs/op
insert five items                  1000000   1.98 µs/op
insert and retrieve five items      500000   3.69 µs/op
## RedixBench
read an existing key                 50000   47.34 µs/op
insert and retrieve five items        5000   525.32 µs/op
```

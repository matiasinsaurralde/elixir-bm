defmodule RedixBench do
  use Benchfella

  before_each_bench _ do
    { :ok, redix } = Redix.start_link(host: "localhost", port: 6379)

    context = %{ redix: redix }

    Redix.command( redix, ~w( SET existingkey abc ) )

    { :ok, context }
  end

  bench "insert and retrieve five items", [redix: bench_context[:redix]] do
    Enum.each [1, 2, 3, 4, 5], fn n ->
      key = "sampleKey#{n}"
      value = "sampleValue#{n}"

      Redix.command( redix, ~w( SET #{key} #{value} ) )

      Redix.command( redix, ~w( GET #{key} ) )

    end
  end

  bench "read an existing key", [redix: bench_context[:redix]] do
    Redix.command( redix, ~w( GET existingkey ) )
  end

end

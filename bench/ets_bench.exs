defmodule ETSBench do
  use Benchfella

  @table :sample_table

  before_each_bench _ do
    :ets.new( @table, [ :set, :public, :named_table ] )
    { :ok, nil }
  end

  bench "insert one item" do
    key = "sampleKey"
    item = %{}

    :ets.insert( @table, { key, item } )

  end

  bench "insert five items" do
    Enum.each [1, 2, 3, 4, 5], fn n ->
      key = "sampleKey#{n}"
      item = 1

      :ets.insert( @table, { key, item } )

    end
  end

end

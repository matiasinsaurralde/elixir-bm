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

  bench "insert and retrieve five items" do
    Enum.each [1, 2, 3, 4, 5], fn n ->
      key = "sampleKey#{n}"
      value = "sampleValue#{n}"

      :ets.insert( @table, { key, value } )

      retrieved_value = :ets.lookup_element( @table, key, 2 )

    end
  end

end

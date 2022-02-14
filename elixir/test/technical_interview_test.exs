defmodule TechnicalInterviewTest do
  use ExUnit.Case
  alias TechnicalInterview, as: T

  describe "reverse" do
    test "empty list" do
      assert T.reverse([]) == []
    end

    test "normal list" do
      assert T.reverse([1, 3, 5, 7]) == [7, 5, 3, 1]
    end

    test "list of lists is not flattened" do
      assert T.reverse([[1, 2], [3], [], [4, 5, 6]]) == [[4, 5, 6], [], [3], [1, 2]]
    end

    @tag :slow
    test "huge list" do
      assert T.reverse(Enum.to_list(1..1_000_000)) == Enum.to_list(1_000_000..1)
    end
  end

  describe "map" do
    test "empty list" do
      assert T.map([], &(&1 + 1)) == []
    end

    test "normal list" do
      assert T.map([1, 3, 5, 7], &(&1 + 1)) == [2, 4, 6, 8]
    end

    @tag :slow
    test "huge list" do
      assert T.map(Enum.to_list(1..1_000_000), &(&1 + 1)) == Enum.to_list(2..1_000_001)
    end
  end

  describe "reduce" do
    test "empty list" do
      assert T.reduce([], 2, &(&1 + &2)) == 2
    end

    test "direction independent function applied to non-empty list" do
      assert T.reduce([1, 2, 3, 4], 5, &(&1 + &2)) == 15
    end

    test "direction dependent function applied to non-empty list" do
      assert T.reduce([1, 2, 3, 4], 24, &(&1 / &2)) == 64
    end

    @tag :slow
    test "huge list" do
      assert T.reduce(Enum.to_list(1..1_000_000), 0, &(&1 + &2)) ==
               List.foldl(Enum.to_list(1..1_000_000), 0, &(&1 + &2))
    end
  end

  describe "any?" do
    test "empty list" do
      assert T.any?([]) == false
    end

    test "list contains true" do
      assert T.any?([true]) == true
    end

    test "list contains false" do
      assert T.any?([false]) == false
    end

    test "list contains true and false" do
      assert T.any?([true, false]) == true
      assert T.any?([false, true]) == true
    end

    test "list contains zero" do
      assert T.any?([0]) == true
    end
  end

  describe "all?" do
    test "empty list" do
      assert T.all?([]) == true
    end

    test "list contains true" do
      assert T.all?([true]) == true
    end

    test "list contains false" do
      assert T.all?([false]) == false
    end

    test "list contains true and false" do
      assert T.all?([true, false]) == false
      assert T.all?([false, true]) == false
    end

    test "list contains zero" do
      assert T.all?([0]) == true
    end
  end

  describe "count" do
    test "empty list" do
      assert T.count([]) == 0
    end

    test "normal list" do
      assert T.count([1, 2, 3, 4]) == 4
    end

    test "huge list" do
      assert T.count(Enum.to_list(1..1_000_000)) == 1_000_000
    end
  end
end

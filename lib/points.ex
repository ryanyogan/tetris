defmodule Tetris.Points do
  @spec translate(any, {any, any}) :: [any]
  def translate(points, {x, y}) do
    Enum.map(points, fn {dx, dy} ->
      {dx + x, dy + y}
    end)
  end

  @spec transpose(any) :: [any]
  def transpose(points) do
    Enum.map(points, fn {x, y} -> {y, x} end)
  end

  @spec mirror(any) :: [any]
  def mirror(points) do
    Enum.map(points, fn {x, y} -> {4 - x, y} end)
  end

  @spec rotate_90(any) :: [any]
  def rotate_90(points) do
    points
    |> transpose()
    |> mirror()
  end

  @spec rotate(any, non_neg_integer) :: any
  def rotate(points, 0), do: points

  def rotate(points, degrees) do
    points
    |> rotate_90()
    |> rotate(degrees - 90)
  end
end

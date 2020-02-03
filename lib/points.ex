defmodule Tetris.Points do
  @spec translate(any, {any, any}) :: [any]
  def translate(points, {x, y}) do
    Enum.map(points, fn {dx, dy} ->
      {dx + x, dy + y}
    end)
  end
end

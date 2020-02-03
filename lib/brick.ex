defmodule Tetris.Brick do
  defstruct name: :i,
            location: {40, 0},
            rotation: 0,
            reflection: false

  @spec new :: Tetris.Brick.t()
  def new(), do: Tetris.Brick.__struct__()

  @spec new_random :: Tetris.Brick.t()
  def new_random() do
    %__MODULE__{
      name: random_name(),
      location: {40, 0},
      rotation: random_rotation(),
      reflection: random_reflection()
    }
  end

  @spec random_name :: any
  def random_name() do
    ~w(i l z o t)a
    |> Enum.random()
  end

  @spec random_reflection :: any
  def random_reflection() do
    [true, false]
    |> Enum.random()
  end

  @spec random_rotation :: any
  def random_rotation() do
    [0, 90, 180, 270]
    |> Enum.random()
  end

  def down(brick) do
    %{brick | location: point_down(brick.location)}
  end

  def left(brick) do
    %{brick | location: point_left(brick.location)}
  end

  def right(brick) do
    %{brick | location: point_right(brick.location)}
  end

  def point_down({x, y}) do
    {x, y + 1}
  end

  def point_left({x, y}) do
    {x - 1, y}
  end

  def point_right({x, y}) do
    {x + 1, y}
  end

  def spin_90(brick) do
    %{brick | rotation: rotate(brick.rotation)}
  end

  def rotate(270), do: 0

  def rotate(degrees), do: degrees + 90
end
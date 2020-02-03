defmodule Tetris.Brick do
  defstruct name: :i,
            location: {40, 0},
            rotation: 0,
            reflection: false

  @spec new :: Tetris.Brick.t()
  def new(), do: Tetris.Brick.__struct__()

  @spec new_random :: %{location: {40, 0}, name: any, reflection: false, rotation: 0}
  def new_random() do
    %{
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
end

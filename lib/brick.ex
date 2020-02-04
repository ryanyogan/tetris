defmodule Tetris.Brick do
  alias Tetris.Points

  defstruct name: :i,
            location: {40, 0},
            rotation: 0,
            reflection: false

  @spec new(any) :: any
  def new(attributes \\ []), do: __struct__(attributes)

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

  @spec down(%{location: {any, number}}) :: %{location: {any, number}}
  def down(brick) do
    %{brick | location: point_down(brick.location)}
  end

  @spec left(%{location: {number, any}}) :: %{location: {number, any}}
  def left(brick) do
    %{brick | location: point_left(brick.location)}
  end

  @spec right(%{location: {number, any}}) :: %{location: {number, any}}
  def right(brick) do
    %{brick | location: point_right(brick.location)}
  end

  @spec point_down({any, number}) :: {any, number}
  def point_down({x, y}) do
    {x, y + 1}
  end

  @spec point_left({number, any}) :: {number, any}
  def point_left({x, y}) do
    {x - 1, y}
  end

  @spec point_right({number, any}) :: {number, any}
  def point_right({x, y}) do
    {x + 1, y}
  end

  @spec spin_90(%{rotation: number}) :: %{rotation: number}
  def spin_90(brick) do
    %{brick | rotation: rotate(brick.rotation)}
  end

  @spec rotate(number) :: number
  def rotate(270), do: 0
  def rotate(degrees), do: degrees + 90

  @spec shape(%{name: :i | :l | :o | :t | :z}) :: [{2 | 3, 1 | 2 | 3 | 4}, ...]
  def shape(%{name: :i}), do: [{2, 1}, {2, 2}, {2, 3}, {2, 4}]
  def shape(%{name: :o}), do: [{2, 2}, {3, 2}, {2, 3}, {3, 3}]
  def shape(%{name: :z}), do: [{2, 2}, {2, 3}, {3, 3}, {3, 4}]
  def shape(%{name: :l}), do: [{2, 1}, {2, 2}, {2, 3}, {3, 3}]
  def shape(%{name: :t}), do: [{2, 1}, {2, 2}, {3, 2}, {2, 3}]

  @spec to_string(%{name: :i | :l | :o | :t | :z}) :: binary
  def to_string(brick) do
    brick
    |> shape()
    |> Points.to_string()
  end

  @spec print(%{name: :i | :l | :o | :t | :z}) :: %{name: :i | :l | :o | :t | :z}
  def print(brick) do
    brick
    |> shape()
    |> Points.print()

    brick
  end
end

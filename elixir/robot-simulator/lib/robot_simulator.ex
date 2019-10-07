defmodule RobotSimulator do
  @type direction :: :north | :south | :east | :west
  @type position :: {integer, integer}
  @type robot :: %{direction: direction(), x: integer(), y: integer()}

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: position()) :: robot()
  def create(direction \\ :north, position \\ {0, 0})

  def create(direction, _position) when direction not in [:north, :south, :east, :west] do
    {:error, "invalid direction"}
  end

  def create(direction, {x, y}) when is_integer(x) and is_integer(y) do
    %{
      direction: direction,
      x: x,
      y: y
    }
  end

  def create(_direction, _position) do
    {:error, "invalid position"}
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: robot(), instructions :: String.t()) :: robot()
  def simulate(robot, instructions) do
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: robot()) :: direction()
  def direction(%{direction: :north}), do: :north
  def direction(%{direction: :south}), do: :south
  def direction(%{direction: :east}), do: :east
  def direction(%{direction: :west}), do: :west

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: robot()) :: position()
  def position(%{x: x, y: y}), do: {x, y}
end

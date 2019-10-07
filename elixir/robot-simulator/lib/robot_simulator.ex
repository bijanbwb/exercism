defmodule RobotSimulator do
  # Types

  @type direction :: :north | :east | :south | :west
  @type position :: {integer, integer}
  @type robot :: %{direction: direction(), x: integer(), y: integer()}

  # Valid Options
  @valid_directions [:north, :east, :south, :west]
  @valid_instructions ["A", "L", "R"]

  @doc """
  Create a Robot Simulator given an initial direction and position.
  """
  @spec create(direction :: direction(), position :: position()) :: robot()
  def create(direction \\ :north, position \\ {0, 0})

  def create(direction, _position) when direction not in @valid_directions do
    {:error, "invalid direction"}
  end

  def create(direction, {x, y}) when is_integer(x) and is_integer(y) do
    %{
      direction: direction,
      position: {x, y}
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
    instruction_list = String.graphemes(instructions)

    instruction_list
    |> Enum.all?(&(&1 in @valid_instructions))
    |> case do
      true -> Enum.reduce(instruction_list, robot, &run_simulation_step/2)
      false -> {:error, "invalid instruction"}
    end
  end

  @spec run_simulation_step(letter :: String.t(), robot :: robot()) :: robot()
  def run_simulation_step(letter, robot) do
    case letter do
      "A" -> %{robot | position: change_position(robot[:direction], robot[:position])}
      "L" -> %{robot | direction: change_direction(robot[:direction], "L")}
      "R" -> %{robot | direction: change_direction(robot[:direction], "R")}
    end
  end

  @spec change_direction(direction :: direction(), letter :: String.t()) :: direction()
  def change_direction(direction, "L") do
    @valid_directions
    |> Enum.reverse()
    |> Stream.cycle()
    |> Stream.drop_while(&(&1 != direction))
    |> Stream.take(2)
    |> Enum.to_list()
    |> Enum.at(1)
  end

  def change_direction(direction, "R") do
    @valid_directions
    |> Stream.cycle()
    |> Stream.drop_while(&(&1 != direction))
    |> Stream.take(2)
    |> Enum.to_list()
    |> Enum.at(1)
  end

  @spec change_position(direction :: direction(), position :: position()) :: position()
  def change_position(:north, {x, y}), do: {x, y + 1}
  def change_position(:east, {x, y}), do: {x + 1, y}
  def change_position(:south, {x, y}), do: {x, y - 1}
  def change_position(:west, {x, y}), do: {x - 1, y}

  @doc """
  Return the robot's direction.
  """
  @spec direction(robot :: robot()) :: direction()
  def direction(%{direction: :north}), do: :north
  def direction(%{direction: :east}), do: :east
  def direction(%{direction: :south}), do: :south
  def direction(%{direction: :west}), do: :west

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: robot()) :: position()
  def position(%{position: {x, y}}), do: {x, y}
end

defmodule Robot do
  # @enforce_keys: [:direction, :position]
  defstruct [:direction, :position]
end

defmodule RobotSimulator do
  alias Robot

  # Types

  @type direction :: :north | :east | :south | :west
  @type position :: {integer, integer}
  @type robot :: %Robot{direction: direction(), position: position()}

  # Valid Options

  @valid_directions [:north, :east, :south, :west]
  @valid_instructions ["A", "L", "R"]

  @doc """
  Create a Robot Simulator given an initial direction and position.
  """
  @spec create(direction :: direction(), position :: position()) :: robot() | {:error, String.t()}
  def create(direction \\ :north, position \\ {0, 0})

  def create(direction, _position) when direction not in @valid_directions do
    {:error, "invalid direction"}
  end

  def create(direction, {x, y}) when is_integer(x) and is_integer(y) do
    %Robot{
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
      "A" -> %Robot{robot | position: change_position(robot)}
      "L" -> %Robot{robot | direction: change_direction(robot, "L")}
      "R" -> %Robot{robot | direction: change_direction(robot, "R")}
    end
  end

  @spec change_direction(robot :: robot(), letter :: String.t()) :: direction()
  def change_direction(%Robot{direction: direction}, "L") do
    @valid_directions
    |> Enum.reverse()
    |> Stream.cycle()
    |> Stream.drop_while(&(&1 != direction))
    |> Enum.take(2)
    |> Enum.at(1)
  end

  def change_direction(%Robot{direction: direction}, "R") do
    @valid_directions
    |> Stream.cycle()
    |> Stream.drop_while(&(&1 != direction))
    |> Enum.take(2)
    |> Enum.at(1)
  end

  @spec change_position(robot :: robot()) :: position()
  def change_position(%Robot{direction: :north, position: {x, y}}), do: {x, y + 1}
  def change_position(%Robot{direction: :east, position: {x, y}}), do: {x + 1, y}
  def change_position(%Robot{direction: :south, position: {x, y}}), do: {x, y - 1}
  def change_position(%Robot{direction: :west, position: {x, y}}), do: {x - 1, y}

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

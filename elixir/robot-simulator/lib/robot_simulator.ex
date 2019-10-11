defmodule Robot do
  @enforce_keys [:direction, :position]
  defstruct [:direction, :position]
end

defmodule RobotSimulator do
  @type direction :: :north | :east | :south | :west
  @type instruction :: ?A | ?L | ?R
  @type position :: {integer, integer}
  @type robot :: %Robot{direction: direction(), position: position()}

  @valid_directions [:north, :east, :south, :west]
  @valid_instructions [?A, ?L, ?R]

  defguard is_direction(direction) when direction in @valid_directions
  defguard is_instruction(instruction) when instruction in @valid_instructions

  @doc """
  Create a Robot Simulator given an initial direction and position.
  """
  @spec create(direction(), position()) :: robot() | {:error, String.t()}
  def create(direction \\ :north, position \\ {0, 0})

  def create(direction, _position) when not is_direction(direction) do
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
  @spec simulate(robot(), String.t()) :: robot()
  def simulate(%Robot{} = robot, instructions) do
    instruction_list = String.to_charlist(instructions)

    instruction_list
    |> Enum.all?(&(&1 in @valid_instructions))
    |> case do
      true -> Enum.reduce(instruction_list, robot, &run_simulation_step/2)
      false -> {:error, "invalid instruction"}
    end
  end

  @spec run_simulation_step(instruction(), robot()) :: robot()
  def run_simulation_step(?A, %Robot{} = robot),
    do: %Robot{robot | position: change_position(robot)}

  def run_simulation_step(letter, %Robot{} = robot) do
    %Robot{robot | direction: change_direction(robot, letter)}
  end

  @spec change_direction(robot(), instruction()) :: direction()
  def change_direction(%Robot{direction: :north}, ?L), do: :west
  def change_direction(%Robot{direction: :east}, ?L), do: :north
  def change_direction(%Robot{direction: :south}, ?L), do: :east
  def change_direction(%Robot{direction: :west}, ?L), do: :south
  def change_direction(%Robot{direction: :north}, ?R), do: :east
  def change_direction(%Robot{direction: :east}, ?R), do: :south
  def change_direction(%Robot{direction: :south}, ?R), do: :west
  def change_direction(%Robot{direction: :west}, ?R), do: :north

  @spec change_position(robot()) :: position()
  def change_position(%Robot{direction: :north, position: {x, y}}), do: {x, y + 1}
  def change_position(%Robot{direction: :east, position: {x, y}}), do: {x + 1, y}
  def change_position(%Robot{direction: :south, position: {x, y}}), do: {x, y - 1}
  def change_position(%Robot{direction: :west, position: {x, y}}), do: {x - 1, y}

  @doc """
  Return the robot's direction.
  """
  @spec direction(robot()) :: direction()
  def direction(%Robot{direction: :north}), do: :north
  def direction(%Robot{direction: :east}), do: :east
  def direction(%Robot{direction: :south}), do: :south
  def direction(%Robot{direction: :west}), do: :west

  @doc """
  Return the robot's position.
  """
  @spec position(robot()) :: position()
  def position(%Robot{position: {x, y}}), do: {x, y}
end

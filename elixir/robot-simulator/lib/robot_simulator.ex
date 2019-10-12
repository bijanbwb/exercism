defmodule Robot do
  @enforce_keys [:direction, :position]
  defstruct [:direction, :position]
end

defmodule RobotSimulator do
  @type direction :: :north | :east | :south | :west
  @type position :: {integer(), integer()}
  @type robot :: %Robot{direction: direction(), position: position()}

  @valid_directions [:north, :east, :south, :west]
  @valid_instructions ["A", "L", "R"]

  defguard is_direction(direction) when direction in @valid_directions
  defguard is_instruction(instruction) when instruction in @valid_instructions
  defguard is_position(position)
    when is_tuple(position)
    and tuple_size(position) == 2
    and elem(position, 0) |> is_integer()
    and elem(position, 1) |> is_integer()

  @doc """
  Create a Robot Simulator given an initial direction and position.
  """
  @spec create(direction(), position()) :: robot() | {:error, String.t()}
  def create(direction \\ :north, position \\ {0, 0})

  def create(direction, _position) when not is_direction(direction),
    do: {:error, "invalid direction"}

  def create(direction, position) when is_position(position),
    do: %Robot{direction: direction, position: position}

  def create(_direction, _position), do: {:error, "invalid position"}

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot(), String.t()) :: robot()
  def simulate(%Robot{} = robot, instructions),
    do:
      instructions
      |> String.graphemes()
      |> Enum.reduce_while(robot, &run_simulation_step/2)

  @spec run_simulation_step(String.t(), robot()) :: {:cont, robot()} | {:error, String.t()}
  def run_simulation_step(letter, %Robot{} = robot)
      when letter in @valid_instructions and letter == "A",
      do: {:cont, change_position(robot)}

  def run_simulation_step(letter, %Robot{} = robot)
      when letter in @valid_instructions,
      do: {:cont, change_direction(robot, letter)}

  def run_simulation_step(_letter, _robot),
    do: {:halt, {:error, "invalid instruction"}}

  @spec change_position(robot()) :: robot()
  def change_position(%Robot{direction: :north, position: {x, y}} = robot), do: %Robot{robot | position: {x, y + 1}}
  def change_position(%Robot{direction: :east, position: {x, y}} = robot), do: %Robot{robot | position: {x + 1, y}}
  def change_position(%Robot{direction: :south, position: {x, y}} = robot), do: %Robot{robot | position: {x, y - 1}}
  def change_position(%Robot{direction: :west, position: {x, y}} = robot), do: %Robot{robot | position: {x - 1, y}}

  @spec change_direction(robot(), String.t()) :: robot()
  def change_direction(%Robot{direction: :north} = robot, "L"), do: %Robot{robot | direction: :west}
  def change_direction(%Robot{direction: :east} = robot, "L"), do: %Robot{robot | direction: :north}
  def change_direction(%Robot{direction: :south} = robot, "L"), do: %Robot{robot | direction: :east}
  def change_direction(%Robot{direction: :west} = robot, "L"), do: %Robot{robot | direction: :south}
  def change_direction(%Robot{direction: :north} = robot, "R"), do: %Robot{robot | direction: :east}
  def change_direction(%Robot{direction: :east} = robot, "R"), do: %Robot{robot | direction: :south}
  def change_direction(%Robot{direction: :south} = robot, "R"), do: %Robot{robot | direction: :west}
  def change_direction(%Robot{direction: :west} = robot, "R"), do: %Robot{robot | direction: :north}

  @doc """
  Return the robot's direction.
  """
  @spec direction(robot()) :: direction()
  def direction(%Robot{} = robot), do: robot.direction

  @doc """
  Return the robot's position.
  """
  @spec position(robot()) :: position()
  def position(%Robot{} = robot), do: robot.position
end

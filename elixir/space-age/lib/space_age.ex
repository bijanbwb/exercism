defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(:mercury, seconds), do: years(seconds, 0.2408467)
  def age_on(:venus, seconds), do: years(seconds, 0.61519726)
  def age_on(:earth, seconds), do: years(seconds, 1)
  def age_on(:mars, seconds), do: years(seconds, 1.8808158)
  def age_on(:jupiter, seconds), do: years(seconds, 11.862615)
  def age_on(:saturn, seconds), do: years(seconds, 29.447498)
  def age_on(:uranus, seconds), do: years(seconds, 84.016846)
  def age_on(:neptune, seconds), do: years(seconds, 164.79132)

  @spec years(pos_integer, float) :: float
  defp years(seconds, orbital_period) do
    # seconds -> minutes -> hours -> days -> years -> planet years
    seconds / 60 / 60 / 24 / 365.25 / orbital_period
  end
end

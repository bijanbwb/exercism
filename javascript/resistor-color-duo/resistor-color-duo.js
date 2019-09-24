let resistanceValues = {
  black: 0,
  brown: 1,
  red: 2,
  orange: 3,
  yellow: 4,
  green: 5,
  blue: 6,
  violet: 7,
  grey: 8,
  white: 9
}

export const value = (input) => {
  let resistance =
    input
      .slice(0, 2)
      .map(color => String(resistanceValues[color]))
      .reduceRight((string, acc) => acc + string);

  return Number(resistance);
};

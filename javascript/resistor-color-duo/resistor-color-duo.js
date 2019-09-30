const colors = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"];
export const value = (input) => Number(`${colors.indexOf(input[0])}${colors.indexOf(input[1])}`);

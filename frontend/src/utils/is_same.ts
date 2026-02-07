export const isSame = (a: number, b: number, epsilon: number = 0.1): boolean => {
    return Math.abs(a - b) < epsilon;
};

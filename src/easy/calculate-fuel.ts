export const calculateFuel = (distance: number): number =>
    distance < 10 ? 100 : distance * 10;

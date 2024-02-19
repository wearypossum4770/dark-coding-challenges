export const orbitalPeriods = (planet: string): number => {
    switch (planet) {
        default:
            return 1;
        case "mercury":
            return 0.2408467;
        case "venus":
            return 0.61519726;
        case "mars":
            return 1.8808158;
        case "jupiter":
            return 11.862615;
        case "saturn":
            return 29.447498;
        case "uranus":
            return 84.016846;
        case "neptune":
            return 164.79132;
    }
};
export const calculateYears = (planet: string): number =>
    31_557_600 * orbitalPeriods(planet);
export const spaceAge = (planet: unknown, seconds: unknown): number => {
    if (typeof planet === "string" && typeof seconds === "number")
        return Number((seconds / calculateYears(planet)).toFixed(2));
    return 0;
};

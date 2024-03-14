export const acceptIntoMovie = (age: number, isSupervised: boolean): boolean =>
    age < 15 ? isSupervised : true;

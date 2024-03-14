export const shouldServeDrinks = (age: number, onBreak: boolean): boolean =>
    age >= 18 ? !onBreak : false;

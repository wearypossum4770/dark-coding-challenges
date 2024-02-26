export const raindrops = (drop: number): string => {
    const modulus = [3, 5, 7];
    const target = ["Pling", "Plang", "Plong"].reduce(
        (a: string, c: string, i: number) =>
            drop % modulus[i] !== 0 ? a : a + c,
        "",
    );
    return target.length > 0 ? target : `${drop}`;
};

export const compareTriplets = (alice: number[], bob: number[]): number[] => {
    const score = [0, 0];
    alice.forEach((_, idx) => {
        if (alice[idx] > bob[idx]) {
            score[0] += 1;
        } else if (alice[idx] < bob[idx]) {
            score[1] += 1;
        }
    });
    return score;
};

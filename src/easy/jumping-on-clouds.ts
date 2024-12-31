export const jumpingOnClouds = (clouds: number[], jump: number) => {
    let energyLevel = 100;
    let position = 0;
    do {
        position = (position + jump) % clouds.length;
        energyLevel -= 1;
        if (clouds.at(position) === 2) {
            energyLevel -= 2;
        }
    } while (position !== 0);
    return energyLevel;
};

// console.log(jumpingOnClouds([0,0,1,0], 2), 4, 96)
console.log(jumpingOnClouds([1, 1, 1, 0, 1, 1, 0, 0, 0, 0], 3), 10, 80);
// console.log(jumpingOnClouds([0, 0, 1, 0, 0, 1, 1, 0], 2,), 8, 92)

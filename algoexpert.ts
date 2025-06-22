import { readFile } from "node:fs/promises";

const data = JSON.parse(await readFile("./app/fixtures/algoexpert.io.json"));
const free = data.reduce(
    (array, { acl, difficulty, uid, name }) =>
        !acl.isFreeForStudents
            ? array
            : array.concat({ uid, name, difficulty }),
    [],
);
console.log(free);

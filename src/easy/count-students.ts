export const countStudents = (
    students: number[],
    sandwiches: number[],
): number => {
    let count = 0;
    while (students.length > 0 && sandwiches.length > 0) {
        if (count == sandwiches.length) break;
        if (students[0] == sandwiches[0]) {
            students.shift();
            sandwiches.shift();
            count = 0;
        } else {
            students.push(students.shift() ?? 0);
            count++;
        }
    }

    return students.length;
};

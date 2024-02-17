/**
 * @copyright https://www.hackerrank.com/challenges/grading/problem?isFullScreen=true
 * @param grades
 * @returns
 */
export const gradingStudents = (grades: number[]): number[] => {
    return grades.reduce((accum: number[], grade: number) => {
        if (grade < 38) return [...accum, grade];
        const mod = grade % 5;
        if (mod < 3) return [...accum, grade];
        return [...accum, grade + 5 - mod];
    }, []);
};

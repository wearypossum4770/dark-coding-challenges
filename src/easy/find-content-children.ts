export const findContentChildren = (
    children: number[],
    cookies: number[],
): number => {
    children.sort((a, b) => a - b);
    cookies.sort((a, b) => a - b);
    let [i, j] = [0, 0];
    while (i < children.length && j < cookies.length) {
        if (cookies[j] >= children[i]) {
            i++;
        }
        j++;
    }
    return i;
};

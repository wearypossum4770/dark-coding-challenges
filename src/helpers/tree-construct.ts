export class Node<T> {
    val: T;
    left: Node<T> | null;
    right: Node<T> | null;
    constructor(
        val: T,
        left: Node<T> | null = null,
        right: Node<T> | null = null,
    ) {
        this.val = val;
        this.left = left;
        this.right = right;
    }
    static splitWords = (s: string): string[] => (s === "" ? [] : s.split(" "));
}

export const preOrderTraversal = <T>(root: Node<T> | null): void => {
    if (root !== null) {
        postOrderTraversal(root.left);
        postOrderTraversal(root.right);
        console.log(root.val);
    }
};
export const inOrderTraversal = <T>(root: Node<T> | null): void => {
    if (root !== null) {
        inOrderTraversal(root.left);
        console.log(root.val);
        inOrderTraversal(root.right);
    }
};
export const postOrderTraversal = <T>(root: Node<T> | null): void => {
    if (
        root !== null &&
        (Object.hasOwn(root, "left") || Object.hasOwn(root, "right"))
    ) {
        postOrderTraversal(root.left);
        postOrderTraversal(root.right);
    }
};

export class FenwickTree {
    private tree: number[];
    private size: number;

    constructor(size: number) {
        this.size = size;
        this.tree = new Array(size + 1).fill(0); // 1-indexed
    }

    // add `value` at index `i` (1-indexed)
    update(i: number, value: number) {
        while (i <= this.size) {
            this.tree[i] += value;
            i += i & -i; // move to parent
        }
    }

    // prefix sum up to index `i` (1-indexed)
    query(i: number): number {
        let sum = 0;
        while (i > 0) {
            sum += this.tree[i];
            i -= i & -i; // move to parent
        }
        return sum;
    }

    // sum of range [l, r] (1-indexed)
    rangeQuery(l: number, r: number): number {
        return this.query(r) - this.query(l - 1);
    }

    // count of elements greater than i
    countGreater(i: number): number {
        return this.query(this.size) - this.query(i);
    }
}

export class TreeNode {
    val: number
    left: TreeNode | null
    right: TreeNode | null
    constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
        this.val = val ?? 0 
        this.left = left ?? null 
        this.right = right ?? null 
    }
fromArray(nums: (number | null)[]): TreeNode | null {
    if (nums.length === 0 || nums[0] === null) return null

    const root = new TreeNode(nums[0])
    const queue: TreeNode[] = [root]
    let i = 1

    while (i < nums.length) {
        const current = queue.shift()
        if (!current) return root

        const left = nums[i++]
        if (left !== null && left !== undefined) {
            current.left = new TreeNode(left)
            queue.push(current.left)
        }

        const right = nums[i++]
        if (right !== null && right !== undefined) {
            current.right = new TreeNode(right)
            queue.push(current.right)
        }
    }

    return root
}

    }
export class ListNode<T> {
    val: T | null;
    next: ListNode<T> | null;

    constructor(val: T | null = null, next: ListNode<T> | null = null) {
        this.val = val;
        this.next = next;
    }

    static fromArray<T>(nums: T[] | null): ListNode<T> | null {
        if (!Array.isArray(nums) || nums.length === 0) return null;

        const dummy = new ListNode<T>(null);
        let current = dummy;

        for (const num of nums) {
            current.next = new ListNode<T>(num);
            current = current.next;
        }

        return dummy.next;
    }

    static toArray<T>(head: ListNode<T> | null): T[] {
        const result: T[] = [];
        let current = head;

        while (current !== null) {
            if (current.val !== null) {
                result.push(current.val);
            }
            current = current.next;
        }

        return result;
    }
}

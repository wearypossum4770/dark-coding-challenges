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

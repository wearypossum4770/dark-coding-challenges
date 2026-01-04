class Graph {
    adjacencyList: Map<string, string[]>;
    constructor() {
        this.adjacencyList = new Map();
    }
    addVertex(vertex: string): void {
        if (!this.adjacencyList.has(vertex)) {
            this.adjacencyList.set(vertex, []);
        }
    }
    display(): void {
        for (const [vertex, neighbors] of this.adjacencyList) {
            console.log(`${vertex} -> ${neighbors.join(", ")}`);
        }
    }
    addEdge(first: string, second: string): void {
        if (this.adjacencyList.has(first)) {
            this.adjacencyList.get(first)?.push(second);
        } else {
            this.adjacencyList.set(first, [second]);
        }
        if (this.adjacencyList.has(second)) {
            this.adjacencyList.get(second)?.push(first);
        } else {
            this.adjacencyList.set(second, [first]);
        }
    }
    removeEdge(first: string, second: string): void {}
}

const graph = new Graph();
graph.addVertex("A");
graph.addVertex("B");
graph.addVertex("C");
graph.addVertex("D");
graph.addEdge("E", "D");
graph.addEdge("A", "B");
graph.addEdge("A", "C");
graph.addEdge("B", "D");
graph.addEdge("C", "D");
console.log(graph);

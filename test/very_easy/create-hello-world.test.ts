import { describe, test, expect } from "bun:test";
import { createHelloWorld } from "@/src/very_easy/create-hello-world";
describe("createHelloWorld", () => {
test("Create hello world", () => {
const result = createHelloWorld();
expect(result()).toStrictEqual("Hello World");
}); 
});
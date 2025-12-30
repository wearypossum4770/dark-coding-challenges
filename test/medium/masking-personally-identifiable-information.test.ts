import { describe, test, expect } from "bun:test";
import { maskingPersonallyIdentifiableInformation } from "@/src/medium/masking-personally-identifiable-information";
describe("maskingPersonallyIdentifiableInformation", () => {
test.each([
		["LeetCode@LeetCode.com", "l*****e@leetcode.com"],
		["AB@qq.com", "a*****b@qq.com"],
		["a@b.com", "a*****@b.com"],
		["John.Doe@Example.COM", "j*****e@example.com"],
		["X@Y.Z", "x*****@y.z"],
		["1234567890", "***-***-7890"],
		["1(234)567-890", "***-***-7890"],
		["86-(10)12345678", "+**-***-***-5678"],
		["+86(88)1513-7-74", "+*-***-***-3774"],
		["(123) 456 7890", "***-***-7890"],
		["123-45-67890", "***-***-7890"],
		["0000000000", "***-***-0000"],
		["+000000000000", "+**-***-***-0000"],
		["Z@Z.Z", "z*****@z.z"],
])("\n\tGiven: the PII %s.\n\tThen: properly masked it is %s.", (inputs: string, output: string) => {
const result = maskingPersonallyIdentifiableInformation(inputs);
expect(result).toStrictEqual(output);
});
});
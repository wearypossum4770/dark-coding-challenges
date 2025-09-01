import { exec } from "node:child_process";
import { writeFile, mkdir, readdir, access, exists } from "node:fs/promises";
import path from "node:path";
import { fileURLToPath } from "node:url";
import prompts, { type PromptObject, type Answers } from "prompts";
import {
    camelCase,
    snakeCase,
    kebabCase,
    pascalCase,
    capitalCase,
} from "change-case";
export type CommitType =
    | "chore"
    | "feat"
    | "fix"
    | "refactor"
    | "test"
    | "doc"
    | "style"
    | "perf"
    | "ci"
    | "build"
    | "merge"
    | "security"
    | "i18n"
    | "updater"
    | "experiment";
export type CommitSubType =
    | "config"
    | "deps"
    | "tooling"
    | "maintenance"
    | "lint"
    | "format"
    | "release"
    | "versioning";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const noop = () => void true;
const baseDir = "src";
export type ModuleMetaData = {
    difficulty: string;
    filename: string;
};
export type ChallengeSkeleton = {
    difficulty: string;
    extension: string;
    challengeName: string;
    languages: string;
    pathname: string;
};
export type DifficultyType =
    | "easy"
    | "expert"
    | "hard"
    | "medium"
    | "advanced"
    | "very_easy"
    | "very_hard";
const allowedDirectories = new Set<DifficultyType>([
    "easy",
    "expert",
    "hard",
    "medium",
    "advanced",
    "very_easy",
    "very_hard",
]);

const createZig = ({ challengeName }: ChallengeSkeleton): string => {
    const name = camelCase(challengeName ?? "");
    return `const std = @import("std");\nconst expectEqualSlices = std.testing.expectEqualSlices;\nconst expectEqual = std.testing.expectEqual;\n\npub fn ${name}(param: i32) i32 {\n\treturn param;\n}\n`;
};
const determineBaseDirectory = ({
    languages,
    difficulty,
}: ChallengeSkeleton): [string, string] => {
    if (languages.includes("all")) return ["all", "all"];
    switch (languages) {
        default:
            return [`src/${difficulty}`, `src/${difficulty}`];
        case "typescript":
            return [`src/${difficulty}`, `test/${difficulty}`];

        case "dart":
            return [`lib/${difficulty}`, `test/${difficulty}`];
        case "python":
        case "go":
            return [difficulty, difficulty];
        case "swift":
            return [
                `src/${difficulty}`,
                `test/${snakeCase(difficulty).replaceAll("_", "")}swift`,
            ];
        case "php":
            return [
                `src/main/${languages}/${pascalCase(difficulty)}`,
                `test/${difficulty}`,
            ];
        case "kotlin":
        case "java":
            return [
                `src/main/${languages}/${difficulty}`,
                `src/test/${languages}/${difficulty}`,
            ];
        case "c":
        case "cpp":
        case "csharp":
            return [`src/${languages}/${difficulty}`, `test/${languages}/${difficulty}`];
    }
};
const createRust = ({ challengeName }: ChallengeSkeleton): string => {
    const name = snakeCase(challengeName ?? "");
    return `pub fn ${name}() -> bool {\n//\n\n}\n#[cfg(test)]\nmod tests {\nuse super::${name};\nuse rstest::rstest;\n#[rstest]\nfn test_${name}() {\nassert_eq!(${name}(parameters), returnvalue);\n}\n}`;
};

const createTypeScript = ({ challengeName }: ChallengeSkeleton): string =>
    `export const ${camelCase(challengeName ?? "")} = () => {}`;

const createTypeScriptTest = ({
    difficulty,
    challengeName,
}: ChallengeSkeleton) => {
    const name = camelCase(challengeName ?? "");
    const filename = kebabCase(challengeName ?? "");
    return `import { describe, test, expect } from "bun:test";\nimport { ${name} } from "@/src/${difficulty}/${filename}";\ndescribe("${name}", () => {\ntest.each([])("", (inputs, output) => {\nconst result = ${name}(inputs);\nexpect(result).toStrictEqual(output);\n});\n});`;
};
// Create C source file
const createC = ({ challengeName }: ChallengeSkeleton): string => {
    const name = camelCase(challengeName ?? "");
    return `#include <stdio.h>\n\nint ${name}(int param) {\n    return param;\n}\n`;
};

// Create C test file (using a simple test framework like minunit)
const createCTest = ({ challengeName, difficulty }: ChallengeSkeleton): string => {
    const name = camelCase(challengeName ?? "");
    return `#include <stdio.h>\n#include "${name}.h"\n\n#define mu_assert(message, test) do { if (!(test)) return message; } while (0)\n#define mu_run_test(test) do { char *message = test(); tests_run++; if (message) return message; } while (0)\n\nint tests_run = 0;\n\nstatic char *test_${name}() {\n    mu_assert("Test failed: ${name} should return input", ${name}(42) == 42);\n    return 0;\n}\n\nstatic char *all_tests() {\n    mu_run_test(test_${name});\n    return 0;\n}\n\nint main() {\n    char *result = all_tests();\n    if (result != 0) {\n        printf("%s\\n", result);\n    } else {\n        printf("ALL TESTS PASSED\\n");\n    }\n    printf("Tests run: %d\\n", tests_run);\n    return result != 0;\n}\n`;
};

// Create C header file
const createCHeader = ({ challengeName }: ChallengeSkeleton): string => {
    const name = camelCase(challengeName ?? "");
    return `#ifndef ${name.toUpperCase()}_H\n#define ${name.toUpperCase()}_H\n\nint ${name}(int param);\n\n#endif\n`;
};

// Create C++ source file
const createCpp = ({ challengeName }: ChallengeSkeleton): string => {
    const name = camelCase(challengeName ?? "");
    return `#include <string>\n\nint ${name}(int param) {\n    return param;\n}\n`;
};

// Create C++ test file (using a simple assert-based test)
const createCppTest = ({ challengeName, difficulty }: ChallengeSkeleton): string => {
    const name = camelCase(challengeName ?? "");
    return `#include <cassert>\n#include "${name}.h"\n\nint main() {\n    assert(${name}(42) == 42 && "Test failed: ${name} should return input");\n    return 0;\n}\n`;
};

// Create C++ header file
const createCppHeader = ({ challengeName }: ChallengeSkeleton): string => {
    const name = camelCase(challengeName ?? "");
    return `#ifndef ${name.toUpperCase()}_H\n#define ${name.toUpperCase()}_H\n\nint ${name}(int param);\n\n#endif\n`;
};

// Create C# source file
const createCSharp = ({ challengeName, difficulty }: ChallengeSkeleton): string => {
    const className = pascalCase(challengeName ?? "");
    return `namespace ${pascalCase(difficulty)};\n\npublic class ${className} {\n    public int Solve(int param) {\n        return param;\n    }\n}\n`;
};

// Create C# test file (using xUnit)
const createCSharpTest = ({ challengeName, difficulty }: ChallengeSkeleton): string => {
    const className = pascalCase(challengeName ?? "");
    return `using Xunit;\nusing ${pascalCase(difficulty)};\n\npublic class ${className}Tests {\n    [Theory]\n    [InlineData(42, 42)]\n    public void Solve_ShouldReturnInput(int input, int expected) {\n        var instance = new ${className}();\n        var result = instance.Solve(input);\n        Assert.Equal(expected, result);\n    }\n}\n`;
};

// Create C# .csproj file
const createCSharpCsproj = ({ difficulty }: ChallengeSkeleton): string => {
    return `<Project Sdk="Microsoft.NET.Sdk">\n  <PropertyGroup>\n    <TargetFramework>net9.0</TargetFramework>\n    <ImplicitUsings>enable</ImplicitUsings>\n    <Nullable>enable</Nullable>\n  </PropertyGroup>\n</Project>`;
};

// Create C# test .csproj file
const createCSharpTestCsproj = ({ difficulty }: ChallengeSkeleton): string => {
    return `<Project Sdk="Microsoft.NET.Sdk">\n  <PropertyGroup>\n    <TargetFramework>net9.0</TargetFramework>\n    <ImplicitUsings>enable</ImplicitUsings>\n    <Nullable>enable</Nullable>\n    <IsTestProject>true</IsTestProject>\n  </PropertyGroup>\n  <ItemGroup>\n    <PackageReference Include="xunit" Version="2.9.2" />\n    <PackageReference Include="xunit.runner.visualstudio" Version="2.9.2" />\n    <PackageReference Include="Microsoft.NET.Test.Sdk" Version="17.11.1" />\n  </ItemGroup>\n  <ItemGroup>\n    <ProjectReference Include="..\\${difficulty}\\${difficulty}.csproj" />\n  </ItemGroup>\n</Project>`;
};

// Create Makefile for C
const createCMakefile = ({ challengeName }: ChallengeSkeleton): string => {
    const name = snakeCase(challengeName ?? "");
    return `CC = gcc\nCFLAGS = -Wall -g\nTARGET = ${name}\n\nall: $(TARGET)\n\n$(TARGET): ${name}.c ${name}.h\n\t$(CC) $(CFLAGS) -o $(TARGET) ${name}.c test_${name}.c\n\nclean:\n\trm -f $(TARGET)\n`;
};

// Create Makefile for C++
const createCppMakefile = ({ challengeName }: ChallengeSkeleton): string => {
    const name = snakeCase(challengeName ?? "");
    return `CXX = g++\nCXXFLAGS = -Wall -g\nTARGET = ${name}\n\nall: $(TARGET)\n\n$(TARGET): ${name}.cpp ${name}.h\n\t$(CXX) $(CXXFLAGS) -o $(TARGET) ${name}.cpp test_${name}.cpp\n\nclean:\n\trm -f $(TARGET)\n`;
};
const createJava = ({
    challengeName,
    difficulty,
}: ChallengeSkeleton): string => {
    const className = pascalCase(challengeName ?? "");
    return `package ${difficulty.toLowerCase()};\npublic class ${className} {\n\n// Add your fields, constructors, and methods here.\n\npublic String solve(String input) {\n// Your implementation here\nreturn input;\n}}`;
};
const createJavaTestFiles = ({
    challengeName,
    difficulty,
}: ChallengeSkeleton): string => {
    const testName = pascalCase(challengeName ?? "");
    return `\npackage ${difficulty.toLowerCase()};\nimport java.util.stream.Stream;\nimport static org.junit.jupiter.api.Assertions.*;\nimport org.junit.jupiter.params.ParameterizedTest;\nimport org.junit.jupiter.params.provider.Arguments;\nimport org.junit.jupiter.params.provider.MethodSource;\n\npublic class ${testName}Test {\n${testName} instance = new ${testName}();\n@ParameterizedTest\n@MethodSource("data${testName}")\npublic void test${testName}(int[] nums, boolean expected) {\n\nboolean result = instance.solve(nums);\n\nassertEquals(expected, result);\n}\npublic static Stream<Arguments> data${testName}(){\n	return Stream.of();\n}\n}`;
};
const createKotlin = ({
    challengeName,
    difficulty,
}: ChallengeSkeleton): string => {
    const className = pascalCase(challengeName ?? "");
    return `package ${difficulty.toLowerCase().replace(/_/g, "")};\nfun kodee${className}(input: String): String  {\nreturn input\n}`;
};
const createKotlinTestFiles = ({
    challengeName,
    difficulty,
}: ChallengeSkeleton): string => {
    const testName = pascalCase(challengeName ?? "");
    return `\npackage ${difficulty.toLowerCase().replace(/_/g, "")}\nimport org.junit.jupiter.params.ParameterizedTest\nimport org.junit.jupiter.params.provider.Arguments\nimport org.junit.jupiter.params.provider.MethodSource\nimport java.util.stream.Stream\nimport kotlin.test.assertEquals\n\nclass Kodee${testName}Test {\n@ParameterizedTest\n@MethodSource("${camelCase(challengeName ?? "")}Data")\nfun kodee${testName}Test(\nnumberToCheck: Int,\nexpected: Int,\n) {\nval result = kodee${testName}(numberToCheck)\nassertEquals(expected, result)\n}\ncompanion object {\n@JvmStatic\nfun ${camelCase(challengeName ?? "")}Data(): Stream<Arguments> =\nStream.of(\nArguments.of(2, 1),\n\n)\n}\n}`;
};
const createPython = ({ challengeName }: ChallengeSkeleton) => {
    const name = snakeCase(challengeName ?? "");
    return `def ${name}():\n\treturn None`;
};
const createPythonTestFiles = ({
    challengeName,
    difficulty,
}: ChallengeSkeleton) => {
    const name = snakeCase(challengeName ?? "");
    return `import pytest\nfrom ${difficulty}.${name} import ${name}\n@pytest.mark.parametrize("nums, expected",[])\ndef test_${name}(nums, expected):\n\tassert ${name}(nums) == expected`;
};
const createGo = ({ difficulty, challengeName }: ChallengeSkeleton) => {
    const name = pascalCase(challengeName ?? "");
    return `\npackage ${difficulty}\n\n\nfunc ${name}(something string) {\n}`;
    // modname.go
};
const createGoTests = ({ difficulty, challengeName }: ChallengeSkeleton) => {
    const name = pascalCase(challengeName ?? "");
    return `\npackage ${difficulty}\n\nimport (\n	"testing"\n)\n\nfunc Test${name}(t *testing.T) {\ncases := []struct {\nnum \tint\nexpected bool\n}{\n{true, true},\n}\nfor _, c := range cases {\nt.Run("", func(t *testing.T) {\nresult := ${name}(c.num)\nif result != c.expected {\nt.Errorf("${name}(%d) == %v, expected %v", c.input, result, c.expected)\n}\n\n})\n\n}\n}`;
};
const phpFileCreate = ({ difficulty, challengeName }: ChallengeSkeleton) => {
    const name = pascalCase(challengeName ?? "");
    return `<?php declare(strict_types=1);\n\nnamespace Src\\${pascalCase(difficulty ?? "")};\nclass ${name} {\npublic function transform${name}() {}\npublic function solve(int $n): array\n{\nreturn $this->transform${name}($n);\n}\n\n}`;
};
const phpTestCreate = ({ difficulty, challengeName }: ChallengeSkeleton) => {
    const name = pascalCase(challengeName ?? "");
    return `<?php\tdeclare(strict_types=1);\n\nuse Src\\${pascalCase(difficulty ?? "")}\\${name};\n\n
    dataset("${camelCase(challengeName ?? "")}Data", []);\nit('solve', function (int $n, int $expected) {\n$instance = new ${name}();\n\n$result = $instance->solve($n);\n\nexpect($result)->toBe($expected);\n\n})->with('${camelCase(challengeName)}Data');`;
};
const createSwift = ({ challengeName }: ChallengeSkeleton) => {
    const name = camelCase(challengeName ?? "");
    return `func ${name}()-> Void {}`;
};
const createSwiftTests = ({ difficulty, challengeName }: ChallengeSkeleton) => {
    const name = camelCase(challengeName ?? "");
    return `import Testing\n@testable import ${snakeCase(difficulty)}\n@Test(arguments: [])\nfunc ${name}Test(outcome: Int) {\n #expect(${name}() == outcome)\n}`;
};

const dartFileCreate = ({ difficulty, challengeName }: ChallengeSkeleton) =>
    `List<String> ${camelCase(challengeName ?? "")}(List<String> args) {\nreturn args\n}`;

const dartTestCreate = ({ difficulty, challengeName }: ChallengeSkeleton) =>
    `import 'package:test/test.dart';\nimport 'package:dark_coding_challenges/${difficulty}/${snakeCase(challengeName ?? "")}.dart';\nclass ${pascalCase(challengeName ?? "")}TestCases {\n\t${pascalCase(challengeName ?? "")}TestCases();\n}\nvoid main(){\ngroup("Feature:", () {\nfinal testCases = [];\n\nfor (final step in testCases) {\n// Safely cast values to List<int> for nums and expected\nfinal nums = step.nums;\ntest("Testing sum for $nums with target $target", () {\nList<int> result = ${camelCase(challengeName ?? "")}(nums, target);\nexpect(result, equals(expected));\n});\n}\n});}`;

const skeletonsKeys = new Map<string, [CallableFunction, CallableFunction]>([
    ["swift", [createSwift, createSwiftTests]],
    ["zig", [createZig, noop]],
    ["rust", [createRust, noop]],
    ["go", [createGo, createGoTests]],
    ["php", [phpFileCreate, phpTestCreate]],
    ["dart", [dartFileCreate, dartTestCreate]],
    ["typescript", [createTypeScript, createTypeScriptTest]],
    ["java", [createJava, createJavaTestFiles]],
    ["kotlin", [createKotlin, createKotlinTestFiles]],
    ["python", [createPython, createPythonTestFiles]],
    ["c", [createC, createCTest]],
    ["cpp", [createCpp, createCppTest]],
    ["csharp", [createCSharp, createCSharpTest]],
]);
const saveFile = async (pathname: string, data: string) => {
    try {
        await writeFile(pathname, data);
        await Promise.resolve(exec(`code ${pathname}`));
    } catch (error) {
        console.log(error);
    }
};

const onSubmit = (
    prompt: PromptObject<string>,
    answer: Answers<string>,
    answers: Answers<string>[],
): void => {
    console.log(`Answered ${prompt.name}: ${answer}`);
};

const onCancel = (): void => {};

const questions: PromptObject[] = [
    // {type: "select",name: "mainMenu",message: "What action do you want to complete",choices: [{ value: "colorizer", title: "Convert Color", },{ value: "scaffold", title: "Scaffold challenge files.", },]},
    {
        type: "multiselect",
        name: "languages",
        min: 1,
        message: "Select the languages to generate skeleton files for:",
        choices: [{ value: "all", title: "Select All" }].concat(
            [...skeletonsKeys.keys()].map((lang) => ({
                title: lang,
                value: lang,
            })),
        ),
    },
    {
        type: "select",
        name: "difficulty",
        message: "What type of problem is this?",
        choices: [...allowedDirectories].map((value) => ({
            value,
            title: capitalCase(value),
        })),
    },

    {
        name: "challengeName",
        type: "text",
        message: "What is the challenge name",
    },
];

const generateFilename = ({ challengeName, languages }: ChallengeSkeleton) => {
    const snake = snakeCase(challengeName);
    const tsName = kebabCase(challengeName);
    const jName = pascalCase(challengeName);
    switch (languages) {
        // case "flutter":
        // // Dash
        case "dart":
            return [snake, `${snake}_test`];
        // // Dash
        // case "dotnet":
        // // DotNe Bot
        //     break;
        // // rust - ferris
        // // Postgresql - Slonik
        // // Zig - Ziggy the Ziguana
        case "php":
            // elePHPant
            return [jName, `${jName}Test`];
        case "go":
            // gopher
            return [snake, `${snake}_test`];
        case "swift":
            return [jName, `${jName}Test`];
        case "typescript":
            return [tsName, `${tsName}.test`];
        case "python":
            return [snake, `test_${snake}`];
        case "java":
            // Duke
            return [jName, `${jName}Test`];
        case "kotlin":
            // Kodee
            return [`Kodee${jName}`, `Kodee${jName}Test`];
case "c":
            return [snake, `test_${snake}`];
        case "cpp":
            return [snake, `test_${snake}`];
        case "csharp":
            return [jName, `${jName}Tests`];
        default:
            return [snake, ""];
    }
};
const parseExtension = (languages: string) => {
    switch (languages) {
        case "go":
            return "go";

        case "typescript":
            return "ts";
        case "python":
            return "py";
        case "rust":
            return "rs";
        case "kotlin":
            return "kt";
            case "c":
            return "c";
        case "cpp":
            return "cpp";
        case "csharp":
            return "cs";
        default:
            return languages;
    }
};
export const expandGlob = (pattern: string): string[] => {
    const match = pattern.match(/(.*?)\{(.*?)\}(.*)/);
    if (!match) return [pattern];

    const prefix = match[1];
    const options = match[2].split(",");
    const suffix = match[3];
    const expandedSuffixes = expandGlob(suffix);
    return options.flatMap((option) =>
        expandedSuffixes.map((suffix) => `${prefix}${option}${suffix}`),
    );
};
export const hex = (input: string) => {
    const clean = input.replace(/[^a-f0-9]/gi, "");
    const buff: number[] = [];
    for (let i = 0; i < clean.length; i += 2) {
        buff.push(Number(`0x$${clean.slice(i, i + 2)}`));
    }
    return buff;
};
export const rgb = (...input: number[]) =>
    input
        .flat(Infinity)
        .reduce((a, c) => a + c.toString(16).padStart(2, "0"), "#");
export type CommitMessage = {
    commitType: CommitType;
};
const createCommitSubType = ({}: CommitMessage) => {};
const createCommitType = (message: CommitMessage) => {
    const { commitType } = message;
    switch (commitType) {
        case "chore":
            return createCommitSubType(message);
        default:
            return commitType;
    }
};
const getDirectories = (location: string) => Promise.resolve(readdir(location));
const getSubModules = (files: string[]) => {
    files.sort((a: string, b: string) => a.localeCompare(b));
    return files.reduce((cache, file) => {
        if (file.endsWith(".rs") && file !== "mod.rs") {
            cache.add(file.replace(/\.rs$/, "").trim());
        }
        return cache;
    }, new Set<string>());
};

const saveModuleEntry = (modules: Set<string>, challengeDirectory: string) => {
    if (modules.size > 0) {
        Promise.resolve(
            writeFile(
                `${challengeDirectory}/mod.rs`,
                Array.from([...modules.keys()]).reduce(
                    (accum, curr) => accum.concat(`pub mod ${curr};\n`),
                    "",
                ),
            ),
        );
    }
};
const organizeImports = () => {
    for (let difficulty of allowedDirectories.keys()) {
        const challengeDirectory: string = path.join(
            __dirname,
            "src",
            difficulty,
        );
        try {
            Promise.resolve(access(challengeDirectory));
            getDirectories(challengeDirectory)
                .then((files) => getSubModules(files))
                .then((files) => saveModuleEntry(files, challengeDirectory));
        } catch (error) {
            console.log(
                `An error occured accessing: ${challengeDirectory}`,
                error,
            );
        }
    }
};

export const createDotNet = ({ difficulty }: { difficulty: string }) => {
    const command = [
        `dotnet new classlib -n ${difficulty}`,
        `dotnet sln DarkCodingChallenges.sln add  ${difficulty}/${difficulty}.csproj`,
    ];
};
export const createDotNetTests = ({ difficulty }: { difficulty: string }) => {
    const command = [
        "dotnet new xunit -n CodingChallengesTests",
        "dotnet sln DarkCodingChallenges.sln add CodingChallengesTests/CodingChallengesTests.csproj",
    ];
    allowedDirectories.forEach((value) => {
        const command = [
            `dotnet add CodingChallengesTests/CodingChallengesTests.csproj reference ${difficulty}/${difficulty}.csproj`,
        ];
    });
};
const generateFile = (skeleton: ChallengeSkeleton, lang: string) => {
    const extension = parseExtension(lang);
    const [challengeFilename, testingFilename] = generateFilename({
        ...skeleton,
        languages: lang,
    });
    const [challengeCallback, testCallback] = skeletonsKeys.get(lang) || [
        noop,
        noop,
    ];
    const [challengeDirectory, testingDirectory] = determineBaseDirectory({
        ...skeleton,
        languages: lang,
    });
    if (testingFilename.length > 2) {
        const url = path.join(
            __dirname,
            `${testingDirectory}/${testingFilename}.${extension}`,
        );
        console.log(url);
        Promise.resolve(
            saveFile(
                path.join(
                    __dirname,
                    `${testingDirectory}/${testingFilename}.${extension}`,
                ),
                testCallback(skeleton),
            ),
        );
    }
    const url = path.join(
        __dirname,
        `${challengeDirectory}/${challengeFilename}.${extension}`,
    );
    console.log(url);
    Promise.resolve(saveFile(url, challengeCallback(skeleton)));
};
const main = async () => {
    allowedDirectories.forEach(async (level) => {
        const levelDir = path.join(baseDir, level);
        if (!(await exists(levelDir))) {
            await mkdir(levelDir, { recursive: true });
            console.log(`Created directory: ${levelDir}`);
        }
    });

    const responses = await prompts(questions, { onSubmit, onCancel });
    const { languages, difficulty, challengeName } = responses;
    const skeleton: ChallengeSkeleton = {
        difficulty,
        languages,
        challengeName,
        extension: "",
        pathname: "",
    };

    if (!languages || languages.length === 0) {
        return console.log("No languages selected. Exiting.");
    }

    if (languages.includes("all")) {
        for (const lang of skeletonsKeys.keys()) {
            generateFile(skeleton, lang);
        }
    } else
        languages.forEach((lang: string) => {
            generateFile(skeleton, lang);
        });
};

main().then(organizeImports);

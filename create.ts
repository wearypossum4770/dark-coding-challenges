import { exists, mkdir } from "node:fs/promises";
import * as changeCase from "change-case";
import { Eta } from "eta";

const views = "scripts";
export const template = new Eta({
    views,
    cache: true,
    debug: false,
    autoEscape: false,
});
export type ChallengeDifficulty =
    | "easy"
    | "medium"
    | "hard"
    | "advanced"
    | "expert"
    | "very_easy"
    | "very_hard"
    | "basic";

export type ChallengeLanguages =
    | "csharp"
    | "dart"
    | "java"
    | "kotlin"
    | "javascript"
    | "typescript"
    | "python"
    | "zig"
    | "swift"
    | "go"
    | "rust"
    | "cpp"
    | "php";

export const challengeLanguages: Set<ChallengeLanguages> = new Set([
    "csharp",
    "java",
    "kotlin",
    "javascript",
    "dart",
    "typescript",
    "python",
    "zig",
    "go",
    "rust",
    "cpp",
    "swift",
    "php",
]);

export type ChallengeData = {
    challengeName: string;
    language: Set<ChallengeLanguages>;
    difficulty: ChallengeDifficulty;
    className?: string;
};

export const ensureDir = (dir: string) => (!exists(dir))  && mkdir(dir, { recursive: true });


export const ifTesting = (language: ChallengeLanguages) => {
    switch (language) {
        case "php":
            return "Test."
        case "csharp":
            return "Tests."
        case "dart":
            return "_test.";
        case "go":
            return "_test.";
        case "java":
        case "kotlin":
            return "Test.";
				case "swift":
					return "Tests."
    }
};
export const generateTestFilePath = (
    language: ChallengeLanguages,
    data: ChallengeData,
) => {
    const { difficulty } = data;
    const extension = getExtension(language);
    const filename = generateFileName(language, data);
    const testing = ifTesting(language);
    switch (language) {
        case "go":
            return `${difficulty}/${filename}${testing}${extension}`;
        case "python":
            return `${difficulty}/test_${filename}.${extension}`;
        case "java":
        case "kotlin":
            return `src/test/${language}/${difficulty}/${filename}${testing}${extension}`;
        case "php":
        case "typescript":
        case "javascript":
        case "dart":
        case "csharp":
            return `test/${difficulty}/${filename}${testing}${extension}`;
				case "swift":
					return `test/${difficulty}swift/${filename}${testing}${extension}`
    }
};
export const generateFileName = (
    language: ChallengeLanguages,
    { challengeName }: ChallengeData,
) => {
    if (new Set(["python", "cpp", "zig", "dart", "rust","go"]).has(language))
        return changeCase.snakeCase(challengeName);
    if (new Set<ChallengeLanguages>(["javascript", "typescript"]).has(language))
        return changeCase.kebabCase(challengeName);
    if (language === "kotlin")
        return changeCase.pascalCase(`Kodee_${challengeName}`);
    return changeCase.pascalCase(challengeName);
};
export const generateSourceCodePath = (
    language: ChallengeLanguages,
    data: ChallengeData,
) => {
    const { difficulty } = data;
    const filename = generateFileName(language, data);
    const extension = getExtension(language);
    switch (language) {
        case "dart":
            return `lib/${difficulty}/${filename}.${extension}`;
        case "rust":
        case "swift":
        case "typescript":
        case "javascript":
            return `src/${difficulty}/${filename}.${extension}`;
        case "go":
        case "python":
        case "csharp":
            return `${difficulty}/${filename}.${extension}`;
        case "java":
        case "kotlin":
        case "cpp":
            return `src/main/${language}/${difficulty}/${filename}.${extension}`;
        case "php":
            return `src/main/php/${changeCase.pascalCase(difficulty)}/${filename}.${extension}`
    }
};
export const processTemplate = (fileLocation: string, data: ChallengeData) => {
    try {
        return template.render(fileLocation, {
            changeCase: {
                pascal: changeCase.pascalCase,
                camel: changeCase.camelCase,
                snake: changeCase.snakeCase,
                kebab: changeCase.kebabCase,
                
                constant: changeCase.constantCase,
                title: changeCase.capitalCase,
            },
            ...data,
            it: data,
        });
    } catch (error) {
        console.log(error);
        return null;
    }
};
export const generateSolution = async (data: ChallengeData) => {
    const { difficulty, challengeName } = data;
    for (const language of data.language) {
        const extension = getExtension(language);
        const testLocation = generateTestFilePath(language, data);
        const sourceLocation = generateSourceCodePath(language, data);
        const sourceCode = `solution.${extension}.eta`;
        const testCode = `solution.${extension}.test.eta`;
        createHeaderFile(language, data)
        console.log({ testLocation, sourceLocation, language });
    }
};
export const createHeaderFile = async (language: ChallengeLanguages, data: ChallengeData) => {
    switch(language) {
        case 'cpp':
            return console.log(processTemplate(`solution.${getExtension(language)}.h.eta`, data))
    }
}
export const getExtension = (language: ChallengeLanguages) => {
    switch (language) {
        case "csharp":
            return "cs";
        case "kotlin":
            return "kt";
        case "rust":
            return "rs";
        case "typescript":
            return "ts";
        case "javascript":
            return "js";
        case "python":
            return "py";
        case "php":
            return "php";
        default:
            return language;
    }
};

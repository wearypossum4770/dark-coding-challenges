import { writeFile, readFile, readdir } from "fs";
import prompts from "prompts";
import { camelCase, snakeCase, kebabCase } from "change-case";

const logger = (err: unknown, actor?: string) =>
    console.log(actor, err as Error);
const delimiter = "// -------------------imports-------------------//";
const organizeRustImports = ({
    directory,
    filename,
}: {
    directory: string;
    filename: string;
}) => {
    const location = `./src/${directory}`;
    readdir(location, (dirError, files: string[]) => {
        if (dirError) return logger(dirError, "readdir");
        const moduleLocation = `${location}/mod.rs`;
        const mods = new Set();
        readFile(moduleLocation, "utf-8", (readError, data) => {
            if (readError) return logger(readError, "readfile");
            const contents = data.substring(data.indexOf(delimiter));
            files.forEach((file: string) => {
                if (file.endsWith(".rs")) {
                    const name = file.replace(/\.rs$/, "");
                    mods.add(name);
                }
            });
            mods.delete("mod.rs");
            mods.delete("mod");
            const imports = [...mods].sort().map((file) => `mod ${file}`);
            writeFile(
                moduleLocation,
                `${imports.join(";\n")};\n${contents}`,
                (writeError) => logger(writeError),
            );
        });
        mods.clear();
    });
};
const createJavascript = ({
    directory,
    functionanme,
}: {
    functionanme: string;
    directory: string;
}) => {
    const name = camelCase(functionanme);
    const filename = kebabCase(functionanme);
    const module = `export const ${name} = () => {}`;
    const contents = `\nimport { describe, test, expect } from "bun:test";\nimport { ${name} } from '~/${directory}/${filename}'\ndescribe('', () => {\ntest.each([])('', (strs, output) => {\nconst result = ${name}(strs)\nexpect(result).toStrictEqual(output)\n})\n})`;
    writeFile(`./src/${directory}/${filename}.ts`, module, logger);
    writeFile(`./test/${directory}/${filename}.test.ts`, contents, logger);
};
const createZig = ({
    directory,
    functionanme,
    moduleName,
}: {
    moduleName: string;
    functionanme: string;
    directory: string;
}) => {
    const name = camelCase(functionanme);
    const contents = `const expectEqual = @import("std").testing.expectEqual;\n\npub fn ${name}(minuend: i32, subtrahend: i32) i32 {\n\treturn minuend - subtrahend;\n}\ntest "" {\n\tconst a: i32 = 3;\n\tconst b: i32 = 2;\n\tconst c: i32 = 945;\n\tconst d: i32 = 422;\n\tconst difference = ${name}(a, b);\n\tconst e = ${name}(c, d);\n\ttry expectEqual(difference, 1);\n\ttry expectEqual(e, 523);\n}`;
    writeFile(
        `./src/${directory}/${snakeCase(functionanme)}.zig`,
        contents,
        logger,
    );
};
const createPython = ({
    directory,
    functionanme,
    moduleName,
}: {
    moduleName: string;
    functionanme: string;
    directory: string;
}) => {
    const name = snakeCase(functionanme);
    const module = `\ndef ${name}():\n\t"""\n\tDOCUMENTATION\n\t"""\n\treturn None`;
    const contents = `\nimport pytest\nfrom easy.${name} import ${name}\n@pytest.mark.parametrize("num,expected",[])\ndef test_${name}(num, expected):\n\tassert ${name}(num) == expected`;
    writeFile(`./${directory}/${name}.py`, module, logger);
    writeFile(`./${directory}/test_${name}.py`, contents, logger);
};
const createRust = ({
    directory,
    functionanme,
    moduleName,
}: {
    moduleName: string;
    functionanme: string;
    directory: string;
}) => {
    const name = snakeCase(functionanme);
    const contents = `pub fn ${name}() -> bool {\n//\n\n}\n#[cfg(test)]\nmod tests {\nuse super::${name};\n#[test]\nfn test_${name}() {\nassert_eq!(${name}(parameters), returnvalue);\n}\n}`;
    return writeFile(`./src/${directory}/${name}.rs`, contents, logger);
};

const onSubmit = (): void => {};
const onCancel = (): void => {};

const questions = [
    {
        type: "select",
        name: "directory",
        message: "What type of problem is this?",
        choices: [
            { value: "easy", title: "Easy" },
            { value: "medium", title: "Medium" },
            { value: "hard", title: "Hard" },
            { value: "advanced", title: "Advanced" },
        ],
    },
    {
        name: "moduleName",
        type: "text",
        message: "What is the filename",
    },
    {
        type: "text",
        name: "functionanme",
        message: "name of function",
    },
];

async function main() {
    const response = await prompts(questions, { onSubmit, onCancel });
    await Promise.resolve(createRust(response));
    createJavascript(response);
    createPython(response);
    createZig(response);
    organizeRustImports(response);
}

main();
// writeFile(`./easy/${functionanme}.rs`, rustFunction(functionanme), (err) =>err)

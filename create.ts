import { writeFile } from "fs";
import prompts from "prompts";
import { camelCase, snakeCase, kebabCase } from "change-case";

const logger = (err: unknown) => console.log(err);
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
    writeFile(`./src/${directory}/${name}.rs`, contents, logger);
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
    createJavascript(response);
    createRust(response);
    createPython(response);
}

main();
// writeFile(`./easy/${functionanme}.rs`, rustFunction(functionanme), (err) =>err)

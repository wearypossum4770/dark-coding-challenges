
/**
 * @return {Function}
 */
export const createHelloWorld = (): Function  => (..._args: unknown[])=> "Hello World";

/**
 * const f = createHelloWorld();
 * f(); // "Hello World"
 */

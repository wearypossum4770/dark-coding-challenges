# How to use the name parameter for table testing.

1. `describe.each(table)(name, fn, timeout)`

    - `table`: `Array` of Arrays with the arguments that are passed into the `fn` for each row. If you pass in a 1D array of primitives, internally it will be mapped to a table i.e. `[1, 2, 3] -> [[1], [2], [3]]`.
    - `name`: `String` the title of the test suite.
    - Generate unique test titles by positionally injecting parameters with [printf formatting](https://nodejs.org/api/util.html#util_util_format_format_args):

        - `%p` - [pretty-format](https://www.npmjs.com/package/pretty-format).
        - `%s` - String.
        - `%d` - Number.
        - `%i` - Integer.
        - `%f` - Floating point value.
        - `%j` - JSON.
        - `%o` - Object.
        - `%#` - Index of the test case.
        - `%%` - single percent sign ('%'). This does not consume an argument.

    - Or generate unique test titles by injecting properties of test case object with `$variable`
        - To inject nested object values use you can supply a keyPath i.e. `$variable.path.to.value`
        - You can use `$#` to inject the index of the test case
        - You cannot use `$variable` with the `printf` formatting except for `%%`
    - `fn`: `Function` the suite of tests to be run, this is the function that will receive the parameters in each row as function arguments.
    - Optionally, you can provide a `timeout` (in milliseconds) for specifying how long to wait for each row before aborting. The default timeout is 5 seconds.

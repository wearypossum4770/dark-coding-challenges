package very_easy;

import java.util.function.Function;

public class CreateHelloWorld {
  public Function<Object[], String> createHelloWorld() {
    return args -> "Hello World";
  }
}

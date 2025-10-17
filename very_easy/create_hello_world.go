package very_easy

func CreateHelloWorld() func(...any) string {
	return func(...any) string {
		return "Hello World"
	}
}

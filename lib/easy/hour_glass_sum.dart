import "dart:math";
int minInt = 0x8000000000000000;
int maxInt = 0x7fffffffffffffff;
int hourGlassSum(List<List<int>> matrix) {
int result = minInt;
for(int i = 0; i < matrix.length - 2; i++) {
	for(int j = 0; j < matrix[i].length - 2; j++) {
		  int sum =    matrix[i][j]
                + matrix[i][j + 1]
                + matrix[i][j + 2]
                + matrix[i + 1][j + 1]
                + matrix[i + 2][j]
                + matrix[i + 2][j + 1]
                + matrix[i + 2][j + 2];
	result = max(result, sum);
	}
}
return result;
}
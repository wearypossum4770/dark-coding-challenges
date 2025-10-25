
bool isBoomerang(List<List<int>> points) {
  // Check for distinct points
  Set<String> distinct = points.map((point) => point.join(',')).toSet();
  if (distinct.length != 3) return false;

  // Extract coordinates
  int x1 = points[0][0];
  int y1 = points[0][1];
  int x2 = points[1][0];
  int y2 = points[1][1];
  int x3 = points[2][0];
  int y3 = points[2][1];

  // Check if points are non-collinear using the area of triangle formula
  return (x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2)).abs() != 0;
}

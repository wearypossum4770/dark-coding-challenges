func isBoomerang(_ points: [[Int]]) -> Bool {
  var distinct = Set<String>()
  for point in points {
    distinct.insert("\(point[0]),\(point[1])")
  }
  if distinct.count != 3 {
    return false
  }
let x1 = points[0][0], y1 = points[0][1]
    let x2 = points[1][0], y2 = points[1][1]
      let x3 = points[2][0], y3 = points[2][1]
let a = x1*(y2-y3)
let b = x2*(y3-y1)
let c = x3*(y1-y2)
  	return a + b + c != 0
}

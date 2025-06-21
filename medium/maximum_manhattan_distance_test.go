
package medium

import (
	"testing"
)

func TestMaximumManhattanDistance(t *testing.T) {
cases := []struct {
num 	int
expected bool
}{
{true, true},
}
for _, c := range cases {
t.Run("", func(t *testing.T) {
result := MaximumManhattanDistance(c.num)
if result != c.expected {
t.Errorf("MaximumManhattanDistance(%d) == %v, expected %v", c.input, result, c.expected)
}

})

}
}
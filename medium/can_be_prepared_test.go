package medium

import (
	"testing"
)

func TestCanBePrepared(t *testing.T) {
	cases := []struct {
		recipes     string
		ingredients []byte
		expected    bool
	}{
		{"", []byte{}, false},
		{"O", []byte{'O'}, true},
		{"B|O", []byte{'O'}, true},
		{"O|B", []byte{'O'}, true},
		{"B|O", []byte{'O', 'B'}, true},
		{"B", []byte{'O'}, false},
		{"(O&M)", []byte{'O'}, false},
		{"(M&O)", []byte{'O'}, false},
		{"(O|B)", []byte{'O', 'B'}, true},
		{"(M&F)", []byte{'M', 'F'}, true},
		{"(M&F)", []byte{'M', 'E'}, false},
		{"(B|O|L)", []byte{'B', 'M', 'F'}, true},
		{"(B&M&S&F)", []byte{'B', 'M', 'F', 'S'}, true},
		{"(E|(M&F))", []byte{'M', 'E'}, true},
		{"(E|(M&F))", []byte{'M', 'B'}, false},
		{"( M & F )", []byte{'M', 'F'}, true},
		{"(E|(M&F))", []byte{'M', 'F'}, true},
		{"(M&(F&G))", []byte{'M', 'F', 'G'}, true},
		{"(M&(F&G))", []byte{}, false},
		{"(M&(F&E))", []byte{'M', 'F', 'G'}, false},
		// test cases provided by Chat GPT
		{"((A&B)|C)", []byte{'A', 'B'}, true},
		{"((A&B)|C)", []byte{'C'}, true},
		{"((A&B)|C)", []byte{'A'}, false},
		{"(A&(B|C))", []byte{'A', 'B'}, true},
		{"(A&(B|C))", []byte{'A', 'C'}, true},
		{"(A&(B|C))", []byte{'A'}, false},
		{"((A&B)&C)", []byte{'A', 'B', 'C'}, true},
		{"(A&B)|(C&D)", []byte{'A'}, false},
		{"((A&B)&C)", []byte{'A', 'B'}, false},
		{"((A|B)&(C|D))", []byte{'A', 'C'}, true},
		{"((A|B)&(C|D))", []byte{'B', 'D'}, true},
		{"((A|B)&(C|D))", []byte{'A'}, false},
		{"((((A&B)|C)&D)|E)", []byte{'E'}, true},
		{"((((A&B)|C)&D)|E)", []byte{'A', 'B', 'D'}, true},
		// {"((((A&B)|C)&D)|E)", []byte{'A', 'B'}, false},
	}
	for _, c := range cases {
		t.Run("Given a recipe", func(t *testing.T) {
			t.Parallel()
			result := CanBePrepared(c.recipes, c.ingredients)
			if result != c.expected {
				t.Errorf("CanBePrepared(%v, %v) == %v, expected %v", c.recipes, c.ingredients, result, c.expected)
			}
		})
	}
}

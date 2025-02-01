package easy;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;

public class TwoSumTest {

  @ParameterizedTest
  @CsvSource({
    "'2,7,11,15',9,0,1",
    "'3,2,4',6,1,2",
    "'3,3',6,0,1",
    "'3,2,3',6,0,2",
    "'2,5,5,11',10,1,2",
    "'0,4,3,0',0,0,3",
    "'-3,4,3,90',0,0,2",
  })
  public void testTwoSum(String numsStr, int target, int expectedIndex1, int expectedIndex2) {
    // Arrange
    String[] numStrings = numsStr.split(",");
    int[] nums = new int[numStrings.length];
    for (int i = 0; i < numStrings.length; i++) {
      nums[i] = Integer.parseInt(numStrings[i]);
    }
    // Act
    int[] result = new easy.TwoSum().solve(nums, target);

    // Assert
    assertArrayEquals(new int[] {expectedIndex1, expectedIndex2}, result);
  }
}

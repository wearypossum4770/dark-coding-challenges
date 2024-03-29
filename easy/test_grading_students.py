import pytest
from easy.grading_students import grading_students


@pytest.mark.parametrize(
    "grades,expected",
    [
        # fmt: off

        (
            [ 73, 67, 38, 33 ], [ 75, 67, 40, 33 ]
        ),
        (
            [ 37, 38 ], [ 37, 40 ]
        ),
        (
            [ 80, 96, 18, 73, 78, 60, 60, 15, 45, 15, 10, 5, 46, 87, 33, 60, 14, 71, 65, 2, 5, 97, 0,],
            [ 80, 96, 18, 75, 80, 60, 60, 15, 45, 15, 10, 5, 46, 87, 33, 60, 14, 71, 65, 2, 5, 97, 0,],
        ),
        (
            [ 84, 94, 21, 0, 18, 100, 18, 62, 30, 61, 53, 0, 43, 2, 29, 53, 61, 40, 14, 4, 29, 98, 37, 23, 46, 9, 79, 62, 20, 38, 51, 99, 59, 47, 4, 86, 61, 68, 17, 45, 6, 1, 95, 95,],
            [ 85, 95, 21, 0, 18, 100, 18, 62, 30, 61, 55, 0, 45, 2, 29, 55, 61, 40, 14, 4, 29, 100, 37, 23, 46, 9, 80, 62, 20, 40, 51, 100, 60, 47, 4, 86, 61, 70, 17, 45, 6, 1, 95, 95,],
        ),
        (
            [ 27, 89, 56, 47, 38, 12, 98, 72, 85, 76, 72, 56, 23, 77, 25, 49, 4, 52, 71, 43, 11, 2, 44, 10, 20, 3, 90, 64, 48, 31, 56, 51, 70, 91, 14, 25, 61, 41, 0,],
            [ 27, 90, 56, 47, 40, 12, 100, 72, 85, 76, 72, 56, 23, 77, 25, 50, 4, 52, 71, 45, 11, 2, 45, 10, 20, 3, 90, 65, 50, 31, 56, 51, 70, 91, 14, 25, 61, 41, 0,],
        ),
        # fmt: on
    ],
)
def test_grading_students(grades, expected):
    assert grading_students(grades) == expected

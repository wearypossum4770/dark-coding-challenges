
import pytest
from easy.frames_per_second import frames_per_second
@pytest.mark.parametrize("minutes, frames, expected",[
(1, 1, 60),
(10, 1, 600),
(10, 25, 15000),
(500, 60, 1800000),
(0, 60, 0),
(99, 1, 5940),
(419, 70, 1759800),
(52, 33, 102960),
])
def test_frames_per_second(minutes, frames, expected):
	assert frames_per_second(minutes, frames) == expected
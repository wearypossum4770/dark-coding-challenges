
package easy;
import java.util.stream.Stream;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class ReformatDateTest {
ReformatDate instance = new ReformatDate();
@ParameterizedTest
@MethodSource("dataReformatDate")
public void testReformatDate(String date, String expected) {

String result = instance.solve(date);

assertEquals(expected, result);
}
public static Stream<Arguments> dataReformatDate(){
	return Stream.of(
			Arguments.of("20th Oct 2052", "2052-10-20"),
	Arguments.of("6th Jun 1933", "1933-06-06"),
	Arguments.of("26th May 1960", "1960-05-26"),
	Arguments.of("1st Jan 1900", "1900-01-01"),
	Arguments.of("31st Dec 2100", "2100-12-31"),
	Arguments.of("2nd Feb 2000", "2000-02-02"),
	Arguments.of("3rd Mar 1999", "1999-03-03"),
	Arguments.of("4th Apr 2010", "2010-04-04"),
	Arguments.of("9th Sep 2021", "2021-09-09"),
	Arguments.of("10th Oct 2020", "2020-10-10"),
	Arguments.of("11th Nov 2011", "2011-11-11"),
	Arguments.of("12th Dec 2012", "2012-12-12"),
	Arguments.of("21st Aug 1987", "1987-08-21"),
	Arguments.of("22nd Jul 1975", "1975-07-22"),
	Arguments.of("23rd Mar 1965", "1965-03-23"),
	Arguments.of("30th Apr 1990", "1990-04-30"),
	Arguments.of("28th Feb 2001", "2001-02-28"),
	Arguments.of("29th Feb 2000", "2000-02-29"),
	Arguments.of("7th Jul 2007", "2007-07-07"),
	Arguments.of("8th Aug 1988", "1988-08-08")
	);
}
}
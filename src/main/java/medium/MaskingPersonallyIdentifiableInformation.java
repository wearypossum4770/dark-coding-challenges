package medium;

public class MaskingPersonallyIdentifiableInformation {
  public String maskPhone(String phone) {
    StringBuilder sb = new StringBuilder();
    int count = 0;
    int chars = 0;
    for (int i = phone.length() - 1; i >= 0; i--) {
      char c = phone.charAt(i);
      if (!Character.isDigit(c)) continue;
      if (count == 4 || count == 8 || count == 12) {
        count++;
        sb.append("-");
      }
      if (count <= 4) {
        sb.append(c);
      } else {
        sb.append("*");
      }
      count++;
      chars++;
    }
    if (chars > 10) {
      sb.append("+");
    }
    sb.reverse();
    return sb.toString();
  }

  public String maskEmail(String email) {
    StringBuilder sb = new StringBuilder();
    int atIndex = email.indexOf("@");
    sb.append(email.charAt(0));
    sb.append("*****");
    sb.append(email.charAt(atIndex - 1));
    sb.append(email.substring(atIndex));
    return sb.toString().toLowerCase();
  }

  public String solve(String s) {
    if (s.contains("@")) return maskEmail(s);
    return maskPhone(s);
  }
}

class Utils {
  static String getUsername(String email) {
    return "${email.split('@')[0]}";
  }

  static String getInitials(String name) {
    List<String> nameSpilt = name.split(" ");
    String firstNameInitial = nameSpilt[0][0];
    String lastNameInitial = nameSpilt[1][0];

    return firstNameInitial + lastNameInitial;
  }
}
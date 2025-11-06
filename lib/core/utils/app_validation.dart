abstract class Validator {
  static String? validateEmail(String? val) {
    const String _emailPattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    final RegExp emailRegex = RegExp(_emailPattern);
    if (val == null || val.trim().isEmpty) {
      return 'Email cannot be empty';
    } else if (!emailRegex.hasMatch(val)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  static String? validateName(String? val) {
    if (val == null || val.isEmpty) {
      return 'Name cannot be empty';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? val) {
    const String _passwordPattern = r'^(?=.*[A-Z])(?=.*\d)[A-Za-z\d@]{6,}$';
    final RegExp passwordRegex = RegExp(_passwordPattern);
    if (val == null || val.isEmpty) {
      return 'Password cannot be empty';
    } else if (!passwordRegex.hasMatch(val)) {
      return 'Enter a valid password';
    } else {
      return null;
    }
  }
}

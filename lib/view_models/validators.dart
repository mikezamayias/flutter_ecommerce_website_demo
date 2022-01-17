class Validators {
  String? validateEmail(String? email) {
    if (email!.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null) {
      return 'Password is required';
    }
    if (password.isEmpty) {
      return 'Password is required';
    }
    // check if password is at least 8 latin characters long, has at least one lowercase letter, one uppercase letter, one number and one special character
    if (password.length < 8 ||
        !password.contains(RegExp(r'[a-z]')) ||
        !password.contains(RegExp(r'[A-Z]')) ||
        !password.contains(RegExp(r'[0-9]')) ||
        !password.contains(RegExp(r'[!@#\$%\^&\*]'))) {
      return 'Password must be at least 8 latin characters long, contain at least one lowercase letter, one uppercase letter, one number and one special character';
    }
    return null;
  }

  String? validateConfirmPassword(String? value, String? password) {
    if (value!.isEmpty) {
      return 'Confirm password is required';
    }
    validatePassword(value);
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}

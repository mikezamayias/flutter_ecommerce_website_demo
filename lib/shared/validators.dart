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

  String? validateStreetAddress(String? value) {
    if (value == null) return 'Address is required';
    if (value.isEmpty) return 'Address is required';
    return null;
  }

  String? validatePostalCode(String? value) {
    if (value == null) return 'Postcode is required';
    if (value.isEmpty) return 'Postcode is required';
    // check if postal code is 5 numeric characters long
    if (!RegExp(r'^[0-9]{5}$').hasMatch(value)) {
      return 'Postal code must be 5 digits long';
    }
    return null;
  }

  String? validateCity(String? value) {
    if (value == null) return 'City is required';
    if (value.isEmpty) return 'City is required';
    if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
      return 'City must be alphabetic';
    }
    if (value.length < 2) {
      return 'City must be at least 2 characters long';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null) return 'Phone number is required';
    if (value.isEmpty) return 'Phone number is required';
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Phone number must be 10 digits long';
    }
    return null;
  }

  String? validateFirstName(String? value) {
    if (value == null) return 'First name is required';
    if (value.isEmpty) return 'First name is required';
    if (value.length < 2) {
      return 'First name must be at least 2 characters long';
    }
    return null;
  }

  String? validateLastName(String? value) {
    if (value == null) return 'Last name is required';
    if (value.isEmpty) return 'Last name is required';
    if (value.length < 2) return 'Last name must be at least 2 characters long';
    return null;
  }
}

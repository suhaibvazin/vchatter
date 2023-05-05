//Email validator
String? emailValidator(String? email) {
  // Check if the value is empty
  if (email?.isEmpty ?? true) {
    return 'Email cannot be empty';
  }
  // Check if the value is a valid email using regex
  bool emailValid =
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email!);
  if (!emailValid) {
    return 'Enter a valid email';
  }
  // Return null if the value is valid
  return null;
}

//password validator

String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return 'Password is required';
  }
  if (password.length < 8) {
    return 'Password must be at least 8 characters long';
  }
  if (!RegExp(r'[A-Z]').hasMatch(password)) {
    return 'Password must contain at least one uppercase letter';
  }
  if (!RegExp(r'[a-z]').hasMatch(password)) {
    return 'Password must contain at least one lowercase letter';
  }
  if (!RegExp(r'\d').hasMatch(password)) {
    return 'Password must contain at least one digit';
  }
  if (!RegExp(r'[!@#\$%\^&\*\(\)_\+\-\={}[\]|\\:;\"\<>,\.\?\/~$]')
      .hasMatch(password)) {
    return 'Password must contain at least one special character';
  }
  return null;
}

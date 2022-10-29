import '../extensions/extensions.dart';

class Validator {
  String? text(String? txt) {
    if (txt == null || txt.isEmpty) {
      return "This information can't be blank";
    }
    return null;
  }

  String? email(String? txt) {
    if (txt == null || txt.isEmpty) {
      return "This information can't be blank";
    }
    if (!txt.isValidEmail()) {
      return "Email format is incorrect";
    }
    return null;
  }

  String? password(String? txt) {
    if (txt == null || txt.isEmpty) {
      return "This information can't be blank";
    }
    if (txt.length < 6 || txt.length > 20) {
      return "Password must be between 6 and 20 characters";
    }
    return null;
  }
}

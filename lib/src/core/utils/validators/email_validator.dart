abstract class Validator{
  bool validate();
}

class EmailValidator implements Validator{
  final String emailStr;

  EmailValidator({required this.emailStr});

  @override
  bool validate() {
    const emailRegExp = r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

    if (RegExp(emailRegExp).hasMatch(emailStr)){
      return true;
    }
    return false;
  }

}
String? emailValidator(String? input) {
  if (input == null || input.isEmpty) {
    return "Bitte Ihre Eingabe";
  }

  if(!input.contains('@') && !input.contains('.')) {
    return "Bitte geben Sie eine gültige E-Mail-Adresse ein";
  }
  return null;
}

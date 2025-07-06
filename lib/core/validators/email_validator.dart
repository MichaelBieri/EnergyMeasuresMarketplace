String? emailValidator(String? input) {
  if (input == null || input.isEmpty) {
    return "Bitte geben sie etwas ein";
  }

  if(!input.contains('@') && !input.contains('.')) {
    return "Bitte geben Sie eine gültige E-Mail-Adresse ein";
  }
  return null;
}

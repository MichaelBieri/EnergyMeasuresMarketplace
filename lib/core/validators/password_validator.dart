String? passwordValidator(String? input){
  if(input == null || input.isEmpty) {
    return "Bitte Passwort eingeben";
  }

RegExp sonderzeichenRegex = RegExp(r'[!"#$%&()*+,-./:;<=>?@[\]^_`{|}~]');

if(input.length <= 8){
  return "Das Passwort muss mindestens 8 Zeichen lang sein!";
}

if(!sonderzeichenRegex.hasMatch(input)){
  return "Bitte mindestens eines der folgenden Zeichen einfügen!";
}
 
  return null;
} 
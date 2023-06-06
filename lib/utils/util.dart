import 'package:dictionaryx/dictionary_reduced_sa.dart';

class Util{
  static final RegExp alphaExp = RegExp(
      r'^[a-zA-Z ]*$'); //Regex for english alphabet characters and whitespace

  static String? validation(String? value){
    if (value == null || value.isEmpty) {
      return 'Write a new word';
    } else if (!alphaExp.hasMatch(value)) {
      return 'Only Alphabets are allowed';
    } else {
      List words = value.split(" ");
      var tooLongList = words.where((element) => element.length > 45);
      if(tooLongList.isNotEmpty){
        return 'One of the words is too long';
      }
      var dReducedSA = DictionaryReducedSA();
      var notValidWords = words.where((element) => !dReducedSA.hasEntry(element));
      if(notValidWords.isNotEmpty){
        return 'One of the words is not valid';
      }
    }

    return null;
  }

}
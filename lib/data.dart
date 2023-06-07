import 'dart:io';

abstract class Data{

            // carrega o arquivo para a memória do programa
  late File currentFile;
  void load(String fileName){

    File currentFile = File(fileName);
  }

  void save(String fileName){

    
  }

  bool get hasData {

    if (currentFile.readAsStringSync().length == 0){
        return false;
      } else {
        return true;
      }
  }

  String get data => currentFile.readAsStringSync();

  String set data() {
    
    currentFile.writeAsStringSync(s2, mode: FileMode.append);
  }



  void clear(){

    currentFile.writeAsStringSync('');

  }

}
extension StringExt on String{
  String capitalize(){
    if(length > 1){
      return this[0].toUpperCase() +substring(1);
    }

    return toUpperCase();
  }

  String upperCaseWords(){
    return split(' ').map((e) => e.capitalize()).join(' ');
  }
}
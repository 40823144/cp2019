KtoL (num k){
return k*2.2046;
}
LtoK (num l){
return l /2.2046;
}
main() {
  int len;
  var type;
  var number;
  List temp = ["20C", "30C", "50F", "40C", "23F"];
  for (var data in temp) {
    len = data.length;
    type = data[len-1];
    number = data.substring(0, len-1);
    number = int.parse(number);
    if (type == "C"){
      print("公斤重 $number kg = 磅重 ${KtoL(number)} lb");
    }else{
      print("磅重 $number lb = 公斤重 ${LtoK(number)} kg");
    }     
  } 
} 
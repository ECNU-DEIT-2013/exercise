import 'dart:html';
import 'dart:core' ;
//////////////////////
InputElement num1;
InputElement num2;
InputElement num3;
ButtonElement b1;

///////////////////////
void main() {
  b1=querySelector('#getadd')
    ..onClick.listen(add);
  querySelector('#sample_text_id')
    ..onClick.listen(reverseText);
}

//add function
void add(MouseEvent event) {
  num1 = querySelector('#first');
  num2= querySelector('#second');
  num3= querySelector('#last');
  var n1= num1.value;
  var n2=num2.value;
  int n=int.parse(n1)+int.parse(n2);
 num3.value =n.toString();
}

//1+2+3+4...+100 result
void reverseText(MouseEvent event) {
  int i=1;
  int sum=0;
  for(i;i<=100;i++) {
    sum += i;
  }
  querySelector('#sample_text_id').text = sum.toString();
}

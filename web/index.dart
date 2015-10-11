import 'dart:html';
import 'dart:math' as math;
void main() {
  querySelector('#btn1')
    ..onClick.listen(Add);
  querySelector('#btn2')
    ..onClick.listen(add);
}

 Add(MouseEvent event){
  var i;
  var s=0;
  for(i=1;i<=100;i++)
  {s=s+i;}
  querySelector('#txt1').value=s.toString();
}

add(MouseEvent event){
  var a=0;
  var b=0;
  var c=0;
  c=a+b;
  querySelector('#txt1').value=s.toString();
}
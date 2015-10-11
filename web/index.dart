import 'dart:html';
import 'dart:math' as math;
InputElement ToDoinput;
UListElement a;
ButtonElement clear;
void main(){
ToDoinput=querySelector('#num2');
a=querySelector('#abc');
clear=querySelector('#clear');
ToDoinput.onChange.listen(addToTerm);
clear.onClick.listen((e) => a.children.clear());

}

void myText(MouseEvent event){
 // var a= document.getElementById("Texta").value;
 // var b= document.getElementById("Textb").value;
 // var A= int.parse(a);
  //var B= int.parse(b);
  //addNum(A,B);

}
void addNum(num a,num b){
  var m=a+b;
  querySelector('#sample_text_id').text=m.toString();
}
void addToTerm(Event e){
  var newToDo=new InputElement();
 var n=document.getElementById("num2").value;
  var N=int.parse(n);
  var m=document.getElementById("num1").value;
  var M=int.parse(m);
  var s=N+M;
  newToDo.value=s.toString();
  a.children.add(newToDo);
  newToDo.onClick.listen((e) => newToDo.remove());

}


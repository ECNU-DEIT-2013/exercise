import 'dart:html';
import 'dart:math' as math;
void main() {

querySelector('#sample_text_id')
..text="click me!"
..onClick.listen(result);
}
void Addnum() {
  var c=0;
  for (var i = 1; i < 101; i++)
  {c=c+i;}
querySelector('#text').text="Add 1 to 100,the result is:";
  querySelector('#sample_text_id').text=c.toString();
}
void result(MouseEvent event){
 // var a= document.getElementById("text1").value;
  //var b= document.getElementById("text2").value;
 // var A= int.parse(a);
//  var B= int.parse(b);
  Addnum();


}
void addNum(num a,num b){
  var m=a+b;
  querySelector('#text').text="the result is:";
  querySelector('#sample_text_id').text=m.toString();
}

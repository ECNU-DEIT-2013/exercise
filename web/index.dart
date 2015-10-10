import 'dart:html';
import 'dart:math' as math;
InputElement mytexta;
InputElement mytextb;
InputElement myTextx;
UListElement sample_container_id;
UListElement sample_text_add2;
UListElement sample_text_add;
ParagraphElementElement p1;

void main() {
  mytexta=querySelector('#myTexta');
  mytextb=querySelector('#myTextb');
 sample_container_id=querySelector('#sample_container_id');
 mytextb.onChange.listen(addnumnew);

  sample_text_add=querySelector('#sample_text_add');
  p1=querySelector('#p1');
  p1.onClick.listen(hundredadd);

  myTextx=querySelector('#myTextx');
 sample_text_add2=querySelector('#sample_text_add2');
 myTextx.onChange.listen(add2);
}
void hundredadd(MouseEvent event){
  var s=0;
  for (int i = 1; i <101; i++){
    s=s+i;
  }
  var result1=new ContentElement();
  result1.text=s.toString();
  sample_text_add.children.add(result1);
  var button3=new ButtonInputElement();
  button3.value="CLEAR";
  sample_text_add.children.add(button3);
  button3.onClick.listen(mybutton3);
  button3.onClick.listen((e)=> button3.remove());
  button3.onClick.listen((e)=> result1.remove());
}
void add2(Event e){
  var result2=new ContentElement();
  var n = myTextx.value;
  var N = int.parse(n);
  var s=0;
  for (int i = 1; i <N+1; i++){
    s=s+i;
  }
  result2.text=s.toString();
  sample_text_add2.children.add(result2);
  var button2=new ButtonInputElement();
  button2.value="CLEAR";
  sample_text_add2.children.add(button2);
  button2.onClick.listen(mybutton2);
  button2.onClick.listen((e)=> button2.remove());
  button2.onClick.listen((e)=> result2.remove());
}
void mybutton2(MouseEvent event){
  myTextx.value="Input a Number";
}
void mybutton3(MouseEvent event){

}
void addnumnew(Event e){
  var a =  mytexta.value;
  var b =  mytextb.value;
  var A = int.parse(a);
  var B = int.parse(b);
  int c=A+B;
  var resultc=new ContentElement();
  resultc.text=c.toString();
  sample_container_id.children.add(resultc);
  var button1=new ButtonInputElement();
  button1.value="CLEAR";
  sample_container_id.children.add(button1);
  button1.onClick.listen(mybutton);
  button1.onClick.listen((e)=> button1.remove());
  button1.onClick.listen((e)=> resultc.remove());
}
void mybutton(MouseEvent event){
  mytexta.value="Input A Number";
  mytextb.value="Input A Number";

}


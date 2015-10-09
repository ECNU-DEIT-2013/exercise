import 'dart:html';
import 'dart:math' as math;
InputElement mytexta;
InputElement mytextb;
UListElement sample_container_id;
void main() {

 querySelector('#sample_text_id')
   ..text="Input The Numbers First AND Click Me To Get The Result"
   ..onClick.listen(myText);
   querySelector('#sample_text_result')
     ..text="CLICK ME TO GET THE RESULT"
     ..onClick.listen(addhundred);
  querySelector('#sample_text_result2')
    ..text="Input The Numbers First AND Click Me To Get The Result"
    ..onClick.listen(addnum);

  mytexta=querySelector('#myTexta');
  mytextb=querySelector('#myTextb');
 sample_container_id=querySelector('#sample_container_id');
 mytextb.onChange.listen(addnumnew);
}

void addnumnew(Event e){
  var a =  document.getElementById("myTexta").value;
  var b = document.getElementById("myTextb").value;
  var A = int.parse(a);
  var B = int.parse(b);
  int c=A+B;
  var resultc=new InputElement();
  resultc.value=c.toString();
  sample_container_id.children.add(resultc);
  var button1=new ButtonInputElement();
  button1.value="CLEAR";
  sample_container_id.children.add(button1);
  button1.onClick.listen(mybutton);
  button1.onClick.listen((e)=> button1.remove());
  button1.onClick.listen((e)=> resultc.remove());
}
void mybutton(MouseEvent event){
  document.getElementById("myTexta").value="Input A Number";
  document.getElementById("myTextb").value="Input A Number";

}
void myText(MouseEvent event){
  var a =  document.getElementById("myTexta").value;
  var b = document.getElementById("myTextb").value;
  var A = int.parse(a);
  var B = int.parse(b);
  addNumber(A,B);
}


void addNumber(num a,num b){
  var c=a+b;

  resultc.value=c.toString();
  document.getElementById("sample_studentid_id").value=c.toString();
}

void addhundred(MouseEvent event){
  var s=0;
  for (int i = 1; i <101; i++){
  s=s+i;
  }
  querySelector('#sample_text_result').text=s.toString();


}
void addnum(MouseEvent event){
  var n =  document.getElementById("myTextx").value;
  var N = int.parse(n);
  var s=0;
  for (int i = 1; i <N+1; i++){
    s=s+i;
  }
  querySelector('#sample_text_result2').text=s.toString();


}
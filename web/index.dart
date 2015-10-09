import 'dart:math' as math;
void main() {
  querySelector('#sample_text_id')
   // ..text = 'Click me!'
  //  ..onClick.listen((MouseEvent e)=>randomStudentID("you!",e))
..text = '='
..onClick.listen(addNumber);
}

void reverseText(MouseEvent event) {
  var text = querySelector('#sample_text_id').text;
  var buffer = new StringBuffer();
  for (int i = text.length - 1; i >= 0; i--) {
    buffer.write(text[i]);
  }
  querySelector('#sample_text_id').text = buffer.toString();
}
//void randomStudentID(String showStr,MouseEvent even){
 // var students={
  //  0:100,
  //  1:200,
  //  2:123,
   // 3:125,
   // 4:155,
   // 5:195
//  };
//  var random = new math.Random();
//  var getYou=students[random.nextInt(6)];
//  querySelector('#sample_studentid_id').text = getYou.toString()+showStr;}
  void addNumber(MouseEvent event)
  { var i;
  var A= int.parse(document.getElementById("left").value);
  var B=int.parse(document.getElementById("right").value);
  var sum=0;
  var C;
  if(A>B)
  { C=A;
  A=B;
  B=C;}
  for(i=A;i<=B;i++)
    sum=sum+i;
  querySelector('#sample_text').text=sum.toString();}
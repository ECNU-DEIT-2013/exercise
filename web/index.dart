import 'dart:html';
import 'dart:math' as math;
import 'utility/people.dart';

void main() {
  querySelector('#sample_text_id')
    ..text='Click me to call students!!'
    ..onClick.listen(randomSelectStu);
  querySelector('#button_for_add')
    ..text=' = '
    ..onClick.listen(addThemUp);
  querySelector('#text_for_addTo100').onClick.listen(addTo100);
}
void addTo100(MouseEvent event){
  var s = 0;
  for (var a=1;a<=100;a++)
    s=s+a;
  querySelector('#text_for_addTo100').text=s.toString();
}

void addThemUp (MouseEvent event){
  var x = int.parse(querySelector('#input1').value);
  var y = int.parse(querySelector('#input2').value);
  querySelector('#sample_text_id2').text=addUp(x,y).toString();
}
void reverseText(MouseEvent event) {
  var text = querySelector('#sample_text_id').text;
  var buffer = new StringBuffer();
  for (int i = text.length - 1; i >= 0; i--) {
    buffer.write(text[i]);
  }
  querySelector('#sample_text_id').text = buffer.toString();
}
int addUp(var x,var y){
  var z=x+y;
  return z;
}
void randomSelectStu(MouseEvent event){
  var stuMap = {
    0:'partridge',
    1:'turtledoves',
    2:'golden rings'
  };
  var random = new math.Random();
  var randomID = random.nextInt(3);
  var stuName = stuMap[randomID];
  querySelector('#sample_student_id').text=stuName;//+' '+
}

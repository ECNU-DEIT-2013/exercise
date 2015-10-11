import 'dart:html';
import 'dart:math' as math;

InputElement num1,num2;
var add2_num1=querySelector('#add2_num1');
var add2_num2=querySelector('#add2_num2');
var result_of_add2=querySelector('#result_of_add2');
void main() {
  querySelector('#text_for_add').onClick.listen(showBoxes);

  querySelector('#sample_text_id')
    ..text='Click me to call students!!'
    ..onClick.listen(randomSelectStu);

  querySelector('#button_for_add')
    ..text='  =  '
    ..onClick.listen(addThemUp);


  querySelector('#text_for_addTo100').onClick.listen(addTo100);

  querySelector('#clear').onClick.listen(reStart);

}
 void reStart (Event e){
   add2_num1.children.clear();
   add2_num2.children.clear();
   result_of_add2.text='Answer hides here';
   querySelector('#text_for_add').text='Click me to start to add 2 numbers';
   querySelector('#clear').text='';

 }
void showBoxes(Event e){
  num1 = new InputElement();
  num2 = new InputElement();
  add2_num1.children.add(num1);
  add2_num2.children.add(num2);
  querySelector('#text_for_add').text='';
}

void addTo100(MouseEvent event){
  var s = 0;
  for (var a=1;a<=100;a++)
    s=s+a;
  querySelector('#text_for_addTo100').text=s.toString();
}

void addThemUp (MouseEvent event){
  var x = int.parse(num1.value);
  var y = int.parse(num2.value);
  result_of_add2.text=addUp(x,y).toString();
  querySelector('#clear').text='Click to restart';
}

int addUp(var x,var y){
  var z=x+y;
  return z;
}

void randomSelectStu(MouseEvent event){
  var stuMap = {
    0:'student 1',
    1:'student 2',
    2:'student 3'
  };

  var random = new math.Random();
  var randomID = random.nextInt(3);
  var stuName = stuMap[randomID];
  querySelector('#sample_student_id').text=stuName;
}

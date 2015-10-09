import 'dart:html';
import 'dart:math' as math;

void main() {
  querySelector('#sample_text_id')
    ..text='Click me!'
    ..onClick.listen(randomSelectStu);
  querySelector('#button_for_add')
    ..text='Add them Up'
    ..onClick.listen(addThemUp);
  querySelector('#button1')
  ..text='1+2+3+...+100='
  ..onClick.listen(LianJia);
}

void LianJia (MouseEvent event){
  var num = 0;
  for (var i=1;i<=100;i++)
    num=num+i;
  querySelector('#Result').text=num.toString();
}

void addThemUp (MouseEvent event){
  var x = int.parse(querySelector('#input1').value);
  var y = int.parse(querySelector('#input2').value);
  querySelector('#sample_text_id2').text=addUp(x,y).toString();
}

int addUp(var x,var y){
  var z=x+y;
  return z;
}

void randomSelectStu(MouseEvent event){
  var stuMap = {
    0:'1ºÅ',
    1:'2ºÅ',
    2:'3ºÅ'  };
  var random = new math.Random();
  var randomID = random.nextInt(3);
  var stuName = stuMap[randomID];
  querySelector('#sample_student_id').text=stuName;
}

import 'dart:html';
import 'dart:math' as math;

void main() {
  querySelector('#button_for_add')
    ..text='+'
    ..onClick.listen(addNumber);
  querySelector('#sample_text_id2').text=addUp(0,0).toString();
}

void addNumber (MouseEvent event){
  var x = int.parse(querySelector('#input1').value);
  var y = int.parse(querySelector('#input2').value);
  querySelector('#sample_text_id2').text=add(x,y).toString();
}
int add(var x,var y){
  var m=x+y;
  return m;
}

import 'dart:html';
import 'dart:math' as math;

void main() {
 querySelector('#button_for_add')
    ..text='='
    ..onClick.listen(addUpNumber);
  querySelector('#sample_text_id2').text=addUp(0,0).toString();
}

void addUpNumber (MouseEvent event){
  var x = int.parse(querySelector('#input1').value);
  var y = int.parse(querySelector('#input2').value);
  querySelector('#sample_text_id2').text=addUp(x,y).toString();
}

int addUp(var x,var y){
  var z=x+y;
  return z;
}

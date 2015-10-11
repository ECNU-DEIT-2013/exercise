import 'dart:html';
import 'dart:math' as math;

void main() {
  querySelector('#button_for_add')
    ..text='+'
    ..onClick.listen(addUpNumber);
  querySelector('#sample_text_id2').text=addUp(0,0).toString();

  querySelector('#button_for_sub')
    ..text='-'
    ..onClick.listen(SubNumber);
  querySelector('#sample_text_id2').text=sub(0,0).toString();

  querySelector('#button_for_mul')
    ..text='*'
    ..onClick.listen(MulNumber);
  querySelector('#sample_text_id2').text=mul(0,0).toString();

  querySelector('#button_for_div')
    ..text='/'
    ..onClick.listen(DivNumber);
  querySelector('#sample_text_id2').text=div(0,0).toString();
}

void addUpNumber (MouseEvent event) {
  var x = int.parse(querySelector('#input1').value);
  var y = int.parse(querySelector('#input2').value);
  querySelector('#sample_text_id2').text = addUp(x, y).toString();
}
void SubNumber (MouseEvent event){
  var x = int.parse(querySelector('#input1').value);
  var y = int.parse(querySelector('#input2').value);
  querySelector('#sample_text_id2').text=sub(x,y).toString();
}
void MulNumber (MouseEvent event){
  var x = int.parse(querySelector('#input1').value);
  var y = int.parse(querySelector('#input2').value);
  querySelector('#sample_text_id2').text=mul(x,y).toString();
}
void DivNumber (MouseEvent event) {
  var x = int.parse(querySelector('#input1').value);
  var y = int.parse(querySelector('#input2').value);
  querySelector('#sample_text_id2').text = div(x, y).toString();
}
int addUp(var x,var y){
  var m=x+y;
  return m;
}
int sub(var x,var y){
  var n=x-y;
  return n;
}
int mul(var x,var y){
  var o=x*y;
  return o;
}
int div(var x,var y) {
  var p = x /= y;
  return p;
}

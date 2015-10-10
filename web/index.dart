import 'dart:html';

var number=0;
void main() {

  querySelector('#sample_text_id1')
    ..text = '1+..+100=?'
    ..onClick.listen(addSum);
  querySelector('#sample_text_id2')
    ..text = 'Here is the answer...';
  querySelector('#button').onClick.listen(add);
}
void add(MouseEvent event){
  int a =int.parse(document.getElementById("text1").value);
  int b =int.parse(document.getElementById("text2").value);
  var x =a+b;
  querySelector('#button').value=x.toString();
}

void addSum(MouseEvent event) {
  var number=0;

  for (var i = 1;i<=100;i++)
  {
    number = i+ number;
  }

  querySelector('#sample_text_id2').text = number.toString();
}


import 'dart:html';

void main() {
  querySelector('#sample_ask_id')
    ..text = 'Please input A and B then click one as your requirement';
  querySelector('#sum').onClick.listen((MouseEvent event) => sum(int.parse(document.getElementById("text1").value),int.parse(document.getElementById("text2").value),event));
  querySelector('#mul').onClick.listen((MouseEvent event) => multiply(int.parse(document.getElementById("text1").value),int.parse(document.getElementById("text2").value),event));
  querySelector('#enter').onClick.listen(clean);
}
void clean(MouseEvent event){
  querySelector('#text1').value = null;
  querySelector('#text2').value = null;
  querySelector('#text3').value = null;
  querySelector('#sign1').text = '';
  querySelector('#sign2').text = '';
}
void sum(int n1,n2,MouseEvent event){
  querySelector('#sign1').text = 'sum';
  querySelector('#sign2').text = '';
  int s=0;
  for(int i = n1; i <= n2; i++){
    s=s+i;
  }
  querySelector('#text3').value = s.toString();
}

void multiply(int n1,n2, MouseEvent event) {
  querySelector('#sign1').text = '';
  querySelector('#sign2').text = 'multiply';
  int s = 1;
  for (int i = n1; i <= n2; i++) {
    s = s * i;
  }
  querySelector('#text3').value = s.toString();
}

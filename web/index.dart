import 'dart:html';
InputElement t1,t2,t3;
UListElement ul1;
void main() {
  querySelector('#text1').value = 1.toString();
  querySelector('#button').onClick.listen((MouseEvent e) => addddd(int.parse(document.getElementById("text1").value),int.parse(document.getElementById("text2").value), e));
  t1 = querySelector('#text1');
  t2=querySelector('#text2');
  t3=querySelector('#text3');
  ul1=querySelector('#ula');
  querySelector('#button2').onClick.listen(addToDoItem);
}
void addddd(int n1,n2,MouseEvent e){
  int s=0;
  for(int i = n1; i <= n2; i++){
    s=s+i;
  }
  querySelector('#text3').value=s.toString();
}
void addToDoItem(MouseEvent e) {
  var newToDo = new LIElement();
  newToDo.text =querySelector('#text3').value;
  t1.value = '';t2.value='';t3.value='';
  ul1.children.add(newToDo);
}
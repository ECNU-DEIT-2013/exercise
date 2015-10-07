import 'dart:html';
void main() {
  querySelector('#equal').onClick.listen(add);


}

void add(MouseEvent event){
  int x =int.parse(document.getElementById("x").value);
  int y =int.parse(document.getElementById("y").value);
  var z =x+y;
  querySelector('#z').value=z.toString();
}






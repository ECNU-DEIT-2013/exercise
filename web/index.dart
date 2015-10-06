import 'dart:html';
void main() {
  querySelector('#add').onClick.listen(add);
  querySelector('#cut').onClick.listen(cut);
  querySelector('#ride').onClick.listen(ride);
  querySelector('#divide').onClick.listen(divide);

}

void add(MouseEvent event){
  int x =int.parse(document.getElementById("x").value);
  int y =int.parse(document.getElementById("y").value);
  var z =x+y;
  querySelector('#z').value=z.toString();
}
void cut(MouseEvent event){
  int x =int.parse(document.getElementById("x").value);
  int y =int.parse(document.getElementById("y").value);
  var z =x-y;
  querySelector('#z').value=z.toString();
}

void ride(MouseEvent event){
  int x =int.parse(document.getElementById("x").value);
  int y =int.parse(document.getElementById("y").value);
  var z =x*y;
  querySelector('#z').value=z.toString();
}
void divide(MouseEvent event){
  int x =int.parse(document.getElementById("x").value);
  int y =int.parse(document.getElementById("y").value);
  var z =x/y;
  querySelector('#z').value=z.toString();
}






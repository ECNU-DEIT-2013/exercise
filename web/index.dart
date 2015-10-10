import 'dart:html';
InputElement x;
InputElement y;
void main() {
  x=querySelector('#x');
  y=querySelector('#y');
  querySelector('#eq').onClick.listen(add);

}

void add(Event e){
  var newx=new LIElement();
  newx.value= int.parse(x.value);
  var newy=new LIElement();
  newy.value= int.parse(y.value);
  int z=newx.value+newy.value;
  querySelector('#z').value=z.toString();
}









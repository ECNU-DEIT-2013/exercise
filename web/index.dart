import 'dart:html';
import 'dart:math' as math;
InputElement toDoInput;
UListElement toDoList;
ButtonElement deleteAll;


void main () {


  querySelector('#add_number')
    ..text = "Add All"
    ..onClick.listen(Addmunbers);

  deleteAll = querySelector('#delete-all');
  deleteAll.onClick.listen((e) => toDoList.children.clear());


  toDoList = querySelector('#to-do-list');
  toDoInput.onChange.listen(Addmunbers);

}
//void reverseText(MouseEvent event){
// var stuMap = {
// 0: 10130340230,
// 1:10130340231,
// 2:10130340232
//};
// var random = new math.Random();
// var randomID=random.nextInt(3);  // Between 0 and 9.
//var studentID=stuMap[randomID];



//}
void Addmunbers(Event e)  {
  var x,y,z;
  x= int.parse(querySelector("id_number_input_1").value);
  y= int.parse(querySelector("id_number_input").value);
  z=x+y;
  var newToDo = new LIElement();
  newToDo.text = z.toString();
  newToDo.onClick.listen((e) => newToDo.remove());
  toDoList.children.add(newToDo);



 // x=1;

  //for (var i = 2; i < 101; i++) {
   // x=x+i;
 // }

  //querySelector('#sample_studentid_id').text= x.toString();

}


import 'dart:html';
import 'dart:math' as math;
void main() {
  querySelector('#sample_text_id')
    ..text = 'Add Number'
    ..onClick.listen(randomSelectStu);
   // ..onClick.listen(reverseText);
}

//void reverseText(MouseEvent event) {
 // var text = querySelector('#sample_text_id').text;
 // var buffer = new StringBuffer();
  //for (int i = text.length - 1; i >= 0; i--) {
  //  buffer.write(text[i]);
 // }
  //querySelector('#sample_text_id').text = buffer.toString();
//}



void randomSelectStu(MouseEvent event) {
  var stuMap={
    0:"eg: 5+6=11",
    1:"eg: 7+9=16"
  };
  var random = new math.Random();
  var randomID=random.nextInt(2);
  var stuID=stuMap[randomID];
  querySelector('#sample_studentid_id').text =stuID.toString();
}

//void AddNumber(num a,b){
 // var text = querySelector('#sample_text_id').text;
  //var buffer = new StringBuffer();
 // text[i]=5+6
    //buffer.write(text[i]);

//};


import 'dart:html';

void main() {
  querySelector('#sum_num')
    ..text = '=';
  querySelector('#sum_num').onClick.listen((MouseEvent event) => addUp(int.parse(document.getElementById("input_num_1").value),int.parse(document.getElementById("input_num_2").value), event));
  querySelector('#next').onClick.listen(Answerdisplay);
}

void addUp(n1,n2,MouseEvent event) {
  var text = querySelector('#sample_text_id').text;
  var sum =n1+n2;
  querySelector('#final_answer')
    ..value='答案是'+sum.toString();
}
void Answerdisplay(event){
  DivElement div = new DivElement();
  div.id='display';
  div.innerHtml = querySelector('#final_answer').value;
  querySelector('#sample_container_id').children.add(div);
  querySelector('#input_num_1').value='';
  querySelector('#input_num_2').value='';
  querySelector('#final_answer').value='';
}
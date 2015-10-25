import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag('sql-insert')
class SqlInsert extends PolymerElement {


  SqlInsert.created() : super.created();
  InputElement t1,t2;
  ButtonElement submit;

 @override
 void attached(){
   super.attached();
   t1=$['t1'];
   t2=$['t2'];
   submit =$['submitButton'];
 }
  @override
  void detached(){
    super.detached();
  }





}
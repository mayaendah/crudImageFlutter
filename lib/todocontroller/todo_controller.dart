import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:uploadimage1/constant/constant.dart';

import '../model/model_todos.dart';


class TodoController extends GetxController{

  RxBool loading=false.obs;
  Rx<List<TodoModel>> todos=Rx<List<TodoModel>>([]);
  @override
  void onInit() {
    super.onInit();
    getAllTodo();
  }

  Future getAllTodo() async{
    try{
      todos.value.clear();
      loading.value=true;
      var response=await http.get(url,headers: {
        'Accept':'application/json'
      });
      
      if(response.statusCode==200){
        loading.value=false;
        print(json.decode(response.body));

        final content=json.decode(response.body)['data'];
        // print(content);
        for(var item in content){
          todos.value.add(TodoModel.fromJson(item));

        }
      }else{
        loading.value=false;
        print(json.decode(response.body));
      }
    }catch(e){
      loading.value=false;
      print(e.toString());
    }
  }

  Future updateTodo(id,text)async{

    try{
      var request=await http.put(Uri.parse('http://192.168.1.11:5000/$id'),headers: {
        'accept':'aplication/json'
      },body: {
        text:text
      });

      if(request.statusCode==200){
        loading.value=false;
        print('updated');
      }else{
        loading.value=false;
        print(json.decode(request.body));
      }
    }catch(e){
      loading.value=false;
      print(e.toString());
    }


  }

  Future addTodo({required String textdata})async{

    var data={
      'text':textdata
    };

    try{
      loading.value=true;
      var request=await http.post(url,headers: {
        'accept':'aplication/json'
      },body: data, );

      if(request.statusCode==200){
        loading.value=false;
        print('Added');
      }else{
        loading.value=false;
        print(json.decode(request.body));
      }
    }catch(e){
      loading.value=false;
      print(e.toString());
    }


  }


}
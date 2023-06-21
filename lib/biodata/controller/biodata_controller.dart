import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/model_biodata.dart';


class BiodataController extends GetxController{

  RxBool loading=false.obs;
  Rx<List<ModelBio>> todos=Rx<List<ModelBio>>([]);
  @override
  void onInit() {
    super.onInit();
    getAllTodo();
  }

  Future getAllTodo() async{
    try{
      todos.value.clear();
      loading.value=true;
      var response=await http.get(Uri.parse("http://192.168.1.8/api/bio"),headers: {
        'Accept':'application/json'
      });

      if(response.statusCode==200){
        loading.value=false;
        // print(json.decode(response.body));

        final content=json.decode(response.body)['bidodata'];
        // print(content);
        for(var item in content){
          todos.value.add(ModelBio.fromJson(item));

        }
      }else{
        loading.value=false;
        print("something went wrong");
      }
    }catch(e){
      loading.value=false;
      print(e.toString());
    }
  }
}
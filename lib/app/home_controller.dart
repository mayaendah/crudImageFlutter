import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/photo_model.dart';

class HomeController extends GetxController {
  var selectedImagePath = ''.obs;
  RxBool loading=false.obs;
  Rx<List<FotoModel>> todos=Rx<List<FotoModel>>([]);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    } else {
      print("No Image Selected");
    }
  }

 Future uploadImage() async{
    // print(selectedImagePath.value);
    final url=Uri.parse("http://192.168.1.11:5000/products");
    var request=http.MultipartRequest('POST',url);
    request.fields['name']="gambar.jpg";


    var pic=await http.MultipartFile.fromPath("image", selectedImagePath.value);
    request.files.add(pic);

    var response=await request.send();

    if(response.statusCode==201){
      print("image uploaded");
    }else{
      print("image not uploaded");
    }
 }
  Future getAllTodo() async{
    try{
      todos.value.clear();
      loading.value=true;
      var response=await http.get(Uri.parse("http://192.168.1.11:5000/products"),headers: {
        'Accept':'application/json',
        'content-type':'aplication/json'
      });

      if(response.statusCode==200){
        loading.value=false;
        print(json.decode(response.body));

        final content=json.decode(response.body)['data'];
        // print(content);
        for(var item in content){
          todos.value.add(FotoModel.fromJson(item));

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
}

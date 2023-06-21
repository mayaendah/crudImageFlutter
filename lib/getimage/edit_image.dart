import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uploadimage1/getimage/image_controller.dart';
import 'package:image_picker/image_picker.dart';

import 'get_image.dart';

class EditImage extends StatelessWidget {
  const EditImage({super.key});

  @override
  Widget build(BuildContext context) {
    ImageController controller=Get.find<ImageController>();

    final _titleController=TextEditingController();

    var one=Get.arguments;

    if(one[1].isNotEmpty){
      _titleController.text=one[1];
    }

    // var fileImage='';
    // if(controller.selectedImagePath.value!=''){
    //   fileImage=controller.selectedImagePath.value;
    // }



    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Page App"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Get.to(GetImage());
            controller.getAllTodo();
          },
        ),
      ),
      body: Obx(()=>
        Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Text("ini adalah id : ${one[0]}"),
              // Text("ini adalah id : ${one[1]}"),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child:
                controller.selectedImagePath.value=='' ?
                Image.network('http://192.168.1.11:5000/images/${one[2]}',
                  height: 150,
                  width: 100,
                  fit: BoxFit.fill,):
                Image.file(File(controller.selectedImagePath.value), height: 150,
                  width: 100,
                  fit: BoxFit.fill,)),
              ElevatedButton(onPressed: (){
                controller.getImage(ImageSource.gallery);
              }, child: Icon(Icons.change_circle)),
              TextField(

                controller:_titleController,
                decoration: InputDecoration(
                  hintText: "Title",
                  label: Text("Title")
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(onPressed: (){
                    controller.updateData("${one[0]}", _titleController.text, "${one[2]}");
                    _titleController.text="";
                    controller.selectedImagePath.value='';
                  }, child: Text("Update")),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

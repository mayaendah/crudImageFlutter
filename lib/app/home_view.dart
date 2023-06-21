import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uploadimage1/app/home_controller.dart';

class HomeView extends GetView<HomeController>{
  // HomeController controller=Get.put(HomeController());

  dynamic file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick Image'),
        centerTitle: true,
      ),
      body: Obx(()=>
          Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Center(
                  child: controller.selectedImagePath.value !=''
                      ? Image.file(File(controller.selectedImagePath.value))
                      : Image.asset('image/ikan.jpg'),
                  ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                controller.uploadImage();
              }, child: Text('Upload image'),)
            ],
          ),
          ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          controller.getImage(ImageSource.gallery);
        },
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

}

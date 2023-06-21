import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uploadimage1/getimage/edit_image.dart';
import 'package:uploadimage1/getimage/image_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GetImage extends StatelessWidget {
  const GetImage({super.key});

  @override
  Widget build(BuildContext context) {
    ImageController controller=Get.put(ImageController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Image App'),
      ),
      body: Obx(() =>
      controller.loading.value?
      CircularProgressIndicator():
      ListView.builder(
          itemCount: controller.todos.value.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap:()=> Get.to(EditImage(),arguments: ["${controller.todos.value[index].id}",'${controller.todos.value[index].name}',"${controller.todos.value[index].image}"]),
              child: Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200),
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.network('http://192.168.1.11:5000/images/${controller.todos.value[index].image}',
                            height: 50,
                            width: 50,
                            fit: BoxFit.fill,),
                          ),
                          SizedBox(width: 10,),
                          Text('${controller.todos.value[index].name}'),
                        ],
                      ),

                      IconButton(onPressed: (){
                        controller.hapusData('${controller.todos.value[index].id}');
                        controller.getAllTodo();
                      }, icon: Icon(Icons.delete),color: Colors.redAccent,iconSize: 25,)
                    ],

                  ),

                ),

              ),
            );
          })),
    );
  }
}

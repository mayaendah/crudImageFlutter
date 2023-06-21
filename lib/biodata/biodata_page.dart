import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:uploadimage1/biodata/controller/biodata_controller.dart';

class BioPage extends StatelessWidget {
  const BioPage({super.key});

  @override
  Widget build(BuildContext context) {
    BiodataController controller = Get.put(BiodataController());
    // print(controller.getDataFromApi());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Biodata App',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Obx(() =>
      controller.loading.value?
          CircularProgressIndicator():
          ListView.builder(
          itemCount: controller.todos.value.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(right: 10, left: 10, bottom: 5),
              padding: EdgeInsets.all(8),
              height: 80,
              child: ListTile(
                title: Text("NIS : "+controller.todos.value[index].nis.toString()),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.amberAccent,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.todos.value[index].nama.toString(),
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              controller.todos.value[index].kelas.toString(),
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200),
            );
          })),
    );
  }
}

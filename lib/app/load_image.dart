import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:uploadimage1/app/home_controller.dart';

class LoadImage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
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
            return Container(
              margin: EdgeInsets.only(right: 10, left: 10, bottom: 5),
              padding: EdgeInsets.all(8),
              height: 80,
              child: ListTile(
                title: Text(""),
                subtitle: Container(
                  margin: EdgeInsets.all(10),
                  width: 50,
                  height: 50,
                  child: Image.network("http://192.168.1.8:80/image"),
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

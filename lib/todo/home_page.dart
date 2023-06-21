import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uploadimage1/todocontroller/todo_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController controller = Get.put(TodoController());
    final TextEditingController textEditingController=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.withOpacity(0.3)),
                            borderRadius: BorderRadius.circular(25)),
                        hintText: 'Enter What Todo'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Obx(() {

                  return controller.loading.value ? CircularProgressIndicator():
                    ElevatedButton(
                      onPressed: () async{
                        await controller.addTodo(textdata:textEditingController.text.trim(),
                        );
                        textEditingController.clear();
                        controller.getAllTodo();
                      },
                      style: ElevatedButton.styleFrom(elevation: 0),
                      child: Text('Send'));
                })
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Obx(() {
              return controller.loading.value
                  ? Center(child: CircularProgressIndicator())
                  : Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.todos.value.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            width: double.infinity,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.withOpacity(0.1)),
                            child: ListTile(
                              title: Text(
                                  controller.todos.value[index].text.toString()),
                              subtitle: Row(
                                children: [
                                  Checkbox(
                                      value: controller
                                                  .todos.value[index].completed ==
                                              1
                                          ? true
                                          : false,
                                      onChanged: (value) async {
                                        await controller.updateTodo(controller.todos.value[index].id, controller.todos.value[index].text);
                                        controller.getAllTodo();
                                      }),
                                  Text(
                                      controller.todos.value[index].completed == 1
                                          ? 'Completed'
                                          : 'Working on it')
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                  );
            }),
          ],
        ),
      ),
    );
  }
}

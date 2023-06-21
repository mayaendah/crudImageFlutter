import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:uploadimage1/getimage/get_image.dart';

import '../app/model/photo_model.dart';
import 'dart:convert';

class ImageController extends GetxController {
  var selectedImagePath = ''.obs;
  var name = ''.obs;
  RxBool loading = false.obs;
  Rx<List<FotoModel>> todos = Rx<List<FotoModel>>([]);
  @override
  void onInit() {
    super.onInit();
    getAllTodo();
  }

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      print(selectedImagePath.value);
    } else {
      print("No Image Selected");
    }
  }

  Future getAllTodo() async {
    try {
      todos.value.clear();
      loading.value = true;
      var response = await http
          .get(Uri.parse("http://192.168.1.11:5000/products"), headers: {
        'Accept': 'application/json',
        'content-type': 'aplication/json'
      });

      if (response.statusCode == 200) {
        loading.value = false;
        // print(json.decode(response.body));

        final content = json.decode(response.body)['data'];
        // print(content);
        for (var item in content) {
          todos.value.add(FotoModel.fromJson(item));
        }
      } else {
        loading.value = false;
        print(json.decode(response.body));
      }
    } catch (e) {
      loading.value = false;
      print(e.toString());
    }
  }

  Future updateData(String id, String name, String image) async {
    final url = Uri.parse("http://192.168.1.11:5000/products/$id");
    var request = http.MultipartRequest('PATCH', url);

    if (selectedImagePath.value != '') {
      request.fields['name'] = name;
      var pic =
          await http.MultipartFile.fromPath("image", selectedImagePath.value);
      request.files.add(pic);
    } else {
      request.fields['name'] = name;
      request.fields['image'] = image;
    }

    var response = await request.send();

    if (response.statusCode == 200) {
      print("image updated");
    } else {
      print("image not updated");
    }
  }

  Future hapusData(String id) async {
    try {
      final response =
          await http.delete(Uri.parse("http://192.168.1.11:5000/products/$id"));

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

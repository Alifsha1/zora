import 'dart:convert';
import 'dart:io';

import 'package:photo_manager/photo_manager.dart';
import 'package:http/http.dart' as http;


class CloudRepo {
  static Future uploadImage(selectedAssets) async {
    //  File? image;
    // List<String> imagePath = [];
    final url = Uri.parse('https://api.cloudinary.com/v1_1/drqwn2wxw/upload');
    // for (int i = 0; i < selectedAssets.length; i++) {
    //   image = await selectedAssets[i].file;
    final request = http.MultipartRequest('POST', url)
      ..fields['upload_preset'] = 'biiptsie'
      ..files.add(
        await http.MultipartFile.fromPath('file', selectedAssets!.path),
      );
    final response = await request.send();
    if (response.statusCode == 200) {
      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      final jsonMap = jsonDecode(responseString);
      return jsonMap['url'];
      // final url = jsonMap['url'];
      // imagePath.add(url);
    }
    // }
    //return imagePath;
  }

  static Future<List<String>> postimageupload(
      List<AssetEntity> selectedAssets) async {
    File? image;
    List<String> imagePath = [];
    final url = Uri.parse('https://api.cloudinary.com/v1_1/domckmnha/upload');
    for (int i = 0; i < selectedAssets.length; i++) {
      image = await selectedAssets[i].file;
      final request = http.MultipartRequest('POST', url)
        ..fields['upload_preset'] = 'wbi7jenn'
        ..files.add(
          await http.MultipartFile.fromPath('file', image!.path),
        );
      final response = await request.send();
      if (response.statusCode == 200) {
        final responseData = await response.stream.toBytes();
        final responseString = String.fromCharCodes(responseData);
        final jsonMap = jsonDecode(responseString);
       // return jsonMap['url'];
          final url = jsonMap['url'];
          imagePath.add(url);
        }
      }
      return imagePath;
    }
  }

//'https://api.cloudinary.com/v1_1/domckmnha/upload'
//wbi7jenn
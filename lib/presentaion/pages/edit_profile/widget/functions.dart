import 'dart:io';

import 'package:image_picker/image_picker.dart';

pickProfilePic() async {
  final XFile? pickedImage =
      await ImagePicker().pickImage(source: ImageSource.gallery);
  return File(pickedImage!.path);
}

pickCoverPic() async {
  final XFile? pickedImage =
      await ImagePicker().pickImage(source: ImageSource.gallery);
  return File(pickedImage!.path);
}

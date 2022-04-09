import 'package:image_picker/image_picker.dart';

final ImagePicker _picker = ImagePicker();

Future<XFile?> pickImageInGallery() async {
  return await _picker.pickImage(
    source: ImageSource.gallery,
    imageQuality: 100,
    maxHeight: 9999,
    maxWidth: 9999,
  );
}

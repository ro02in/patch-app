 //Denna fil använder kod från källa Youtube-video 'Flutter Image Picker & Cropper From Camera & Gallery | Learn Flutter Fast', 
 // youtu.be/qYCsxvbPDC8?si=1U4WiVS3sKaa-Usd av kanalen Marcus Ng på Youtube publicerad 11 november 2022, hämtad 2025-05-17.

 /*import 'package:image_picker/image_picker.dart';
 import 'package:image_cropper/image_cropper.dart';

 class ImageHelper { //Källa: youtu.be/qYCsxvbPDC8?si=1U4WiVS3sKaa-Usd
  ImageHelper({
    ImagePicker? imagePicker,
    ImageCropper? imageCropper,
  }) : _imagePicker = imagePicker ?? ImagePicker(),
      _imageCropper = imageCropper ?? ImageCropper();

      final ImagePicker _imagePicker;
      final ImageCropper _imageCropper;

      Future<XFile?> pickImage({
        ImageSource source = ImageSource.gallery,
        int imageQuality = 100,
      }) async {
        final file = await _imagePicker.pickImage(
          source: source,
          imageQuality: imageQuality
        );
        if(file != null) {
          return await _imagePicker.pickImage(source: source, imageQuality: imageQuality);
        } 
      }
      Future<CroppedFile?> crop({
        required XFile file,
        CropStyle cropStyle = CropStyle.rectangle,
      }) async => _imageCropper.cropImage(
          cropStyle: cropStyle,
          sourcePath: file.path,
          compressQuality: 100,
          uiSettings: [
            IOSUiSettings(),
            AndroidUiSettings(),
          ],
      );
 } */

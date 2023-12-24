
import 'dart:io';
import 'dart:typed_data';

import 'package:expenses/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:expenses/general/helper/configration/DecorationUtils.dart';
import 'package:expenses/general/helper/storage/Storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class Utils {



  static void changeLanguage(String lang, BuildContext context) {
    DecorationUtils.lang = lang;
    Storage.setLang(lang);
    context.read<LangCubit>().onUpdateLanguage(lang);
  }

  static Future<Uint8List?> getImage(bool isCamera) async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery);
    if (image != null) {
      // File imageFile = File(image.path);
      return await _getImageBytes(image);
    }
    return null;
  }

  static Future<Uint8List> _getImageBytes(XFile image) async {
    return await image.readAsBytes();
  }



}

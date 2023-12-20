import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;

import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart' as ga;
import 'package:googleapis_auth/googleapis_auth.dart' as auth;
import 'package:path_provider/path_provider.dart';

class GoogleDriveClient {
  static const String _fileName = 'expenses';
  static const String _appDataFolderName = 'appDataFolder';

  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [ga.DriveApi.driveAppdataScope],
  );

  Future<void> signInWithGoogle() async {
    if (_googleSignIn.currentUser == null) {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      debugPrint('User ${googleUser?.displayName} has signed in');
    } else {
      debugPrint(
          'User ${_googleSignIn.currentUser?.displayName} already signed in');
    }

    // final GoogleSignInAuthentication? googleAuth =
    //     await googleUser?.authentication;

    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth?.accessToken,
    //   idToken: googleAuth?.idToken,
    // );

    // return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    debugPrint('User has signed out');
  }

  Future<ga.DriveApi> _initGoogleDriveApi() async {
    final auth.AuthClient? client = await _googleSignIn.authenticatedClient();
    assert(client != null, 'Authenticated client missing!');
    return ga.DriveApi(client!);
  }

  Future<String?> _getFileIdFromGoogleDrive(String fileName) async {
    final drive = await _initGoogleDriveApi();

    ga.FileList found = await drive.files.list(
      q: 'name = "$fileName"',
      spaces: _appDataFolderName,
    );

    final List<ga.File>? files = found.files;
    if (files == null) {
      return null;
    }

    if (files.isNotEmpty) {
      return files.first.id;
    }
    return null;
  }

  Future<ga.File> _createFileOnGoogleDrive({
    String? fileName,
    String? content,
  }) async {
    final drive = await _initGoogleDriveApi();

    var currentFileId = await _getFileIdFromGoogleDrive(fileName!);
    if (currentFileId != null) {
      debugPrint('File deleted before creating new one');
      await drive.files.delete(currentFileId);
    }

    ga.Media? media;
    if (fileName == fileName && content != null) {
      final directory = await getApplicationDocumentsDirectory();
      var created = io.File("${directory.path}/$fileName");
      await created.writeAsString(content);
      var bytes = await created.readAsBytes();
      media = ga.Media(created.openRead(), bytes.lengthInBytes);
    }

    ga.File file = ga.File();
    file.name = fileName;
    file.parents = [_appDataFolderName];

    final fileCreation = await drive.files.create(file, uploadMedia: media);
    if (fileCreation.id == null) {
      throw PlatformException(
        code: 'Error remoteStorageException',
        message: 'unable to create file on Google Drive',
      );
    }

    return fileCreation;
  }

  Future<String?> _downloadFileToDevice(String fileId) async {
    final drive = await _initGoogleDriveApi();
    ga.Media? file = (await drive.files.get(fileId,
        downloadOptions: ga.DownloadOptions.fullMedia)) as ga.Media?;

    if (file != null) {
      final directory = await getApplicationDocumentsDirectory();
      final saveFile = io.File('${directory.path}/$_fileName');
      final first = await file.stream.first;
      saveFile.writeAsBytes(first);
      return saveFile.readAsString();
    }
    return null;
  }

  Future<void> _deleteFileOnGoogleDrive(String fileId) async {
    final drive = await _initGoogleDriveApi();
    await drive.files.delete(fileId);
  }

  Future<void> uploadFile(String fileContent) async {
    try {
      ga.File? file = await _createFileOnGoogleDrive(
        fileName: _fileName,
        content: fileContent,
      );
      debugPrint('Created File name: ${file.name} on RemoteStorage');
    } catch (e) {
      debugPrint('GoogleDrive, uploadFileContent $e');
    }
  }

  Future<String?> downloadFile() async {
    try {
      var fileId = await _getFileIdFromGoogleDrive(_fileName);
      if (fileId != null) {
        final fileContent = await _downloadFileToDevice(fileId);
        debugPrint('Downloaded File content: $fileContent');
        return fileContent;
      }
      debugPrint('File not found on storage');
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<void> deleteData() async {
    try {
      var currentFileId = await _getFileIdFromGoogleDrive(_fileName);
      if (currentFileId == null) {
        debugPrint('currentFileId is null');
        return;
      }
      await _deleteFileOnGoogleDrive(currentFileId);
      debugPrint('Data deleted');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  String convertDataToJson() {
    Map<String, dynamic> data = {
      'salary': '4000',
    };
    return json.encode(data);
  }
}

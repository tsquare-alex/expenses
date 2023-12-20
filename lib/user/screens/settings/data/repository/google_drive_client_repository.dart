import 'package:expenses/user/screens/settings/data/api/google_drive_client.dart';

class GoogleDriveClientRepository {
  final GoogleDriveClient _googleDriveClient;

  GoogleDriveClientRepository(
    this._googleDriveClient,
  );

  Future<void> syncData() async {
    await _googleDriveClient.signInWithGoogle();
    await _googleDriveClient.uploadFile(_googleDriveClient.convertDataToJson());
    await _googleDriveClient.downloadFile();
  }

  Future<void> backupData() async {
    await _googleDriveClient.signInWithGoogle();
    await _googleDriveClient.uploadFile(_googleDriveClient.convertDataToJson());
  }

  Future<void> downloadData() async {
    await _googleDriveClient.signInWithGoogle();
    await _googleDriveClient.downloadFile();
  }

  Future<void> deleteData() async {
    await _googleDriveClient.signInWithGoogle();
    await _googleDriveClient.deleteData();
  }

  Future<void> signOut() async {
    await _googleDriveClient.signOutFromGoogle();
  }
}

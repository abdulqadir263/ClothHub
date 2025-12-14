import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';


class CloudinaryService {

  static const String cloudName = 'dybx88bzo';
  static const String apiKey = '944328244948163';
  static const String apiSecret = 'dsoUe_Vq3MQ00kex8qsx96gfjjc';


  Future<String> uploadImage(File imageFile) async {
    final url = Uri.parse(
      'https://api.cloudinary.com/v1_1/$cloudName/image/upload',
    );

    final timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final signatureString = 'timestamp=$timestamp$apiSecret';
    final signature = sha1.convert(utf8.encode(signatureString)).toString();

    final request = http.MultipartRequest('POST', url);
    request.fields['api_key'] = apiKey;
    request.fields['timestamp'] = timestamp.toString();
    request.fields['signature'] = signature;
    request.files.add(await http.MultipartFile.fromPath('file', imageFile.path));

    final response = await request.send();
    final responseData = await response.stream.bytesToString();
    final jsonData = json.decode(responseData);

    if (response.statusCode == 200) {
      return jsonData['secure_url'] ?? '';
    } else {
      throw Exception('Failed to upload image: ${jsonData['error']['message']}');
    }
  }


  Future<bool> deleteImage(String publicId) async {
    final url = Uri.parse(
      'https://api.cloudinary.com/v1_1/$cloudName/image/destroy',
    );

    final timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final signatureString = 'public_id=$publicId&timestamp=$timestamp$apiSecret';
    final signature = sha1.convert(utf8.encode(signatureString)).toString();

    final response = await http.post(
      url,
      body: {
        'api_key': apiKey,
        'timestamp': timestamp.toString(),
        'signature': signature,
        'public_id': publicId,
      },
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData['result'] == 'ok';
    }
    return false;
  }

  String getPublicIdFromUrl(String url) {
    final uri = Uri.parse(url);
    final pathSegments = uri.pathSegments;

    if (pathSegments.length > 2) {
      final filenameWithExt = pathSegments.last;
      final filename = filenameWithExt.split('.').first;
      return filename;
    }
    return '';
  }
}


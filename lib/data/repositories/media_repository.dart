import 'package:cloudinary_sdk/cloudinary_sdk.dart';

class MediaRepository {

  late Cloudinary cloudinary;

  MediaRepository()
  {
    cloudinary = Cloudinary.full(
      apiKey: '944328244948163',
      apiSecret: 'dsoUe_Vq3MQ00kex8qsx96gfjjc',
      cloudName: 'dybx88bzo',
    );
  }

  Future<CloudinaryResponse> uploadImage(String path)
  {
    return cloudinary.uploadResource(
      CloudinaryUploadResource(
        filePath: path,
        resourceType: CloudinaryResourceType.image,
      ),
    );
  }
}


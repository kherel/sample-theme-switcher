import 'package:application/core/media_model.dart';

class StorageMediaList{
  int mediaType;
  List<MediaModel> allMedia;

  StorageMediaList(this.mediaType, this.allMedia);

  StorageMediaList.fromMap(Map m){
    mediaType = m['mediaType'] as int;
    allMedia = m['allMedia'] as List<MediaModel>;
  }
}
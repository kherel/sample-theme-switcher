class MediaModel {
  List<String> files;
  String folder;

  MediaModel({this.files, this.folder});

  MediaModel.fromJson(Map<String, dynamic> json) {
    files = json['files'].cast<String>();
    folder = json['folderName'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['files'] = files;
    data['folderName'] = folder;
    return data;
  }
}

class FileMetaData{
  String path;
  String displayName;
  String album;
  String artist;
  String dateAdded;
  String size;
  String duration;
}
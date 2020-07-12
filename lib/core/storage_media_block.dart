import 'dart:convert';

import 'package:application/core/media_model.dart';
import 'package:application/core/storage_media_list.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storage_path/storage_path.dart';

class StorageMediaBloc {
  BehaviorSubject<List<StorageMediaList>> _storageMedia$;
  BehaviorSubject<List<MediaModel>> _imagesMedia$;
  BehaviorSubject<List<MediaModel>> _videosMedia$;

  BehaviorSubject<List<MediaModel>> get imagesMedia$ => _imagesMedia$;
  BehaviorSubject<List<MediaModel>> get videosMedia$ => _videosMedia$;

  StorageMediaBloc() {
    _initStreams();
    _initObservers();
  }

  Future<void> fetchVideos()async {
    try {
      final String videos = await StoragePath.videoPath;
      _videosMedia$.add((jsonDecode(videos) as List).map<MediaModel>((json) => MediaModel.fromJson(json as Map<String,dynamic>)).toList());
    } on PlatformException {
      _videosMedia$.add([]);
    }
  }
  Future<void> fetchImages() async {
    try {
      final String images = await StoragePath.imagesPath;
      _imagesMedia$.add((jsonDecode(images) as List).map<MediaModel>((json) => MediaModel.fromJson(json as Map<String,dynamic>)).toList());
    } on PlatformException {
      _imagesMedia$.add([]);
    }
  }

  void _initStreams() {
    _storageMedia$ = BehaviorSubject<List<StorageMediaList>>();
    _imagesMedia$ = BehaviorSubject<List<MediaModel>>();
    _videosMedia$ = BehaviorSubject<List<MediaModel>>();
  }

  void _initObservers() {
    _videosMedia$.listen((List<MediaModel> mediaList) {
    });
    _videosMedia$.listen((List<MediaModel> mediaList) {
    });
  }

  void dispose() {
    _storageMedia$.close();
  }
}

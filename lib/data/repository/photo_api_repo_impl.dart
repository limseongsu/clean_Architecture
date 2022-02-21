import 'dart:convert';

import 'package:clean_architecture/data/data_source/pixabay_api.dart';
import 'package:clean_architecture/domain/model/photo.dart';
import 'package:clean_architecture/domain/repository/photo_api_repo.dart';
import 'package:http/http.dart' as http;

class PhotoApiRepoImpl implements PhotoApiRepo {

  PixabayApi api;

  PhotoApiRepoImpl(this.api);


  @override
  Future<List<Photo>> fetch(String query,{http.Client? client}) async {
    List<Photo> _photos = [];
    final result = await api.fetch(query);
    result.forEach((e) {
      _photos.add(Photo.fromJson(e));
    });
    return _photos;
  }
}

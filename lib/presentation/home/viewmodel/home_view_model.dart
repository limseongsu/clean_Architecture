import 'dart:async';

import 'package:clean_architecture/domain/repository/photo_api_repo.dart';
import 'package:clean_architecture/domain/model/photo.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  final PhotoApiRepo photoApiRepo;

  HomeViewModel(this.photoApiRepo);

  RxList<Photo>? _photos = <Photo>[].obs;

  // RxList<Photo>? get photos => _photos;
  UnmodifiableListView<Photo>? get photos => UnmodifiableListView(_photos!);

  RxBool isLoading = false.obs;

  final controller = TextEditingController();

  @override
  Future onInit() async {
    if (controller.text == "") {
      isLoading.value = true;
      return "";
    }
  }

  Future<void> fetch(String query) async {
    isLoading.value = false;
    final result = await photoApiRepo.fetch(query);
    _photos!.value = result;
    isLoading.value = true;
    update();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

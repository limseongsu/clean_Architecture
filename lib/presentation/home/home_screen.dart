import 'package:clean_architecture/data/data_source/pixabay_api.dart';
import 'package:clean_architecture/data/repository/photo_api_repo_impl.dart';
import 'package:clean_architecture/presentation/home/modules/photo_module.dart';
import 'package:clean_architecture/presentation/home/viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
        init: HomeViewModel(PhotoApiRepoImpl(PixabayApi(http.Client()))),

        builder: (viewModel) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: const Text(
                "이미지 검색 앱",
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: viewModel.controller,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () async {
                              viewModel.fetch(viewModel.controller.text);
                            },
                            icon: const Icon(Icons.search))),
                  ),
                          //provider 의  Consumer 역활
                          Obx(() =>
                          viewModel.isLoading.value ?
                              Expanded(
                            child: GridView.builder(
                                padding: const EdgeInsets.all(16),
                                itemCount: viewModel.photos!.length,
                                gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 16,
                                ),
                                itemBuilder: (context, index) {
                                  final photo = viewModel.photos![index];
                                  return PhotoModule(photo: photo);
                                }),
                          )
                              : const Padding(
                                padding: EdgeInsets.only(top:250.0),
                                child: CircularProgressIndicator(),
                              )
                          ),
                ],
              ),
            ),
          );
        }
    );
  }

}


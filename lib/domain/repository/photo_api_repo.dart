
import 'package:clean_architecture/domain/model/photo.dart';

abstract class PhotoApiRepo {

  Future<List<Photo>> fetch(String query);

}
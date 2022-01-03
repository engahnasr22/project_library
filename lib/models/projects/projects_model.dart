import 'package:app_library/models/projects/category_model.dart';
import 'package:app_library/models/users/user.dart';

class Project {
  int? proId;
  String? proTitle;
  String? proDesc, proImage;
  User? userName;
  ProjectsCategory? projectCategory;

  Project(this.proId, this.proTitle, this.proDesc, this.proImage, this.userName,
      this.projectCategory);

  Project.fromJson(Map<String, dynamic> jsonObject) {
    proId = jsonObject['id'];
    proTitle = jsonObject['title'];
    proDesc = jsonObject['desc'];
    proImage = jsonObject['image'];
    userName = User.fromJson(jsonObject['user']);
    projectCategory = ProjectsCategory.fromJson(jsonObject['category']);
  }
}

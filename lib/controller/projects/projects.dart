import 'dart:convert';

import 'package:app_library/constant/api_url.dart';
import 'package:app_library/models/projects/projects_model.dart';
import 'package:http/http.dart' as http;

class ProjectsController {
  Future<List<Project>?> fetchProjects(int page) async {
    Map<String, String> headers = {'Accept': 'application/json'};
    String url = ApiUtilUrl.projectsUrlApi + '?page=' + page.toString();

    http.Response response = await http.get(Uri.parse(url), headers: headers);

    List<Project> projects = [];

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      for (var item in body['data']) {
        projects.add(Project.fromJson(item));
      }
      return projects;
    }
    return null;
  }
}

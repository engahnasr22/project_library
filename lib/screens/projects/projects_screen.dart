import 'package:app_library/constant/api_url.dart';
import 'package:app_library/constant/colors.dart';
import 'package:app_library/controller/projects/projects.dart';
import 'package:app_library/models/projects/category_model.dart';
import 'package:app_library/models/projects/projects_model.dart';
import 'package:flutter/material.dart';

class OverviewProjectsHome extends StatelessWidget {
  OverviewProjectsHome({Key? key}) : super(key: key);
  String urlImage = ApiUtilUrl.mainImgURL;
  ProjectsController projectController = ProjectsController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      //body: const Body(),
      body: FutureBuilder(
        future: projectController.fetchProjects(1),
        builder:
            (BuildContext context, AsyncSnapshot<List<Project>?> snapShot) {
          switch (snapShot.connectionState) {
            case ConnectionState.none:
              return _error('Nothing Is Happened !!');
            case ConnectionState.waiting:
              return _loading();
            case ConnectionState.active:
              return _loading();
            case ConnectionState.done:
              if (snapShot.hasError) {
                return _error(snapShot.error.toString());
              } else {
                if (!snapShot.hasData) {
                  return _error('No Data');
                } else {
                  return ListView.builder(
                    itemBuilder: (BuildContext context, int position) {
                      return _projectShow(snapShot.data![position]);
                    },
                    itemCount: snapShot.data!.length,
                  );
                }
              }
          }
        },
      ),
    );
  }

  _projectShow(Project project) {
    return Card(
      child: Row(
        children: <Widget>[
                       Column(
               children: [
                 ClipRRect(
                   borderRadius: BorderRadius.circular(15),
                   child: FadeInImage.assetNetwork(
                     placeholder: 'assets/images/loading_img_new.gif',
                     image: urlImage + project.proImage!,
                     width: 100,
                     height: 100,
                     fit: BoxFit.cover,
                   ),
                 ),
               ],
             ),
     
             Column(
            children: [
              Text(
                project.proTitle!,
                textAlign: TextAlign.right,
                style: const TextStyle(
                    color: kDefaultTextColor,
                    fontFamily: 'Tajawal',
                    fontSize: 20),
              ),
              Row(
                children: [
                  Text(
                    project.projectCategory!.catTitle!,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        color: kDefaultTextColor,
                        fontFamily: 'Tajawal',
                        fontSize: 20),
                  ),
                  Text(
                    project.projectCategory!.catDesc!,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        color: kDefaultTextColor,
                        fontFamily: 'Tajawal',
                        fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
    
        ],
      ),
    );
  }

  _error(String error) {
    return Center(
      child: Text(error),
    );
  }

  _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0.0,
      leading: IconButton(
        icon: const Icon(Icons.sort),
        onPressed: () {},
      ),
    );
  }
}

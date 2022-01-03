import 'package:app_library/constant/api_url.dart';
import 'package:app_library/constant/colors.dart';
import 'package:app_library/controller/projects/projects.dart';
import 'package:app_library/models/projects/projects_model.dart';
import 'package:flutter/material.dart';

class OverviewProjectsHome extends StatelessWidget {
   OverviewProjectsHome({ Key? key }) : super(key: key);
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
      color: kDefaultBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/loading_img_new.gif',
                  image: urlImage + project.proImage!),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                project.proTitle!,
                style: const TextStyle(
                    color: Colors.white, fontFamily: 'Tajawal', fontSize: 20),
              ),
            )
          ],
        ),
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
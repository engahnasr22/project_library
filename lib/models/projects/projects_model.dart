import 'package:app_library/models/projects/category_model.dart';

class Project {
   int proId;
   String proTitle;
   String proDesc;
   String proImgUrl;
  ProjectCategoryName projectcategory;


  Project({
    required this.proId, 
    required this.proTitle, 
    required this.proDesc, 
    required this.proImgUrl, 
    required this.projectcategory
    });

  
}

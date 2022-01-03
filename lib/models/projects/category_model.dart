class ProjectsCategory {
  int? catId;
  String? catTitle, catDesc, catImage;

  ProjectsCategory(this.catId, this.catTitle, this.catDesc, this.catImage);

  ProjectsCategory.fromJson(Map<String, dynamic> jsonObject) {
    catId = jsonObject['id'];
    catTitle = jsonObject['title'];
    catDesc = jsonObject['desc'];
    catImage = jsonObject['image'];
    
  }
}

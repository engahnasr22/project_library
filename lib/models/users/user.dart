class User {
  String? firstName;
  String? lastName;
  String? email;
  String? rememberToken;
  int? id;


  User(this.firstName, this.lastName, this.email, [this.rememberToken , this.id]); 

  User.fromJson(Map<String,dynamic> jsonObject) {
    id = jsonObject['id'];
    firstName = jsonObject['firstName'];
    lastName = jsonObject['lastName'];
    email = jsonObject['email'];
    rememberToken = jsonObject['remember_token'];
  }
}

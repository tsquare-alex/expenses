class UsersModel {
  UsersModel(
      { this.id,
        required this.name,
        required this.email});

  String? id;
  String? name;
  String? email;

  factory UsersModel.fromJson(Map<String,dynamic> json) =>
      UsersModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
      );


  Map<String,dynamic> toJson() =>{
    'id' : id,
    'name' : name,
    'email' : email,
  };
}

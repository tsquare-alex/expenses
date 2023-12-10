class DataBaseModel {
  String companyName;
  String type;
  String phone;
  String address;
  String name;
  String email;

  DataBaseModel(this.companyName, this.type, this.phone, this.address,
      {required this.name, required this.email});
}

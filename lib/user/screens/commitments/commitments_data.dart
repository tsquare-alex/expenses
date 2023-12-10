part of 'commitments_imports.dart';

class CommitmentsData{

  final GlobalKey<DropdownSearchState> commitmentDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> incomeDropKey = GlobalKey();


  //
  int? commitmentsId;
  int? incomeId;
  DropdownModel? selectedCommitments;
  DropdownModel? selectedIncome;

  List<DropdownModel> commitments=[
    DropdownModel(
        id:12,name:"فواتير"
    ),
    DropdownModel(
        id:11,name:"ايحار"
    ),
    DropdownModel(
        id:10,name:"أقساط"
    ),
    DropdownModel(
        id:10,name:"تأمين"
    ),
    DropdownModel(
        id:10,name:"اشتراكات"
    ),
    DropdownModel(
        id:10,name:"مصاريف سيارة"
    ),
  ];

  List<DropdownModel> incomes=[
    DropdownModel(
        id:12,name:"افتراضي"
    ),
    DropdownModel(
        id:11,name:"اختيار من الدخل"
    ),
  ];

  Future<List<DropdownModel>> getCommitments(BuildContext context) async {
    return commitments;
  }

  void setSelectCommitment(DropdownModel? model) {
    selectedCommitments = model;
    commitmentsId = model?.id;
  }

  Future<List<DropdownModel>> getIncomes(BuildContext context) async {
    return incomes;
  }

  void setSelectIncomes(DropdownModel? model) {
    selectedIncome = model;
    incomeId = model?.id;
  }
}
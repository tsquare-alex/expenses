part of 'commitments_imports.dart';

class CommitmentsData{
  GenericBloc<bool> contentCubit = GenericBloc(false);

  List<DropdownModel> contents=[
    DropdownModel(
      id: 0,
      name: "كهرباء",
    ),
    DropdownModel(
      id: 1,
      name: "مياه",
    ),
    DropdownModel(
      id: 2,
      name: "غاز",
    ),
  ];

}
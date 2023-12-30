part of 'bag_widgets_imports.dart';

class AddBagItem extends StatelessWidget {
  const AddBagItem({Key? key, required this.bagData}) : super(key: key);
  final BagData bagData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        title: MyText(
          title: tr(context, "add"),
          size: 14.sp,
          color: MyColors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Form(
        key: bagData.formKey,
        child: Column(
          children: [
            OpenContainer(
              closedElevation: 0,
              closedColor: Colors.transparent,
              closedShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              transitionDuration: const Duration(milliseconds: 400),
              openBuilder: (_, closeContainer) => Scaffold(
                floatingActionButton: FloatingActionButton(
                  onPressed: () => bagData.addBagModel(context),
                  backgroundColor: MyColors.primary,
                  child: Icon(
                    Icons.add,
                    color: MyColors.white,
                  ),
                ),
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: MyColors.primary,
                  title: MyText(
                    title: tr(context, "transaction"),
                    color: MyColors.white,
                    size: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                body: Padding(
                  padding: EdgeInsets.all(15.r),
                  child: BlocBuilder<GenericBloc<List<DropdownModel>>,
                      GenericState<List<DropdownModel>>>(
                    bloc: bagData.bagCubit,
                    builder: (context, state) => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.data.length,
                      itemBuilder: (context, i) => Padding(
                        padding: EdgeInsets.only(bottom: 5.0.r),
                        child: InkWell(
                          onTap: () {
                            bagData.typeCubit.onUpdateData(state.data[i]);
                            AutoRouter.of(context).pop();
                            print(bagData.typeCubit.state.data?.name);
                          },
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 20.r,
                                    backgroundColor: MyColors.primary,
                                    child: Image.asset(
                                      Res.transaction,
                                      color: MyColors.white,
                                      width: 18.w,
                                      height: 18.h,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  MyText(
                                    title: state.data[i].name ?? "",
                                    color: MyColors.black,
                                    size: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              if (i != state.data.length - 1)
                                Divider(
                                  thickness: 1.w,
                                  color: MyColors.grey,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              closedBuilder: (_, openContainer) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0.r),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  //margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 7),
                  decoration: BoxDecoration(
                      color: MyColors.backgroundColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [BoxShadow(color: MyColors.shadow,spreadRadius: 0,blurRadius: 12)]
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20.r,
                        backgroundColor: MyColors.primary,
                        child: Image.asset(
                          Res.transaction,
                          color: MyColors.white,
                          width: 18.w,
                          height: 18.h,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      BlocBuilder<GenericBloc<DropdownModel?>, GenericState<DropdownModel?>>(
                        bloc: bagData.typeCubit,
                        builder: (context, state) {
                          return MyText(title: state.data?.name??tr(context, "transaction"), color: MyColors.black, size: 13.sp,fontWeight: FontWeight.bold,);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                MyText(
                  title: tr(context, "selectUnit"),
                  color: MyColors.black,
                  size: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  width: 10.h,
                ),
                Expanded(
                  child: DropdownTextField<DropdownModel>(
                    dropKey: bagData.unitsDropKey,
                    label: tr(context, "unit"),
                    selectedItem: bagData.selectedUnit,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    validate: (value) {
                      return "Select unit";
                    },
                    onChange: bagData.setSelectUnit,
                    finData: (data) => bagData.getUnits(
                      context,
                    ),
                    useName: true,
                    buttonsColor: MyColors.primary,
                    searchHint:tr(context, "search"),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                MyText(title: tr(context, "amount"), color: MyColors.black, size: 13.sp,fontWeight: FontWeight.bold,),
                SizedBox(
                  width: 30.w,
                ),
                Expanded(
                  child: GenericTextField(
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16),
                    controller: bagData.amountController,
                    fieldTypes: FieldTypes.normal,
                    type: TextInputType.number,
                    action: TextInputAction.next,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Enter the amount';
                      }
                    },
                    label: tr(context, "amount"),
                    margin: const EdgeInsets.only(top: 0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                MyText(
                  title: tr(context, "priorityRatio"),
                  color: MyColors.black,
                  size: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  width: 10.h,
                ),
                Expanded(
                  child: DropdownTextField<DropdownModel>(
                    dropKey: bagData.priorityDropKey,
                    label: tr(context, "priority"),
                    selectedItem: bagData.selectedPriority,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    validate: (value) {
                      return "Select the priority";
                    },
                    onChange: bagData.selectedPriority,
                    finData: (data) => bagData.getPriority(
                      context,
                    ),
                    useName: true,
                    buttonsColor: MyColors.primary,
                    searchHint:tr(context, "search"),
                  ),
                )
              ],
            ),
            AddBagItemButton(data:bagData,),
          ],
        ),
      ),
    );
  }
}

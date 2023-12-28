part of 'bag_widgets_imports.dart';

class AddBagItem extends StatelessWidget {
  const AddBagItem({Key? key, required this.data}) : super(key: key);
  final BagData data;

  @override
  Widget build(BuildContext context) {
    return Form(
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
                onPressed: (){},
                backgroundColor: MyColors.primary,
                child: Icon(Icons.add,color: MyColors.white,),
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
                child: BlocBuilder<GenericBloc<List<DropdownModel>>,GenericState<List<DropdownModel>>>(
                  bloc: data.bagCubit,
                  builder: (context,state)=>ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.data.length,
                    itemBuilder: (context, i) => Padding(
                      padding: EdgeInsets.only(bottom: 5.0.r),
                      child: InkWell(
                        onTap: () {
                          // if(type=="المعاملات النقدية"){
                          //   addTransactionData.cashTypeCubit
                          //       .onUpdateData(state.data[i]);
                          //   AutoRouter.of(context).pop();
                          //   print(addTransactionData
                          //       .cashTypeCubit.state.data?.name);
                          // }else if(type=="الاهداف المالية المستهدفة"){
                          //   addTransactionData.targetTypeCubit
                          //       .onUpdateData(state.data[i]);
                          //   AutoRouter.of(context).pop();
                          //   print(addTransactionData
                          //       .targetTypeCubit.state.data?.name);
                          //}

                        },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 20.r,
                                  backgroundColor:
                                  MyColors.primary,
                                  child: Image.asset(Res.transaction,color: MyColors.white,width: 18.w,height: 18.h,),
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                MyText(
                                  title: state.data[i].name ??
                                      "",
                                  color: MyColors.black,
                                  size: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            if(i!=state.data.length-1)Divider(thickness: 1.w,color: MyColors.grey,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            closedBuilder: (_, openContainer) => Row(
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
                Expanded(
                  child: GenericTextField(
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16),
                    controller: data.transactionController,
                    fieldTypes: FieldTypes.clickable,
                    type: TextInputType.text,
                    action: TextInputAction.next,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Enter brand name';
                      }
                    },
                    label: tr(context, "transaction"),
                    margin: const EdgeInsets.only(top: 0),
                    suffixIcon: Icon(Icons.arrow_drop_down,color: MyColors.grey,size: 28.w,),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

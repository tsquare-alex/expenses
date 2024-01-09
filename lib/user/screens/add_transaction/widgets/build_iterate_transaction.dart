part of 'add_transaction_widgets_imports.dart';

class BuildIterateTransaction extends StatelessWidget {
  const BuildIterateTransaction({Key? key, required this.addTransactionData, required this.type})
      : super(key: key);
  final AddTransactionData addTransactionData;
  final String type;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
      bloc: addTransactionData.iterateCubit,
      builder: (context, state) {
        if(state.data == false){
          addTransactionData.notifyCubit.onUpdateData(false);
          print(addTransactionData.notifyCubit.state.data);
        }
        return Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.r),
              margin: EdgeInsets.symmetric(vertical: 10.r),
              decoration: BoxDecoration(
                color: MyColors.backgroundColor,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        MyText(title: type!="الاهداف المالية المستهدفة"?tr(context, "repeatTransaction"):tr(context, "repeatTransfer"),
                          color: MyColors.black,
                          size: 14.sp,
                          fontWeight: FontWeight.bold,),
                        SizedBox(
                          width: 5.w,
                        ),
                        if(state.data==true)Expanded(
                          child: DropdownTextField<DropdownModel>(
                            dropKey: addTransactionData.iterateTransactionDropKey,
                            label: type!="الاهداف المالية المستهدفة"?tr(context, "repeatDuration"):tr(context, "repeatDuration"),
                            selectedItem: addTransactionData.selectedIterateTransaction,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            validate: (value) {
                              if(value==null){
                                print("Please fill this field");
                              }
                            },
                            onChange: addTransactionData.setSelectIterateTransaction,
                            finData: (data) => addTransactionData.getIterateTransaction(context),
                            useName: true,
                            hasLocalization: true,
                            buttonsColor: MyColors.primary,
                            searchHint: tr(context, "search"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  CupertinoSwitch(
                    trackColor: MyColors.blackOpacity,
                    value: state.data,
                    onChanged: (value) {
                      addTransactionData.iterateCubit.onUpdateData(value);
                    },
                  )
                ],
              ),
            ),
            if(state.data==true)BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              bloc: addTransactionData.notifyCubit,
              builder: (context, state1) {
                return Container(
                  padding: EdgeInsets.all(10.r),
                  margin: EdgeInsets.symmetric(vertical: 10.r),
                  decoration: BoxDecoration(
                    color: MyColors.backgroundColor,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            MyText(title: tr(context, "notify"),
                              color: MyColors.black,
                              size: 14.sp,
                              fontWeight: FontWeight.bold,),
                            SizedBox(
                              width: 10.w,
                            ),
                            MyText(title: "(${tr(context, "remember")})",
                              color: MyColors.black,
                              size: 9.sp,
                              fontWeight: FontWeight.bold,),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      CupertinoSwitch(
                        trackColor: MyColors.blackOpacity,
                        value: state1.data,
                        onChanged: (value) {
                          addTransactionData.notifyCubit.onUpdateData(value);
                        },
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

part of 'add_transaction_widgets_imports.dart';

class BuildIterateTransaction extends StatelessWidget {
  const BuildIterateTransaction({Key? key, required this.data}) : super(key: key);
  final AddTransactionData data;
  @override
  Widget build(BuildContext context) {
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
          MyText(title: "تكرار المعاملة",
            color: MyColors.black,
            size: 14.sp,
            fontWeight: FontWeight.bold,),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: data.iterateCubit,
            builder: (context, state) {
              return CupertinoSwitch(
                trackColor: MyColors.blackOpacity,
                value: state.data,
                onChanged: (value) {
                  data.iterateCubit.onUpdateData(value);
                },
              );
            },
          )
        ],
      ),
    );
  }
}

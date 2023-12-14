part of 'add_transaction_widgets_imports.dart';

class BuildIterateTransaction extends StatelessWidget {
  const BuildIterateTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      margin: EdgeInsets.symmetric(vertical:10.r),
      decoration: BoxDecoration(
        color: MyColors.backgroundColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText(title: "تكرار المعاملة", color: MyColors.black, size: 14.sp,fontWeight: FontWeight.bold,),
          CupertinoSwitch(
            trackColor: MyColors.blackOpacity,
            value: false,
            onChanged: (value) {},
          )
        ],
      ),
    );
  }
}

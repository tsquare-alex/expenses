part of 'transactions_widgets_imports.dart';

class BuildTransactionTypeItem extends StatelessWidget {
  const BuildTransactionTypeItem({Key? key, required this.image, required this.name, this.onTap}) : super(key: key);
  final String image;
  final String name;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: MyColors.primary.withOpacity(0.3),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(image,width: 55.w,height: 55.h,color: MyColors.primary,),
            SizedBox(height: 15.h,),
            MyText(title: name, color: MyColors.primary, size: 14.sp,fontWeight: FontWeight.bold,alien: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}

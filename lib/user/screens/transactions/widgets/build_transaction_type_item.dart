part of 'transactions_widgets_imports.dart';

class BuildTransactionTypeItem extends StatelessWidget {
  const BuildTransactionTypeItem({Key? key, required this.image, required this.name, this.onTap}) : super(key: key);
  final String image;
  final String name;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 170,
            height: 170,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: MyColors.greyWhite
            ),
            child:  Image.asset(image,width: 55.w,height: 55.h,),

          ),
          SizedBox(height: 15.h,),
          MyText(title: name, color: MyColors.black, size: 16.sp,fontWeight: FontWeight.bold,alien: TextAlign.center,),

        ],
      ),
    );
  }
}

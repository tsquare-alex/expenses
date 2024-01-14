part of 'cart_widgets_imports.dart';

class BuildCartItem extends StatelessWidget {
  const BuildCartItem({Key? key, this.onTap, required this.name, required this.image}) : super(key: key);
  final GestureTapCallback? onTap;
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: CircleAvatar(
            radius: 65.r,
            child: Image.asset(image,width: 40.w,height: 40.h,),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        MyText(title: name, color: MyColors.black, size: 14.sp,fontWeight: FontWeight.bold,),
      ],
    );
  }
}
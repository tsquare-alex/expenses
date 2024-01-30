part of 'cart_widgets_imports.dart';

class BuildCartItem extends StatelessWidget {
  const BuildCartItem(
      {Key? key, this.onTap, required this.name, required this.image})
      : super(key: key);
  final GestureTapCallback? onTap;
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: onTap,
          child: CircleAvatar(
            backgroundColor: MyColors.greyWhite,
            radius: 100.r,
            child: Image.asset(
              image,
              width: 70.w,
              height: 70.h,
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        MyText(
          title: tr(context, name),
          color: context.watch<AppThemeCubit>().isDarkMode
              ? MyColors.white
              : MyColors.black,
          size: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}

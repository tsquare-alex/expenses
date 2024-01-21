part of 'commitments_widgets_imports.dart';

class BuildCommitmentItem extends StatelessWidget {
  const BuildCommitmentItem(
      {Key? key, required this.image, required this.name, this.onTap})
      : super(key: key);
  final String image;
  final String name;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: onTap,
          child: CircleAvatar(
            radius: 45.r,
            backgroundColor: MyColors.greyWhite,
            child: Image.asset(
              image,
              width: 35.w,
              height: 35.h,
            ),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        MyText(
          title: tr(context, name).isNotEmpty?tr(context, name):name,
          color: MyColors.black,
          size: 16.sp,
          fontWeight: FontWeight.bold,
          alien: TextAlign.center,
          max: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

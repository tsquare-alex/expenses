part of 'add_transaction_widgets_imports.dart';

class BuildTransactionItem extends StatelessWidget {
  const BuildTransactionItem(
      {Key? key, required this.name, required this.image, this.content, this.hasContent, this.onTap,})
      : super(key: key);
  final String name;
  final String image;
  final Widget? content;
  final bool? hasContent;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: MyColors.primary,
                radius: 25.r,
                child: Image.asset(
                  image,
                  width: 25.w,
                  height: 25.w,
                  color: MyColors.white,
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              MyText(
                title: name,
                color: MyColors.black,
                size: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
        if(hasContent==true)Padding(
          padding: EdgeInsets.only(right: 30.r),
          child: content,
        ),
        hasContent==true?Divider(
          thickness: 1.w,
        ):Container(),
      ],
    );
  }
}

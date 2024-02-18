part of 'cart_details_widgets_imports.dart';

class BuildCartDetailsButton extends StatelessWidget {
  const BuildCartDetailsButton({Key? key, required this.data, required this.model}) : super(key: key);
  final CartDetailsData data;
  final AddCartModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.r),
      child: DefaultButton(
        onTap: ()=>data.editCart(model,context),
        title: tr(context, "save"),
        fontWeight: FontWeight.bold,
        fontSize: 16.sp,
      ),
    );
  }
}

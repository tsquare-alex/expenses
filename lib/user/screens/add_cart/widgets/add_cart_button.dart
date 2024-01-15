part of 'add_cart_widgets_imports.dart';

class AddCartButton extends StatelessWidget {
  const AddCartButton({Key? key, required this.data}) : super(key: key);
  final AddCartData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.r),
      child: DefaultButton(
        onTap: ()=>data.addCart(context),
        title: tr(context, "add"),
        fontWeight: FontWeight.bold,
        fontSize: 16.sp,
      ),
    );
  }
}
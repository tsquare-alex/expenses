part of 'bag_widgets_imports.dart';

class AddBagItemButton extends StatelessWidget {
  const AddBagItemButton({Key? key, required this.data}) : super(key: key);
  final BagData data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.r),
      child: DefaultButton(
        onTap: () =>data.addToCart(context),
        title: tr(context, "add"),
        fontWeight: FontWeight.bold,
        fontSize: 14.sp,
      ),
    );
  }
}

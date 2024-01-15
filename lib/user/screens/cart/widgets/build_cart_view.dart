part of 'cart_widgets_imports.dart';

class BuildCartView extends StatelessWidget {
  const BuildCartView({Key? key, required this.data}) : super(key: key);
  final CartData data;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
        childAspectRatio: 1/1.3
      ),
      itemCount: data.cartList.length,
      itemBuilder: (context,i)=>BuildCartItem(name: data.cartList[i].name??"", image: data.cartList[i].image??"",onTap: (){},),
    );
  }
}
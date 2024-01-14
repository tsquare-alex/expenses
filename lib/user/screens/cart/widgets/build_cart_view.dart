part of 'cart_widgets_imports.dart';

class BuildCartView extends StatelessWidget {
  const BuildCartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
      ),
      itemCount: 2,
      itemBuilder: (context,i)=>BuildCartItem(name: "name", image: Res.register,onTap: (){},),
    );
  }
}
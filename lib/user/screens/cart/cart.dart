part of 'cart_imports.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  CartData data = CartData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.watch<AppThemeCubit>().isDarkMode
            ? AppDarkColors.backgroundColor
            : MyColors.white,
        surfaceTintColor: context.watch<AppThemeCubit>().isDarkMode
            ? AppDarkColors.backgroundColor
            : MyColors.white,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Res.bag,
              width: 30.w,
              height: 30.h,
            ),
            SizedBox(
              width: 10.w,
            ),
            MyText(
              title: tr(context, "cart"),
              color: context.watch<AppThemeCubit>().isDarkMode
                  ? MyColors.white
                  : MyColors.black,
              size: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        leading: InkWell(
          onTap: () => AutoRouter.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            color: context.watch<AppThemeCubit>().isDarkMode
                ? MyColors.white
                : MyColors.black,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.watch<AppThemeCubit>().isDarkMode
            ? MyColors.primary.withOpacity(0.4)
            : MyColors.primary,
        onPressed: () {
          AutoRouter.of(context).push(AddCartRoute(model: data.cartModel));
        },
        shape: const CircleBorder(),
        child: Icon(
          Icons.add,
          color: MyColors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.r),
        child: BuildCartView(
          data: data,
        ),
      ),
    );
  }
}

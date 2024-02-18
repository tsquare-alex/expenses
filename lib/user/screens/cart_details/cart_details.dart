part of 'cart_details_imports.dart';

class CartDetails extends StatefulWidget {
  const CartDetails({Key? key, required this.model}) : super(key: key);
  final AddCartModel model;

  @override
  State<CartDetails> createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {

  CartDetailsData data = CartDetailsData();

  @override
  void initState() {
    data.fetchCartData(widget.model,context);
    super.initState();
  }

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
        title: MyText(
          title: tr(context, "cartDetails"),
          color: context.watch<AppThemeCubit>().isDarkMode
              ? MyColors.white
              : MyColors.black,
          size: 18.sp,
          fontWeight: FontWeight.bold,
        ),
        leading: InkWell(
          onTap: () => AutoRouter.of(context).pop(),
          child: Icon(Icons.arrow_back, color: context.watch<AppThemeCubit>().isDarkMode
              ? MyColors.white
              : MyColors.black,),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BuildCartDetailsInputs(data: data, model: widget.model,),
              BuildCartDetailsButton(data: data, model: widget.model,),
            ],
          ),
        ),
      ),
    );
  }
}

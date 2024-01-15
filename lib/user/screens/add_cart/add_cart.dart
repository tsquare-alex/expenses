part of 'add_cart_imports.dart';

class AddCart extends StatefulWidget {
  const AddCart({Key? key, required this.model}) : super(key: key);
  final CartModel model;
  @override
  State<AddCart> createState() => _AddCartState();
}

class _AddCartState extends State<AddCart> {

  AddCartData data = AddCartData();

  @override
  void initState() {
    data.initData(widget.model);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
              title: tr(context, "addNewCart"),
              color: MyColors.black,
              size: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        leading: InkWell(
          onTap: () => AutoRouter.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            color: MyColors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.r),
        child: ListView(
          children: [
            BuildAddCartInputs(data: data,),
            BuildAddCartProductPhoto(data: data,),
            BuildImplementationAlert(data: data,),
            AddCartButton(data: data,),
          ],
        ),
      ),
    );
  }
}

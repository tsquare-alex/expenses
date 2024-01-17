part of 'cart_previously_used_imports.dart';

class CartPreviouslyUsed extends StatefulWidget {
  const CartPreviouslyUsed({Key? key}) : super(key: key);

  @override
  State<CartPreviouslyUsed> createState() => _CartPreviouslyUsedState();
}

class _CartPreviouslyUsedState extends State<CartPreviouslyUsed> {

  CartPreviouslyUsedData data = CartPreviouslyUsedData();

  @override
  void initState() {
    data.fetchData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              Res.previouslyUsed,
              width: 30.w,
              height: 30.h,
            ),
            SizedBox(
              width: 10.w,
            ),
            MyText(
              title: tr(context, "previouslyUsed"),
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
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0.r),
        child: BlocBuilder<GenericBloc<List<AddCartModel>>,GenericState<List<AddCartModel>>>(
          bloc: data.addCartCubit,
          builder: (context,state)=>ListView.builder(
            itemCount: state.data.length,
            itemBuilder: (context,i)=>BuildCartPreviouslyUsedCard(model: state.data[i], onDelete: (){}, data: data),
          ),
        ),
      ),
    );
  }
}

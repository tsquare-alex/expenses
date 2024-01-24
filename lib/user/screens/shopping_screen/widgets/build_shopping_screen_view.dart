part of 'shopping_screen_widgets_imports.dart';

class BuildShoppingScreenView extends StatefulWidget {
  const BuildShoppingScreenView(
      {Key? key,
      required this.transactionModel,
      required this.hasData,
      required this.data})
      : super(key: key);
  final bool hasData;
  final ShoppingScreenData data;
  final TransactionModel transactionModel;

  @override
  State<BuildShoppingScreenView> createState() =>
      _BuildShoppingScreenViewState();
}

class _BuildShoppingScreenViewState extends State<BuildShoppingScreenView> {
  @override
  void initState() {
    if(widget.hasData == true){
      widget.data.initData(widget.transactionModel);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<List<TransactionTypeModel>>,
        GenericState<List<TransactionTypeModel>>>(
      bloc: widget.data.transactionTypeCubit,
      builder: (context, state) {
        return Scaffold(
          appBar: widget.hasData == true
              ? AppBar(
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.white,
                  title: Padding(
                    padding: EdgeInsets.only(left: 40.0.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Res.shopping,
                          width: 30.w,
                          height: 30.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        MyText(
                          title: tr(context, "shopping"),
                          color: MyColors.black,
                          size: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  leading: InkWell(
                    onTap: () => AutoRouter.of(context).pop(),
                    child: Icon(
                      Icons.arrow_back,
                      color: MyColors.black,
                    ),
                  ),
                  centerTitle: true,
                )
              : null,
          floatingActionButton: widget.hasData == true
              ? FloatingActionButton(
                  backgroundColor: MyColors.primary,
                  onPressed: () {
                    widget.data.addTransactionModel(context);
                  },
                  shape: const CircleBorder(),
                  child: Icon(
                    Icons.add,
                    color: MyColors.white,
                  ),
                )
              : null,
          body: GridView.builder(
            itemCount: state.data.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 10.w,
                childAspectRatio: 0.5.h / 0.7.w),
            itemBuilder: (context, i) => BuildShoppingScreenItem(
              onTap: () async {
                if(state.data[i].name == "supermarket"){
                  await AutoRouter.of(context).push(AddTransactionRoute(
                      model: state.data[i],
                      transactionName: "التسوق والشراء",
                      boxName: "transactionShoppingBox"));
                  widget.data.fetchData();
                }else{
                  CustomToast.showSimpleToast(msg: "msg");
                }
              },
              image: state.data[i].image ?? Res.shopping,
              name: state.data[i].name ?? "",
              isPro: state.data[i].name =="supermarket"?true:false,
            ),
          ),
        );
      },
    );
  }
}

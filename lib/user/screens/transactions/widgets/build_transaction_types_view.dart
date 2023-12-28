part of 'transactions_widgets_imports.dart';

class BuildTransactionTypesView extends StatelessWidget {
  const BuildTransactionTypesView({Key? key, required this.data, required this.homeTabCubit, this.hasData})
      : super(key: key);
  final TransactionsData data;
  final GenericBloc<int> homeTabCubit;
  final bool? hasData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hasData==true?AppBar(
        actions: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.primary
            ),
            width: 35.w,
            margin: EdgeInsets.only(left: 15.r),
            child: IconButton(
              onPressed: () =>AutoRouter.of(context).push(HomeRoute(index: 0,pageIndex: 12)),
              icon: Image.asset(
                Res.repeatedTransactions,
                width: 20.w,
                height: 20.h,
                color: MyColors.white,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.amber,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Res.transaction,
              width: 20.w,
              height: 20.h,
              color: MyColors.white,
            ),
            SizedBox(
              width: 10.w,
            ),
            MyText(
              title: tr(context, "transactions"),
              color: Colors.white,
              size: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ):null,
      body: Padding(
        padding: hasData==true?EdgeInsets.all(15.0.r):EdgeInsets.zero,
        child: GridView.builder(
          itemCount: data.model.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10.h, crossAxisSpacing: 10.w),
          itemBuilder: (context, i) => BuildTransactionTypeItem(
            onTap: ()=> AutoRouter.of(context).push(HomeRoute(index: 0,pageIndex:data.model[i].id!)),
            image: data.model[i].image ?? "",
            name: tr(context, data.model[i].name??""),
          ),
        ),
      ),
    );
  }
}

part of 'cart_ready_models_widgets_imports.dart';

class BuildCartReadyModelsCard extends StatelessWidget {
  const BuildCartReadyModelsCard(
      {Key? key,
      required this.model,
      required this.onDelete,
      required this.data,
      required this.index})
      : super(key: key);
  final AddCartModel model;
  final GestureTapCallback onDelete;
  final CartReadyModelsData data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 20.r),
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
          color: context.watch<AppThemeCubit>().isDarkMode
              ? MyColors.greyWhite
              : MyColors.white,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(width: 1.w, color: MyColors.greyWhite)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.0.r),
            child: Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                onTap: ()=>data.deleteItem(model),
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: MyColors.greyWhite,
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    Image.asset(
                      model.typeModel?.image ?? Res.shopping,
                      width: 30.w,
                      height: 30,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: MyText(
                        title:
                            tr(context, model.typeModel?.name ?? "").isNotEmpty
                                ? tr(context, model.typeModel?.name ?? "")
                                : model.typeModel?.name ?? "",
                        color: context.watch<AppThemeCubit>().isDarkMode
                            ? MyColors.white
                            : MyColors.black,
                        size: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              MyText(
                title: model.date ?? "",
                color: MyColors.grey,
                size: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Divider(
            thickness: 1.w,
            color: MyColors.greyWhite,
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Image.asset(
                      model.contentModel?.image ?? "",
                      width: 30.w,
                      height: 30.h,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    MyText(
                      title:
                          tr(context, model.contentModel?.name ?? "").isNotEmpty
                              ? tr(context, model.contentModel?.name ?? "")
                              : model.contentModel?.name ?? "",
                      color: context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                      size: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              MyText(
                title: "${tr(context, "value")} : ${model.total}",
                color: context.watch<AppThemeCubit>().isDarkMode
                    ? MyColors.white
                    : MyColors.black,
                size: 14.sp,
                fontWeight: FontWeight.bold,
              )
            ],
          ),
          Divider(thickness: 1.w,color: MyColors.greyWhite,),
          SizedBox(
            height: 10.h,
          ),
          InkWell(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () async{
              // await AutoRouter.of(context).push(
              //   TransactionDetailsRoute(
              //     model: model,
              //   ),
              // );
              // data.addTransactionList.clear();
              // data.fetchData();
              await AutoRouter.of(context).push(CartDetailsRoute(model: model));
              data.addCartList.clear();
              data.fetchData(context);
            },
            child: MyText(
              title: "المزيد من التفاصيل",
              size: 16.sp,
              fontWeight: FontWeight.bold,
              color: MyColors.primary,
            ),),

        ],
      ),
    );
  }
}

part of 'cart_previously_used_widgets_imports.dart';

class BuildCartPreviouslyUsedCard extends StatelessWidget {
  const BuildCartPreviouslyUsedCard({Key? key, required this.model, required this.onDelete, required this.data}) : super(key: key);
  final AddCartModel model;
  final GestureTapCallback onDelete;
  final CartPreviouslyUsedData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 20.r),
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(width: 1.w, color: MyColors.greyWhite)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                bloc: data.checkCubit,
                builder: (context, state) {
                  return Row(
                    children: [
                      Checkbox(
                          value: model.isCompleted,
                          activeColor: MyColors.primary,
                          onChanged: (val) {
                            data.checkCubit.onUpdateData(!model.isCompleted!);
                            // model.isCompleted=state.data;
                            data.editItem(model, context);
                            print(model.isCompleted);
                          }),
                      MyText(
                        title: tr(context, "buyingSucceeded"),
                        color: MyColors.black,
                        size: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0.r),
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
            ],
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
                        color: MyColors.black,
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
                          : model.typeModel?.name ?? "",
                      color: MyColors.black,
                      size: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              MyText(
                title: "${tr(context, "value")} : ${model.total}",
                color: MyColors.black,
                size: 14.sp,
                fontWeight: FontWeight.bold,
              )
            ],
          ),
        ],
      ),
    );

  }
}

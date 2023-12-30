part of 'bag_widgets_imports.dart';

class BuildBagItems extends StatelessWidget {
  const BuildBagItems({Key? key, required this.model, required this.data})
      : super(key: key);
  final List<BagModel> model;
  final BagData data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: MyColors.secondary,
          padding: EdgeInsets.all(10.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    Res.cart,
                    color: MyColors.white,
                    height: 25.h,
                    width: 25.w,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  MyText(
                    title: tr(context, "cart"),
                    color: MyColors.white,
                    size: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              IconButton(
                  onPressed: () => data.deleteAllDataInBox(),
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15.0.r),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: model.length,
            itemBuilder: (context, i) => Container(
              padding: EdgeInsets.all(15.r),
              margin: EdgeInsets.only(bottom: 10.r),
              decoration: BoxDecoration(
                  color: MyColors.backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: MyColors.shadow, spreadRadius: 0, blurRadius: 12)
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                        bloc: data.checkCubit,
                        builder: (context, state) {
                          return Checkbox(
                              value: model[i].completed,
                              onChanged: (val) {
                                data.checkCubit.onUpdateData(!model[i].completed!);
                                model[i].completed=state.data;
                                data.editItem(model[i],i);
                                print(model[i].completed);
                              });
                        },
                      ),
                      MyText(
                        title: model[i].type ?? "",
                        color: MyColors.black,
                        size: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyText(
                        title: model[i].amount.toString(),
                        color: MyColors.grey,
                        size: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      MyText(
                        title: model[i].unit?.name ?? "",
                        color: MyColors.black,
                        size: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => data.deleteItem(model[i]),
                        icon: Icon(
                          Icons.delete,
                          color: MyColors.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

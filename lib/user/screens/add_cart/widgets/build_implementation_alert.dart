part of 'add_cart_widgets_imports.dart';

class BuildImplementationAlert extends StatelessWidget {
  const BuildImplementationAlert({Key? key, required this.data}) : super(key: key);
  final AddCartData data;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
      bloc: data.alertCubit,
      builder: (context, state1) {
        return Container(
          padding: EdgeInsets.all(10.r),
          margin: EdgeInsets.symmetric(vertical: 10.r),
          decoration: BoxDecoration(
            color: context.watch<AppThemeCubit>().isDarkMode
                ? MyColors.greyWhite
                : MyColors.backgroundColor,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MyText(
                  title: tr(context, "implementationAlert"),
                  color: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      : MyColors.black,
                  size: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              CupertinoSwitch(
                trackColor: MyColors.blackOpacity,
                activeColor: MyColors.primary,
                value: state1.data,
                onChanged: (value) {
                  data.alertCubit.onUpdateData(
                      value);
                },
              )
            ],
          ),
        );
      },
    );
  }
}

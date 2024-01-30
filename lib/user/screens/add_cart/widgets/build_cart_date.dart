part of 'add_cart_widgets_imports.dart';

class BuildCartDate extends StatelessWidget {
  const BuildCartDate({Key? key, required this.data,}) : super(key: key);
  final AddCartData data;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.r),
      decoration: BoxDecoration(
        color: context.watch<AppThemeCubit>().isDarkMode
            ? MyColors.greyWhite
            : MyColors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Form(
        key: data.formKey2,
        child: Row(
          children: [
            Column(
              children: [
                Image.asset(Res.dateTime,width: 30.w,height: 30.h,),
                SizedBox(
                  height: 5.h,
                ),
                MyText(
                  title: tr(context, "implementationTime"),
                  color: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      : MyColors.black,
                  size: 11.sp,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: GenericTextField(
                onTab: () => data.onSelectDate(
                  context,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
                radius: 10.r,
                hintColor: context.watch<AppThemeCubit>().isDarkMode
                    ? MyColors.white
                    : MyColors.black,
                textColor: context.watch<AppThemeCubit>().isDarkMode
                    ? MyColors.white
                    : MyColors.black,
                fieldTypes: FieldTypes.clickable,
                type: TextInputType.text,
                action: TextInputAction.next,
                label: tr(context, "date"),
                validate: (value) {
                  if(value!.isEmpty){
                    return 'Enter transaction date';
                  }
                },
                controller: data.dateController,
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            SizedBox(
              width: 120.w,
              child: GenericTextField(
                onTab: () => data.onSelectTime(
                  context,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                radius: 10.r,
                hintColor: context.watch<AppThemeCubit>().isDarkMode
                    ? MyColors.white
                    : MyColors.black,
                textColor: context.watch<AppThemeCubit>().isDarkMode
                    ? MyColors.white
                    : MyColors.black,
                fieldTypes: FieldTypes.clickable,
                type: TextInputType.text,
                action: TextInputAction.next,
                label: tr(context, "time"),
                validate: (value) {
                  if(value!.isEmpty){
                    return 'Enter the time';
                  }
                },
                controller: data.timeController,
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

part of 'reports_widgets_imports.dart';

class SaveAndShareButtons extends StatelessWidget {
  const SaveAndShareButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.watch<AppThemeCubit>().isDarkMode
          ? AppDarkColors.backgroundColor
          : MyColors.white,
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () {
                CustomToast.showSimpleToast(msg: 'قيد التطوير حاليا');
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(318.w, 58.h),
                backgroundColor: context.watch<AppThemeCubit>().isDarkMode
                    ? AppDarkColors.primary
                    : MyColors.primary,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
              child: Text(
                tr(context, 'save'),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox.square(dimension: 16.r),
            OutlinedButton(
              onPressed: () {
                CustomToast.showSimpleToast(msg: 'قيد التطوير حاليا');
              },
              style: OutlinedButton.styleFrom(
                fixedSize: Size(64.w, 58.h),
                // backgroundColor: context.watch<AppThemeCubit>().isDarkMode
                //     ? AppDarkColors.primary
                //     : MyColors.primary,
                elevation: 0,
                side: BorderSide(color: MyColors.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
              child: Icon(
                Icons.share_outlined,
                color: MyColors.primary,
                size: 24.r,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

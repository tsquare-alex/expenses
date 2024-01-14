part of 'reports_widgets_imports.dart';

class CircularDetailsRow extends StatelessWidget {
  const CircularDetailsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 46.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: MyColors.primary,
                minRadius: 13.r,
              ),
              SizedBox(width: 12.w),
              Text(
                tr(context, 'expense'),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade100,
                minRadius: 13.r,
              ),
              SizedBox(width: 12.w),
              Text(
                tr(context, 'residual'),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

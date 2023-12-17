part of 'reports_widgets_imports.dart';

class CircularDetailsRow extends StatelessWidget {
  const CircularDetailsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.red,
                minRadius: 10.r,
              ),
              SizedBox(width: 5.w),
              Text(
                'Expense',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.r,
                ),
              ),
            ],
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.yellowAccent,
                minRadius: 10.r,
              ),
              SizedBox(width: 5.w),
              Text(
                'Residual',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.r,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

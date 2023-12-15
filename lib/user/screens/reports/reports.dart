part of 'reports_imports.dart';

class Reports extends StatefulWidget {
  const Reports({
    Key? key,
  }) : super(key: key);

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  ReportsData data = ReportsData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.r),
                child: const DatePickerField(),
              ),
              const DurationPickerField(),
              SizedBox(height: 20.h),
              CircularPercentIndicator(
                animationDuration: 1000,
                radius: 65.r,
                lineWidth: 22.r,
                startAngle: 340,
                animation: true,
                percent: 0.75,
                center: Text(
                  '75%',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.r,
                  ),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.red,
                backgroundColor: Colors.yellowAccent,
              ),
              SizedBox(height: 15.h),
              Padding(
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
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Transactions History',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.r,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.r,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.r),
                child: ListTile(
                  contentPadding: EdgeInsets.only(left: 25.r, right: 16.r),
                  title: Text(
                    'Transfer',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.r,
                    ),
                  ),
                  subtitle: Text(
                    'Today',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11.r,
                      color: Colors.grey,
                    ),
                  ),
                  trailing: Text(
                    '+ \$ 850.00',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.r,
                      color: Colors.greenAccent.shade700,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.r),
                child: ListTile(
                  contentPadding: EdgeInsets.only(left: 25.r, right: 16.r),
                  title: Text(
                    'Transfer',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.r,
                    ),
                  ),
                  subtitle: Text(
                    'Today',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11.r,
                      color: Colors.grey,
                    ),
                  ),
                  trailing: Text(
                    '- \$ 85.00',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.r,
                      color: Colors.red.shade300,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.r),
                child: ListTile(
                  contentPadding: EdgeInsets.only(left: 25.r, right: 16.r),
                  title: Text(
                    'Transfer',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.r,
                    ),
                  ),
                  subtitle: Text(
                    'Today',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11.r,
                      color: Colors.grey,
                    ),
                  ),
                  trailing: Text(
                    '+ \$ 850.00',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.r,
                      color: Colors.greenAccent.shade700,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(45.w, 45.h),
                    backgroundColor: context.watch<AppThemeCubit>().isDarkMode
                        ? AppDarkColors.primary
                        : MyColors.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Icon(
                    Icons.share_outlined,
                    color: Colors.white,
                    size: 20.r,
                  ),
                ),
                SizedBox.square(dimension: 10.r),
                Flexible(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 45.h),
                      backgroundColor: context.watch<AppThemeCubit>().isDarkMode
                          ? AppDarkColors.primary
                          : MyColors.primary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

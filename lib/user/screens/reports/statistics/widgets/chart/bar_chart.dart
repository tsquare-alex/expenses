import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BarChart extends StatelessWidget {
  const BarChart({
    super.key,
    required this.expenses,
  });

  final List<double> expenses;

  @override
  Widget build(BuildContext context) {
    double mostExpensive() {
      double mostExpensive = 0;
      for (var price in expenses) {
        if (price > mostExpensive) {
          mostExpensive = price;
        }
      }
      return mostExpensive;
    }

    return SizedBox(
      height: 0.4.sh,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...List.generate(
                      7,
                      (index) => Text(
                        '\$2000',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 5.r),
                Bar(
                    label: 'Sat',
                    amountSpent: expenses[0],
                    mostExpensive: mostExpensive()),
                Bar(
                    label: 'Sun',
                    amountSpent: expenses[1],
                    mostExpensive: mostExpensive()),
                Bar(
                    label: 'Mon',
                    amountSpent: expenses[2],
                    mostExpensive: mostExpensive()),
                Bar(
                    label: 'Tue',
                    amountSpent: expenses[3],
                    mostExpensive: mostExpensive()),
                Bar(
                    label: 'Wed',
                    amountSpent: expenses[4],
                    mostExpensive: mostExpensive()),
                Bar(
                    label: 'Thu',
                    amountSpent: expenses[5],
                    mostExpensive: mostExpensive()),
                Bar(
                    label: 'Fri',
                    amountSpent: expenses[6],
                    mostExpensive: mostExpensive()),
                SizedBox(width: 5.r),
                Text(
                  'Bottom',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
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

class Bar extends StatelessWidget {
  Bar({
    super.key,
    required this.label,
    required this.amountSpent,
    required this.mostExpensive,
  });

  final double amountSpent;
  final String label;
  final double mostExpensive;

  final double _maxBarHeight = 200.h;

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * _maxBarHeight;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: _maxBarHeight,
                width: 20.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              Container(
                height: barHeight,
                width: 20.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

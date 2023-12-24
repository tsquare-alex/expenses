part of 'reports_widgets_imports.dart';

class DateField extends StatelessWidget {
  const DateField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FieldSection(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.read<ReportsCubit>().dateTimeNowFormatted,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const Icon(
            CupertinoIcons.calendar_today,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

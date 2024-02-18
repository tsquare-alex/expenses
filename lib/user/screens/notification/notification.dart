part of 'notification_imports.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationData data = NotificationData();

  @override
  void initState() {
    data.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.watch<AppThemeCubit>().isDarkMode
            ? AppDarkColors.backgroundColor
            : MyColors.white,
        surfaceTintColor: context.watch<AppThemeCubit>().isDarkMode
            ? AppDarkColors.backgroundColor
            : MyColors.white,
        title: Padding(
          padding: EdgeInsets.only(left: 40.0.r),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.notifications_active_outlined,
                size: 30.w,
                color: MyColors.amber,
              ),
              SizedBox(
                width: 10.w,
              ),
              MyText(
                title: tr(context, "notification"),
                color: context.watch<AppThemeCubit>().isDarkMode
                    ? MyColors.white
                    : MyColors.black,
                size: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
        leading: InkWell(
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () => AutoRouter.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            color: context.watch<AppThemeCubit>().isDarkMode
                ? MyColors.white
                : MyColors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<GenericBloc<List<AddTransactionModel>>,
          GenericState<List<AddTransactionModel>>>(
        bloc: data.addTransactionCubit,
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(15.r),
            child: state.data.isNotEmpty
                ? ListView.builder(
              physics: const BouncingScrollPhysics(),
                    itemCount: state.data.length,
                    itemBuilder: (context, i) => InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      onTap: () async {
                        await AutoRouter.of(context).push(
                            TransactionDetailsRoute(model: state.data[i]));
                        data.addTransactionList.clear();
                        data.fetchData();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.r, vertical: 20.h),
                        margin: EdgeInsets.only(bottom: 20.r),
                        decoration: BoxDecoration(
                          color: context.watch<AppThemeCubit>().isDarkMode
                              ? MyColors.greyWhite
                              : MyColors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: context.watch<AppThemeCubit>().isDarkMode
                              ? []
                              : [
                                  BoxShadow(
                                      color: MyColors.shadow,
                                      spreadRadius: 0.r,
                                      blurRadius: 12.r)
                                ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "${state.data[i].transactionType?.image}",
                                      width: 25.w,
                                      height: 25.h,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    MyText(
                                      title:
                                          state.data[i].transactionName ?? "",
                                      color: context.watch<AppThemeCubit>().isDarkMode
                                          ? MyColors.white
                                          : MyColors.black,
                                      size: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                MyText(
                                  title: state.data[i].transactionDate ?? "",
                                  color: MyColors.grey,
                                  size: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : BuildNoRecord(
                    text: tr(context, "noNotification"),
                  ),
          );
        },
      ),
    );
  }
}

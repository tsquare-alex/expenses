part of 'widgets_imports.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer(
      {Key? key, required this.shareCubit, required this.homeTabCubit})
      : super(key: key);
  final GenericBloc<bool> shareCubit;
  final GenericBloc<int> homeTabCubit;
  @override
  Widget build(BuildContext context) {
    final GoogleDriveClientRepository googleRepo =
        GoogleDriveClientRepository(GoogleDriveClient());
    return Drawer(
        surfaceTintColor: context.watch<AppThemeCubit>().isDarkMode
            ? AppDarkColors.backgroundColor
            : MyColors.grey,
        width: 240.w,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0), bottomLeft: Radius.circular(0)),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0.r),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              margin: EdgeInsets.only(top: 50.r),
              child: CircleAvatar(
                backgroundColor: MyColors.greyWhite,
                radius: 80.r,
                child: Image(
                  height: MediaQuery.of(context).size.height * 0.18,
                  width: MediaQuery.of(context).size.width * 0.55,
                  image: const AssetImage(
                    Res.logo,
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: [
                  // CustomDrawerCard(
                  //   title: tr(context, "fullVersion"),
                  //   onTap: () {
                  //     Navigator.of(context).pop();
                  //     AutoRouter.of(context).push(const SubscriptionsRoute());
                  //   },
                  //   endDrawer: false,
                  //   isPro: true,
                  // ),
                  CustomDrawerCard(
                    title: tr(context, "settings"),
                    onTap: () {
                      Navigator.of(context).pop();
                      AutoRouter.of(context).push(
                        HomeRoute(
                          index: 0,
                          pageIndex: 3,
                        ),
                      );
                    },
                    image: Res.settings,
                    endDrawer: false,
                    hasArrowBack: true,
                  ),
                  CustomDrawerCard(
                    title: tr(context, "darkMode"),
                    // onTap: () {
                    //   Navigator.of(context).pop();
                    //   AutoRouter.of(context).push(const SubscriptionsRoute());
                    // },
                    image: Res.dark_mode,
                    endDrawer: false,
                    hasSwitch: true,
                    hasProStack: false,
                    switchWidget: SizedBox(
                      height: 30.h,
                      child: BlocBuilder<AppThemeCubit, AppThemeState>(
                        builder: (context, state) {
                          return CupertinoSwitch(
                            trackColor:
                                context.watch<AppThemeCubit>().isDarkMode
                                    ? AppDarkColors.accentColor1
                                    : const Color(0xFFD9D9D9),
                            activeColor: MyColors.primary,
                            value: AppThemeCubit.get(context).isDarkMode,
                            onChanged: (value) {
                              // AutoRouter.of(context)
                              //     .push(const SubscriptionsRoute());
                              AppThemeCubit.get(context).toggleTheme(value);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  CustomDrawerCard(
                    title: tr(context, "reminders"),
                    onTap: () {
                      Navigator.of(context).pop();
                      // AutoRouter.of(context).push(const SubscriptionsRoute());
                    },
                    image: Res.notifications,
                    endDrawer: false,
                    hasSwitch: true,
                    hasProStack: false,
                    switchWidget: SizedBox(
                      height: 30.h,
                      child: CupertinoSwitch(
                        trackColor: context.watch<AppThemeCubit>().isDarkMode
                            ? AppDarkColors.accentColor1
                            : const Color(0xFFD9D9D9),
                        value: false,
                        onChanged: (value) {
                          // AutoRouter.of(context)
                          //     .push(const SubscriptionsRoute());
                        },
                      ),
                    ),
                  ),
                  CustomDrawerCard(
                    title: tr(context, "language"),
                    onTap: () async {
                      await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: const BuildLanguageBottomSheet(),
                            surfaceTintColor: MyColors.white,
                          );
                        },
                      );
                    },
                    image: Res.language,
                    endDrawer: false,
                    hasArrowBack: true,
                  ),
                  CustomDrawerCard(
                    title: tr(context, "sync"),
                    onTap: () async {
                      Navigator.of(context).pop();
                      // AutoRouter.of(context).push(const SubscriptionsRoute());
                      await googleRepo.syncData();
                    },
                    image: Res.sync,
                    endDrawer: false,
                    hasProStack: false,
                    hasArrowBack: true,
                  ),
                  CustomDrawerCard(
                    title: tr(context, "backupData"),
                    onTap: () async {
                      Navigator.of(context).pop();
                      // AutoRouter.of(context).push(const SubscriptionsRoute());
                      await googleRepo.backupData();
                    },
                    image: Res.upload,
                    endDrawer: false,
                    hasProStack: false,
                    hasArrowBack: true,
                  ),
                  CustomDrawerCard(
                    title: tr(context, "downloadData"),
                    onTap: () async {
                      Navigator.of(context).pop();
                      // AutoRouter.of(context).push(const SubscriptionsRoute());
                      await googleRepo.downloadData();
                    },
                    image: Res.download,
                    endDrawer: false,
                    hasProStack: false,
                    hasArrowBack: true,
                  ),
                  CustomDrawerCard(
                    title: tr(context, "deleteData"),
                    onTap: () async {
                      Navigator.of(context).pop();
                      // AutoRouter.of(context).push(const SubscriptionsRoute());
                      await googleRepo.deleteData();
                    },
                    image: Res.delete,
                    endDrawer: false,
                    hasProStack: false,
                    hasArrowBack: true,
                  ),
                  CustomDrawerCard(
                    title: tr(context, "rate"),
                    onTap: () {
                      CustomToast.showSimpleToast(
                        msg: "تحت التطوير",
                        color: Colors.red,
                      );
                    },
                    image: Res.blueStar,
                    color: context.watch<AppThemeCubit>().isDarkMode
                        ? AppDarkColors.backgroundColor
                        : MyColors.white,
                    textColor: context.watch<AppThemeCubit>().isDarkMode
                        ? MyColors.white
                        : MyColors.black,
                    imageColor: MyColors.amber,
                    endDrawer: false,
                    hasArrowBack: true,
                  ),
                  CustomDrawerCard(
                    title: tr(context, "shareApp"),
                    onTap: () {
                      shareCubit.onUpdateData(!shareCubit.state.data);
                      print(shareCubit.state.data);
                    },
                    image: Res.shareIcon,
                    endDrawer: false,
                    hasArrowBack: true,
                  ),
                  // CustomDrawerCard(
                  //   title: tr(context, "help"),
                  //   onTap: () {
                  //     CustomToast.showSimpleToast(
                  //       msg: "تحت التطوير",
                  //       color: Colors.red,
                  //     );
                  //   },
                  //   image: Res.toolsImage,
                  //   color: context.watch<AppThemeCubit>().isDarkMode
                  //       ? AppDarkColors.backgroundColor
                  //       : MyColors.white,
                  //   textColor: context.watch<AppThemeCubit>().isDarkMode
                  //       ? MyColors.white
                  //       : MyColors.black,
                  //   imageColor: MyColors.primary,
                  //   endDrawer: false,
                  //   hasArrowBack: true,
                  // ),
                  CustomDrawerCard(
                    title: tr(context, "messageUs"),
                    onTap: () {
                      CustomToast.showSimpleToast(
                        msg: "تحت التطوير",
                        color: Colors.red,
                      );
                    },
                    image: Res.chat,
                    color: context.watch<AppThemeCubit>().isDarkMode
                        ? AppDarkColors.backgroundColor
                        : MyColors.white,
                    textColor: context.watch<AppThemeCubit>().isDarkMode
                        ? MyColors.white
                        : MyColors.black,
                    imageColor: MyColors.primary,
                    endDrawer: false,
                    hasArrowBack: true,
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}

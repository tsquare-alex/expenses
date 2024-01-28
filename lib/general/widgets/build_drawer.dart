part of 'widgets_imports.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer(
      {Key? key, required this.shareCubit, required this.homeTabCubit})
      : super(key: key);
  final GenericBloc<bool> shareCubit;
  final GenericBloc<int> homeTabCubit;
  @override
  Widget build(BuildContext context) {
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
                  image: AssetImage(
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
                  CustomDrawerCard(
                    title: tr(context, "fullVersion"),
                    onTap: () {},
                    endDrawer: false,
                    image: Res.pro,
                  ),
                  CustomDrawerCard(
                    title: tr(context, "settings"),
                    onTap: () {
                      AutoRouter.of(context).push(
                        HomeRoute(
                          index: 0,
                          pageIndex: 3,
                        ),
                      );
                    },
                    image: Res.settings,
                    endDrawer: false,
                  ),
                  CustomDrawerCard(
                    title: tr(context, "help"),
                    onTap: () {
                      AutoRouter.of(context).push(
                        HomeRoute(
                          index: 0,
                          pageIndex: 6,
                        ),
                      );
                    },
                    image: Res.explain,
                    endDrawer: false,
                  ),
                  CustomDrawerCard(
                    title: tr(context, "help"),
                    onTap: () {
                      AutoRouter.of(context).push(
                        HomeRoute(
                          index: 0,
                          pageIndex: 6,
                        ),
                      );
                    },
                    image: Res.explain,
                    endDrawer: false,
                  ),
                  CustomDrawerCard(
                    title: tr(context, "share"),
                    onTap: () {
                      shareCubit.onUpdateData(!shareCubit.state.data);
                      print(shareCubit.state.data);
                    },
                    image: Res.share,
                    endDrawer: false,
                  ),
                  BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                    bloc: shareCubit,
                    builder: (context, state) => state.data == true
                        ? Column(
                            children: [
                              CustomDrawerCard(
                                title: tr(context, "about"),
                                onTap: () {
                                  CustomToast.showSimpleToast(
                                    msg: "تحت التطوير",
                                    color: Colors.red,
                                  );
                                },
                                image: Res.about,
                                color: context.watch<AppThemeCubit>().isDarkMode
                                    ? AppDarkColors.backgroundColor
                                    : MyColors.white,
                                textColor: context.watch<AppThemeCubit>().isDarkMode
                                    ? MyColors.white
                                    : MyColors.black,
                                imageColor: MyColors.primary,
                                endDrawer: false,
                              ),
                              CustomDrawerCard(
                                title: tr(context, "terms"),
                                onTap: () {
                                  CustomToast.showSimpleToast(
                                    msg: "تحت التطوير",
                                    color: Colors.red,
                                  );
                                },
                                image: Res.terms,
                                color: context.watch<AppThemeCubit>().isDarkMode
                                    ? AppDarkColors.backgroundColor
                                    : MyColors.white,
                                textColor: context.watch<AppThemeCubit>().isDarkMode
                                    ? MyColors.white
                                    : MyColors.black,
                                imageColor: MyColors.primary,
                                endDrawer: false,
                              ),
                              CustomDrawerCard(
                                title: tr(context, "rate"),
                                onTap: () {
                                  CustomToast.showSimpleToast(
                                    msg: "تحت التطوير",
                                    color: Colors.red,
                                  );
                                },
                                image: Res.star,
                                color: context.watch<AppThemeCubit>().isDarkMode
                                    ? AppDarkColors.backgroundColor
                                    : MyColors.white,
                                textColor: context.watch<AppThemeCubit>().isDarkMode
                                    ? MyColors.white
                                    : MyColors.black,
                                imageColor: MyColors.amber,
                                endDrawer: false,
                              ),
                            ],
                          )
                        : Container(),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}

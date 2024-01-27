part of 'settings_widgets_imports.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SettingsData data = SettingsData();
    final GoogleDriveClientRepository googleRepo =
        GoogleDriveClientRepository(GoogleDriveClient());
    return ListView(
      padding: EdgeInsets.all(16.r),
      children: [
        GestureDetector(
          onTap: () => data.languagePressed(context),
          child: SettingTile(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: Row(
                children: [
                  Image.asset(
                    Res.language,
                    width: 24.w,
                    height: 24.h,
                    color: context.watch<AppThemeCubit>().isDarkMode
                        ? AppDarkColors.secondary
                        : MyColors.primary,
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    tr(context, 'language'),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: context.watch<AppThemeCubit>().isDarkMode
                        ? AppDarkColors.secondary
                        : MyColors.primary,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        SettingTile(
          doubleRow: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => data.settingsDialog(
                  context: context,
                  dialogList: data.monthDays,
                  title: tr(context, 'monthFirstDay'),
                  isList: true,
                ),
                child: ColoredBox(
                  color: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.r),
                    child: Row(
                      children: [
                        Image.asset(
                          Res.first_day_month,
                          width: 24.w,
                          height: 24.h,
                          color: context.watch<AppThemeCubit>().isDarkMode
                              ? AppDarkColors.secondary
                              : MyColors.primary,
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          tr(context, 'monthFirstDay'),
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: context.watch<AppThemeCubit>().isDarkMode
                              ? AppDarkColors.secondary
                              : MyColors.primary,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                color: context.watch<AppThemeCubit>().isDarkMode
                    ? AppDarkColors.accentColor
                    : MyColors.black.withOpacity(0.05),
                thickness: 2.5.r,
              ),
              GestureDetector(
                onTap: () => data.settingsDialog(
                  context: context,
                  dialogList: data.weekDays(context),
                  title: tr(context, 'weekFirstDay'),
                  isList: true,
                ),
                child: ColoredBox(
                  color: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.r),
                    child: Row(
                      children: [
                        Image.asset(
                          Res.first_day_week,
                          width: 24.w,
                          height: 24.h,
                          color: context.watch<AppThemeCubit>().isDarkMode
                              ? AppDarkColors.secondary
                              : MyColors.primary,
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          tr(context, 'weekFirstDay'),
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: context.watch<AppThemeCubit>().isDarkMode
                              ? AppDarkColors.secondary
                              : MyColors.primary,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        // CustomTile(
        //   children: [
        //     TileRow(
        //       icon: Res.calendar30,
        //       title: tr(context, 'monthFirstDay'),
        //       trailing: TileDropdownButton(
        //         menuList: data.monthDays,
        //         value: data.monthDays.first,
        //         onChanged: (value) {},
        //       ),
        //     ),
        //     SizedBox(height: 7.h),
        //     TileRow(
        //       icon: Res.calendar7,
        //       title: tr(context, 'weekFirstDay'),
        //       trailing: TileDropdownButton(
        //         menuList: data.weekDays,
        //         value: data.weekDays.first,
        //         onChanged: (value) {},
        //       ),
        //     ),
        //   ],
        // ),
        GestureDetector(
          onTap: () => AutoRouter.of(context).push(const SelectCountryRoute()),
          child: SettingTile(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: Row(
                children: [
                  Image.asset(
                    Res.countries,
                    width: 24.w,
                    height: 24.h,
                    color: context.watch<AppThemeCubit>().isDarkMode
                        ? AppDarkColors.secondary
                        : MyColors.primary,
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    tr(context, 'selectCountry'),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.edit_rounded,
                    color: context.watch<AppThemeCubit>().isDarkMode
                        ? AppDarkColors.secondary
                        : MyColors.primary,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),

        GestureDetector(
          onTap: () => AutoRouter.of(context).push(const SelectCurrencyRoute()),
          child: SettingTile(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: Row(
                children: [
                  Image.asset(
                    Res.currencies,
                    width: 24.w,
                    height: 24.h,
                    color: context.watch<AppThemeCubit>().isDarkMode
                        ? AppDarkColors.secondary
                        : MyColors.primary,
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    tr(context, 'selectCurrency'),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.edit_rounded,
                    color: context.watch<AppThemeCubit>().isDarkMode
                        ? AppDarkColors.secondary
                        : MyColors.primary,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        // CustomTile(
        //   children: [
        //     TileRow(
        //       icon: Res.numbers,
        //       title: tr(context, 'numbers'),
        //       trailing: TileDropdownButton(
        //         menuList: data.numberFormat,
        //         value: data.numberFormat.first,
        //         onChanged: (value) {},
        //       ),
        //     ),
        //     SizedBox(height: 7.h),
        //     TileRow(
        //       icon: Res.decimal,
        //       title: tr(context, 'decimal'),
        //       trailing: TileDropdownButton(
        //         menuList: data.decimal,
        //         value: data.decimal[1],
        //         onChanged: (value) {},
        //       ),
        //     ),
        //   ],
        // ),
        SettingTile(
          doubleRow: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                child: Row(
                  children: [
                    Image.asset(
                      Res.numbers,
                      width: 24.w,
                      height: 24.h,
                      color: context.watch<AppThemeCubit>().isDarkMode
                          ? AppDarkColors.secondary
                          : MyColors.primary,
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      tr(context, 'numbers'),
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: context.watch<AppThemeCubit>().isDarkMode
                          ? AppDarkColors.secondary
                          : MyColors.primary,
                    ),
                  ],
                ),
              ),
              Divider(
                color: context.watch<AppThemeCubit>().isDarkMode
                    ? AppDarkColors.accentColor
                    : MyColors.black.withOpacity(0.05),
                thickness: 2.5.r,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                child: Row(
                  children: [
                    Image.asset(
                      Res.decimals,
                      width: 24.w,
                      height: 24.h,
                      color: context.watch<AppThemeCubit>().isDarkMode
                          ? AppDarkColors.secondary
                          : MyColors.primary,
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      tr(context, 'decimal'),
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: context.watch<AppThemeCubit>().isDarkMode
                          ? AppDarkColors.secondary
                          : MyColors.primary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        SettingTile(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: Row(
              children: [
                Image.asset(
                  Res.privacy,
                  width: 24.w,
                  height: 24.h,
                  color: context.watch<AppThemeCubit>().isDarkMode
                      ? AppDarkColors.secondary
                      : MyColors.primary,
                ),
                SizedBox(width: 12.w),
                Text(
                  tr(context, 'privacy'),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: context.watch<AppThemeCubit>().isDarkMode
                      ? AppDarkColors.secondary
                      : MyColors.primary,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h),
        SettingTile(
          border: false,
          greyBackground: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: Row(
              children: [
                Image.asset(
                  Res.auth,
                  width: 24.w,
                  height: 24.h,
                  color: context.watch<AppThemeCubit>().isDarkMode
                      ? AppDarkColors.secondary
                      : MyColors.primary,
                ),
                SizedBox(width: 12.w),
                Text(
                  tr(context, 'enableAuthentication'),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                BlocBuilder<AuthenticationCubit, AuthenticationState>(
                  builder: (context, state) {
                    return CupertinoSwitch(
                      trackColor: context.watch<AppThemeCubit>().isDarkMode
                          ? AppDarkColors.accentColor1
                          : const Color(0xFFD9D9D9),
                      value: state.isAuthenticated,
                      onChanged: (value) async {
                        final authenticationCubit =
                            context.read<AuthenticationCubit>();

                        // If the user is enabling authentication, save the status in Hive
                        if (value) {
                          // Show authentication dialog
                          bool authenticated = await authenticationCubit
                              .showAuthenticationDialog(context);

                          // Only update the status if the authentication was successful
                          if (authenticated) {
                            await authenticationCubit
                                .saveAuthenticationStatus(true);
                            authenticationCubit.emit(
                                AuthenticationState(isAuthenticated: true));
                          }
                        } else {
                          // If the user is disabling authentication, clear the status in Hive
                          authenticationCubit.clearAuthenticationStatus();
                          authenticationCubit.emit(
                              AuthenticationState(isAuthenticated: false));
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h),
        SettingTile(
          border: false,
          greyBackground: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: Row(
              children: [
                Image.asset(
                  Res.dark_mode,
                  width: 24.w,
                  height: 24.h,
                  color: context.watch<AppThemeCubit>().isDarkMode
                      ? AppDarkColors.secondary
                      : MyColors.primary,
                ),
                SizedBox(width: 12.w),
                Text(
                  tr(context, 'darkMode'),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 12.w),
                Image.asset(
                  Res.pro,
                  height: 40.h,
                  width: 40.w,
                ),
                const Spacer(),
                BlocBuilder<AppThemeCubit, AppThemeState>(
                  builder: (context, state) {
                    return CupertinoSwitch(
                      trackColor: context.watch<AppThemeCubit>().isDarkMode
                          ? AppDarkColors.accentColor1
                          : const Color(0xFFD9D9D9),
                      value: AppThemeCubit.get(context).isDarkMode,
                      onChanged: (value) {
                        AutoRouter.of(context).push(const SubscriptionsRoute());

                        // AppThemeCubit.get(context).toggleTheme(value);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h),
        SettingTile(
          border: false,
          greyBackground: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: Row(
              children: [
                Image.asset(
                  Res.notifications,
                  width: 24.w,
                  height: 24.h,
                  color: context.watch<AppThemeCubit>().isDarkMode
                      ? AppDarkColors.secondary
                      : MyColors.primary,
                ),
                SizedBox(width: 12.w),
                Text(
                  tr(context, 'reminders'),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 12.w),
                Image.asset(
                  Res.pro,
                  height: 40.h,
                  width: 40.w,
                ),
                const Spacer(),
                CupertinoSwitch(
                  trackColor: context.watch<AppThemeCubit>().isDarkMode
                      ? AppDarkColors.accentColor1
                      : const Color(0xFFD9D9D9),
                  value: false,
                  onChanged: (value) {
                    AutoRouter.of(context).push(const SubscriptionsRoute());
                  },
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h),
        // CustomTile(
        //   children: [
        //     TileRow(
        //       icon: Res.save,
        //       title: tr(context, 'save'),
        //       trailing: TileDropdownButton(
        //         menuList: data.saveFormat,
        //         value: data.saveFormat.first,
        //         onChanged: (value) {},
        //       ),
        //     ),
        //   ],
        // ),
        GestureDetector(
          onTap: () => data.settingsDialog(
            context: context,
            dialogList: data.saveFormat,
            title: tr(context, 'save'),
          ),
          child: SettingTile(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: Row(
                children: [
                  Image.asset(
                    Res.save,
                    width: 24.w,
                    height: 24.h,
                    color: context.watch<AppThemeCubit>().isDarkMode
                        ? AppDarkColors.secondary
                        : MyColors.primary,
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    tr(context, 'save'),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: context.watch<AppThemeCubit>().isDarkMode
                        ? AppDarkColors.secondary
                        : MyColors.primary,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        InkWell(
          onTap: () async {
            AutoRouter.of(context).push(const SubscriptionsRoute());

            // await googleRepo.syncData();
          },
          child: SettingTile(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: Row(
                children: [
                  Image.asset(
                    Res.sync,
                    width: 24.w,
                    height: 24.h,
                    color: context.watch<AppThemeCubit>().isDarkMode
                        ? AppDarkColors.secondary
                        : MyColors.primary,
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    tr(context, 'sync'),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Image.asset(
                    Res.pro,
                    height: 40.h,
                    width: 40.w,
                  ),
                  const Spacer(),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: context.watch<AppThemeCubit>().isDarkMode
                        ? AppDarkColors.secondary
                        : MyColors.primary,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        InkWell(
          onTap: () async {
            AutoRouter.of(context).push(const SubscriptionsRoute());

            // await googleRepo.backupData();
          },
          child: SettingTile(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: Row(
                children: [
                  Image.asset(
                    Res.upload,
                    width: 24.w,
                    height: 24.h,
                    color: context.watch<AppThemeCubit>().isDarkMode
                        ? AppDarkColors.secondary
                        : MyColors.primary,
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    tr(context, 'backupData'),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Image.asset(
                    Res.pro,
                    height: 40.h,
                    width: 40.w,
                  ),
                  const Spacer(),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: context.watch<AppThemeCubit>().isDarkMode
                        ? AppDarkColors.secondary
                        : MyColors.primary,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        InkWell(
          onTap: () async {
            AutoRouter.of(context).push(const SubscriptionsRoute());

            // await googleRepo.downloadData();
          },
          child: SettingTile(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: Row(
                children: [
                  Image.asset(
                    Res.download,
                    width: 24.w,
                    height: 24.h,
                    color: context.watch<AppThemeCubit>().isDarkMode
                        ? AppDarkColors.secondary
                        : MyColors.primary,
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    tr(context, 'downloadData'),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Image.asset(
                    Res.pro,
                    height: 40.h,
                    width: 40.w,
                  ),
                  const Spacer(),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: context.watch<AppThemeCubit>().isDarkMode
                        ? AppDarkColors.secondary
                        : MyColors.primary,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        InkWell(
          onTap: () async {
            AutoRouter.of(context).push(const SubscriptionsRoute());

            // await googleRepo.deleteData();
          },
          child: SettingTile(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: Row(
                children: [
                  Image.asset(
                    Res.delete,
                    width: 24.w,
                    height: 24.h,
                    color: context.watch<AppThemeCubit>().isDarkMode
                        ? AppDarkColors.secondary
                        : MyColors.primary,
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    tr(context, 'deleteData'),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Image.asset(
                    Res.pro,
                    height: 40.h,
                    width: 40.w,
                  ),
                  const Spacer(),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: context.watch<AppThemeCubit>().isDarkMode
                        ? AppDarkColors.secondary
                        : MyColors.primary,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        InkWell(
          onTap: () async {
            // await googleRepo.signOut();
          },
          child: SettingTile(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: Row(
                children: [
                  Image.asset(
                    Res.reset,
                    width: 24.w,
                    height: 24.h,
                    color: context.watch<AppThemeCubit>().isDarkMode
                        ? AppDarkColors.secondary
                        : MyColors.primary,
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    tr(context, 'resetSettings'),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: context.watch<AppThemeCubit>().isDarkMode
                        ? AppDarkColors.secondary
                        : MyColors.primary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

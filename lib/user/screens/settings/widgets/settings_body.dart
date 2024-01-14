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
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: MyColors.primary,
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
              Padding(
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
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: MyColors.primary,
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
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: MyColors.primary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        CustomTile(
          children: [
            TileRow(
              icon: Res.calendar30,
              title: tr(context, 'monthFirstDay'),
              trailing: TileDropdownButton(
                menuList: data.monthDays,
                value: data.monthDays.first,
                onChanged: (value) {},
              ),
            ),
            SizedBox(height: 7.h),
            TileRow(
              icon: Res.calendar7,
              title: tr(context, 'weekFirstDay'),
              trailing: TileDropdownButton(
                menuList: data.weekDays,
                value: data.weekDays.first,
                onChanged: (value) {},
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        CustomTile(
          children: [
            InkWell(
              onTap: () =>
                  AutoRouter.of(context).push(const SelectCountryRoute()),
              child: TileRow(
                icon: Res.country,
                title: tr(context, 'selectCountry'),
                trailing: Icon(
                  Icons.edit,
                  color: context.watch<AppThemeCubit>().isDarkMode
                      ? AppDarkColors.secondary
                      : MyColors.primary,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        CustomTile(
          children: [
            InkWell(
              onTap: () =>
                  AutoRouter.of(context).push(const SelectCurrencyRoute()),
              child: TileRow(
                icon: Res.currency,
                title: tr(context, 'selectCurrency'),
                trailing: Icon(
                  Icons.edit,
                  color: context.watch<AppThemeCubit>().isDarkMode
                      ? AppDarkColors.secondary
                      : MyColors.primary,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        CustomTile(
          children: [
            TileRow(
              icon: Res.numbers,
              title: tr(context, 'numbers'),
              trailing: TileDropdownButton(
                menuList: data.numberFormat,
                value: data.numberFormat.first,
                onChanged: (value) {},
              ),
            ),
            SizedBox(height: 7.h),
            TileRow(
              icon: Res.decimal,
              title: tr(context, 'decimal'),
              trailing: TileDropdownButton(
                menuList: data.decimal,
                value: data.decimal[1],
                onChanged: (value) {},
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        CustomTile(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: TileRow(
                icon: Res.secure,
                title: tr(context, 'privacy'),
                isTrailing: false,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        CustomTile(
          // height: 200,
          children: [
            Column(
              children: [
                // BlocBuilder<AuthenticationCubit, AuthenticationState>(
                //   builder: (context, state) {
                //     return SwitchListTile(
                //       title: MyText(title: tr(context, "enableAuthentication"), color: MyColors.primary, size: 15.sp,fontWeight: FontWeight.bold,),
                //       value: state.isAuthenticated,
                //       onChanged: (value) async {
                //         final authenticationCubit = context.read<AuthenticationCubit>();
                //         if (value && authenticationCubit.isAuthenticationRequired()) {
                //           // Show authentication dialog
                //           bool authenticated = await authenticationCubit.showAuthenticationDialog(context);
                //           // Only update the status if the authentication was successful
                //           if (authenticated) {
                //             authenticationCubit.emit(AuthenticationState(isAuthenticated: true));
                //           }
                //         } else {
                //           // If authentication is not required or the user turns off the switch
                //           if (!value) {
                //             authenticationCubit.clearAuthenticationStatus();
                //           }
                //           authenticationCubit.emit(AuthenticationState(isAuthenticated: value));
                //         }
                //       },
                //     );
                //   },
                // ),
                BlocBuilder<AuthenticationCubit, AuthenticationState>(
                  builder: (context, state) {
                    return SwitchListTile(
                      title: MyText(
                          title: tr(context, "enableAuthentication"),
                          color: MyColors.primary,
                          size: 15.sp,
                          fontWeight: FontWeight.bold),
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

                BlocBuilder<AuthenticationCubit, AuthenticationState>(
                  builder: (context, state) {
                    return Visibility(
                      visible: state.isAuthenticated,
                      child: MyText(
                        title: tr(context, "authenticationIsEnabled"),
                        color: MyColors.secondary,
                        size: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10.h),
        CustomTile(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: TileRow(
                icon: Res.moon,
                title: tr(context, 'darkMode'),
                trailing: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: BlocBuilder<AppThemeCubit, AppThemeState>(
                      builder: (context, state) {
                        return CupertinoSwitch(
                          trackColor: MyColors.blackOpacity,
                          value: AppThemeCubit.get(context).isDarkMode,
                          onChanged: (value) =>
                              AppThemeCubit.get(context).toggleTheme(value),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        CustomTile(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: TileRow(
                icon: Res.reminders,
                title: tr(context, 'reminders'),
                trailing: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: CupertinoSwitch(
                      trackColor: MyColors.blackOpacity,
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        CustomTile(
          children: [
            TileRow(
              icon: Res.save,
              title: tr(context, 'save'),
              trailing: TileDropdownButton(
                menuList: data.saveFormat,
                value: data.saveFormat.first,
                onChanged: (value) {},
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        InkWell(
          onTap: () async => await googleRepo.syncData(),
          child: CustomTile(
            children: [
              TileRow(
                icon: Res.sync,
                title: tr(context, 'sync'),
                isTrailing: false,
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        InkWell(
          onTap: () async => await googleRepo.backupData(),
          child: CustomTile(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: TileRow(
                  icon: Res.upload,
                  title: tr(context, 'backupData'),
                  isTrailing: false,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        InkWell(
          onTap: () async => await googleRepo.downloadData(),
          child: CustomTile(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: TileRow(
                  icon: Res.download,
                  title: tr(context, 'downloadData'),
                  isTrailing: false,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        InkWell(
          onTap: () async => await googleRepo.deleteData(),
          child: CustomTile(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: TileRow(
                  icon: Res.delete,
                  title: tr(context, 'deleteData'),
                  isTrailing: false,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        InkWell(
          onTap: () async => await googleRepo.signOut(),
          child: CustomTile(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: TileRow(
                  icon: Res.reset,
                  title: tr(context, 'resetSettings'),
                  isTrailing: false,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

part of 'settings_widgets_imports.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SettingsData data = SettingsData();
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      children: [
        InkWell(
          onTap: () => data.languagePressed(context),
          child: CustomTile(
            children: [
              TileRow(
                icon: Res.lang,
                title: tr(context, 'language'),
                isTrailing: false,
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
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
            TileRow(
              icon: Res.country,
              title: tr(context, 'selectCountry'),
              trailing: TileDropdownButton(
                menuList: data.countries,
                value: data.countries.first,
                onChanged: (value) {},
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        CustomTile(
          children: [
            TileRow(
              icon: Res.currency,
              title: tr(context, 'selectCurrency'),
              trailing: TileDropdownButton(
                menuList: data.currency,
                value: data.currency.first,
                onChanged: (value) {},
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
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: TileRow(
                icon: Res.moon,
                title: tr(context, 'darkMode'),
                trailing: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 25.w),
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
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 25.w),
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
        CustomTile(
          children: [
            TileRow(
              icon: Res.synchronization,
              title: tr(context, 'sync'),
              trailing: TileDropdownButton(
                menuList: data.syncOptions,
                value: data.syncOptions.first,
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
                icon: Res.upload,
                title: tr(context, 'backupData'),
                isTrailing: false,
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
                icon: Res.download,
                title: tr(context, 'downloadData'),
                isTrailing: false,
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
                icon: Res.delete,
                title: tr(context, 'deleteData'),
                isTrailing: false,
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
                icon: Res.reset,
                title: tr(context, 'resetSettings'),
                isTrailing: false,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

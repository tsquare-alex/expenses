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
          child: const CustomTile(
            children: [
              TileRow(
                icon: Res.lang,
                title: 'اللغة',
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
              title: 'أول يوم بالشهر',
              trailing: TileDropdownButton(
                menuList: data.monthDays,
                value: data.monthDays.first,
                onChanged: (value) {},
              ),
            ),
            SizedBox(height: 7.h),
            TileRow(
              icon: Res.calendar7,
              title: 'أول يوم بالأسبوع',
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
              title: 'اختيار البلد',
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
              title: 'اختيار العملة',
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
              title: 'الأرقام',
              trailing: TileDropdownButton(
                menuList: data.numberFormat,
                value: data.numberFormat.first,
                onChanged: (value) {},
              ),
            ),
            SizedBox(height: 7.h),
            TileRow(
              icon: Res.decimal,
              title: 'العلامة العشرية',
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
              child: const TileRow(
                icon: Res.secure,
                title: 'الخصوصية و الأمان',
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
                title: 'الوضع الليلي',
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
                icon: Res.notifications,
                title: 'التنبيهات',
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
              title: 'حفظ',
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
              title: 'مزامنة',
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
              child: const TileRow(
                icon: Res.upload,
                title: 'النسخ الإحتياطي للبيانات',
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
              child: const TileRow(
                icon: Res.download,
                title: 'استعادة البيانات',
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
              child: const TileRow(
                icon: Res.delete,
                title: 'مسح البيانات',
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
              child: const TileRow(
                icon: Res.reset,
                title: 'اعدادات إفتراضية',
                isTrailing: false,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

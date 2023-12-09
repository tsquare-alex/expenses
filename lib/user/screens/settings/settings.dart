part of 'settings_imports.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  SettingsData data = SettingsData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        elevation: 0,
        leading: IconButton(
          onPressed: () => AutoRouter.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: MyColors.white,
            size: 20.sp,
          ),
        ),
        centerTitle: true,
        title: MyText(
          title: "الضبط و الإعدادات",
          color: MyColors.white,
          size: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        children: [
          InkWell(
            onTap: () =>data.languagePressed(context),
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
                icon: Res.calender,
                title: 'أول يوم بالشهر',
                trailing: TileDropdownButton(
                  menuList: data.monthDays,
                  value: data.monthDays.first,
                  onChanged: (value) {},
                ),
              ),
              SizedBox(height: 7.h),
              TileRow(
                icon: Res.weeks,
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
                  icon: Res.currency,
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
                  icon: Res.currency,
                  title: 'الوضع الليلي',
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: TileRow(
                  icon: Res.currency,
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
                icon: Res.currency,
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
                icon: Res.currency,
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
                  icon: Res.currency,
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
                  icon: Res.currency,
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
                  icon: Res.currency,
                  title: 'اعدادات إفتراضية',
                  isTrailing: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

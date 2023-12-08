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
          CustomTile(
            children: [
              TileRow(
                icon: Icons.language,
                title: 'اللغة',
                trailing: TileDropdownButton(
                  menuList: data.languages,
                  value: data.languages.first,
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          CustomTile(
            children: [
              TileRow(
                icon: Icons.calendar_month,
                title: 'أول يوم بالشهر',
                trailing: TileDropdownButton(
                  menuList: data.monthDays,
                  value: data.monthDays.first,
                  onChanged: (value) {},
                ),
              ),
              SizedBox(height: 7.h),
              TileRow(
                icon: CupertinoIcons.calendar_today,
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
                icon: FontAwesomeIcons.earthAmericas,
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
                icon: Icons.currency_exchange,
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
                icon: CupertinoIcons.textformat_123,
                title: 'الأرقام',
                trailing: TileDropdownButton(
                  menuList: data.numberFormat,
                  value: data.numberFormat.first,
                  onChanged: (value) {},
                ),
              ),
              SizedBox(height: 7.h),
              TileRow(
                icon: Icons.format_quote_outlined,
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
                  icon: CupertinoIcons.lock_shield_fill,
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
                  icon: CupertinoIcons.moon_stars,
                  title: 'الوضع الليلي',
                  trailing: CupertinoSwitch(
                    trackColor: MyColors.blackOpacity,
                    value: false,
                    onChanged: (value) {},
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
                  icon: Icons.notifications_active_outlined,
                  title: 'التنبيهات',
                  trailing: CupertinoSwitch(
                    trackColor: MyColors.blackOpacity,
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          CustomTile(
            children: [
              TileRow(
                icon: Icons.save_outlined,
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
                icon: Icons.sync,
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
                  icon: CupertinoIcons.cloud_upload,
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
                  icon: CupertinoIcons.cloud_download,
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
                  icon: CupertinoIcons.delete,
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
                  icon: Icons.restore,
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
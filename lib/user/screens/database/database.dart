part of 'database_imports.dart';

class Database extends StatefulWidget {
  const Database({Key? key}) : super(key: key);

  @override
  State<Database> createState() => _DatabaseState();
}

class _DatabaseState extends State<Database> {

  DatabaseData data = DatabaseData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => AutoRouter.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: MyText(
          title: "السجل وقواعد البيانات",
          color: MyColors.txtColor,
          size: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

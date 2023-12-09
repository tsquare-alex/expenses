part of 'database_imports.dart';

class Database extends StatefulWidget {
  const Database({Key? key,}) : super(key: key);

  @override
  State<Database> createState() => _DatabaseState();
}

class _DatabaseState extends State<Database> {

  DatabaseData data = DatabaseData();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: MyColors.white,
      body: Column(
        children: [
          MyText(title: "database", color: MyColors.primary, size: 16.sp,fontWeight: FontWeight.bold,),
        ],
      ),
    );
  }
}

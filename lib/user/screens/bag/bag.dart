part of 'bag_imports.dart';

class Bag extends StatefulWidget {
  const Bag({Key? key}) : super(key: key);

  @override
  State<Bag> createState() => _BagState();
}

class _BagState extends State<Bag> {

  BagData data = BagData();

  @override
  void initState() {
    data.initialTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(15.r),
      child: AddBagItem(data: data,),),
    );
  }
}

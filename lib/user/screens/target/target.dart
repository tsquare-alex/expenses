part of 'target_imports.dart';

class Target extends StatefulWidget {
  const Target({Key? key,}) : super(key: key);

  @override
  State<Target> createState() => _TargetState();
}

class _TargetState extends State<Target> {

  TargetData data = TargetData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>AutoRouter.of(context).push(AddTransactionRoute(model: data.model,),),
        backgroundColor: MyColors.primary,
        shape: const CircleBorder(),
        child: Icon(Icons.add,color: MyColors.white,),
      ),
      body: const Column(
        children: [
          BuildNoRecord(),
        ],
      ),
    );
  }
}

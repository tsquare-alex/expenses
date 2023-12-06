part of 'currency_rate_widgets_imports.dart';

class BuildAutoEdit extends StatelessWidget {
  const BuildAutoEdit({Key? key, required this.data}) : super(key: key);
  final CurrencyRateData data;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
      bloc: data.editCubit,
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              Checkbox(
                activeColor: MyColors.primary,
                value: state.data,
                onChanged: (value) => data.editCubit.onUpdateData(value!),
              ),
              MyText(
                title: "تعديل تلقائي",
                color: MyColors.black,
                size: 14,
              ),
            ],
          ),
        );
      },
    );
  }
}

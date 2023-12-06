
import 'package:expenses/general/packages/generic_bloc/generic_cubit.dart';

class WelcomeEntity {
  String? image;
  String? desc;
  String? title;
  bool last;
  int? index;
  GenericBloc<int>? pageCubit;

  WelcomeEntity({
    this.image,
    this.title,
    this.desc,
    this.last = false,
    this.index,
    this.pageCubit,
  });
}

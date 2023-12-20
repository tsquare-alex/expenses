part of 'expense_imports.dart';

class ExpenseData{

  GenericBloc<List<TransactionModel>> commitmentsCubit = GenericBloc([]);
  final GenericBloc<int> tabCubit = GenericBloc(0);


  List<TransactionModel> commitments=[
    TransactionModel(
        name: "الالتزامات",
      isSelected: true,
      image: Res.commitment,
      content: [
        TransactionTypeModel(
          name: "فواتير",
          content: [
            TransactionContentModel(
              name: "كهرباء",
            ),
            TransactionContentModel(
              name: "مياه",
            ),
            TransactionContentModel(
              name: "غاز",
            ),
            TransactionContentModel(
              name: "تليفون أرضي",
            ),
            TransactionContentModel(
              name: "رصيد",
            ),
            TransactionContentModel(
              name: "انترنت",
            ),
          ],
        ),
        TransactionTypeModel(
          name: "إيجار",
          content: [
            TransactionContentModel(
              name: "منزل",
            ),
          ],
        ),
        TransactionTypeModel(
          name: "أقساط",
          content: [
            TransactionContentModel(
              name: "موبايل",
            ),
          ],
        ),
        TransactionTypeModel(
          name: "تأمينات",
          content: [
            TransactionContentModel(
              name: "سيارة",
            ),
          ],
        ),
        TransactionTypeModel(
          name: "اشتراكات",
          content: [
            TransactionContentModel(
              name: "نادي",
            ),
            TransactionContentModel(
              name: "جيم",
            ),
          ],
        ),
        TransactionTypeModel(
          name: "مصاريف سيارة",
          content: [
            TransactionContentModel(
              name: "نظافة",
            ),
            TransactionContentModel(
              name: "صيانة",
            ),
          ],
        ),
        TransactionTypeModel(
          name: "تبرعات و اعانات",
          content: [
            TransactionContentModel(
              name: "الهلال الأحمر",
            ),
          ],
        ),
        TransactionTypeModel(
          name: "ادوية",
          content: [
            TransactionContentModel(
              name: "أدوية الضغط",
            ),
          ],
        ),
        TransactionTypeModel(
          name: "مواصلات",
          content: [
            TransactionContentModel(
              name: "سفر",
            ),
          ],
        ),
      ]
    ),
    TransactionModel(
        name: "التسوق والشراء",
      image: Res.bag,
      content: [
        TransactionTypeModel(
          name: "سوبر ماركت",
          content: [
            TransactionContentModel(
              name: "خضار",
            ),
            TransactionContentModel(
              name: "فاكهة",
            ),
            TransactionContentModel(
              name: "بقوليات",
            ),
            TransactionContentModel(
              name: "زيوت",
            ),
          ],
        ),
        TransactionTypeModel(
          name: "بقالة",
          content: [
          ],
        ),
        TransactionTypeModel(
          name: "محل",
          content: [
          ],
        ),
        TransactionTypeModel(
          name: "شركة",
          content: [
          ],
        ),
        TransactionTypeModel(
          name: "سوق",
          content: [
          ],
        ),
        TransactionTypeModel(
          name: "مصنع",
          content: [
          ],
        ),
        TransactionTypeModel(
          name: "ورشة",
          content: [
          ],
        ),
        TransactionTypeModel(
          name: "شخص",
          content: [
          ],
        ),
        TransactionTypeModel(
          name: "موقع الأكتروني",
          content: [
          ],
        ),
        TransactionTypeModel(
          name: "فيسبوك",
          content: [
          ],
        ),
        TransactionTypeModel(
          name: "انستجرام",
          content: [
          ],
        ),
        TransactionTypeModel(
          name: "اعلان",
          content: [
          ],
        ),
        TransactionTypeModel(
          name: "تيكتوك",
          content: [
          ],
        ),
        TransactionTypeModel(
          name: "عيادة",
          content: [
          ],
        ),
        TransactionTypeModel(
          name: "مستشفي",
          content: [
          ],
        ),

      ],
    ),
  ];


  getCommitments(){
    commitmentsCubit.onUpdateData(commitments);
  }
}
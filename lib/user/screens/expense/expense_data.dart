part of 'expense_imports.dart';

class ExpenseData{

  GenericBloc<List<TransactionModel>> commitmentsCubit = GenericBloc([]);
  final GenericBloc<int> tabCubit = GenericBloc(0);

  List<String> titles=[
    "commitments",
    "shopping"
  ];
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

  // var changed=[
  //   TransactionModel(
  //       name: "الالتزامات",
  //       isSelected: true,
  //       image: Res.commitment,
  //       content: [
  //         TransactionTypeModel(
  //           name: local=="ar"?"فواتير":"Bills",
  //           content: [
  //             TransactionContentModel(
  //               name: local=="ar"?"كهرباء":"electricity",
  //             ),
  //             TransactionContentModel(
  //               name: local=="ar"?"مياه":"water",
  //             ),
  //             TransactionContentModel(
  //               name: local=="ar"?"غاز":"gas",
  //             ),
  //             TransactionContentModel(
  //               name: local=="ar"?"تليفون أرضي":"Landline phone",
  //             ),
  //             TransactionContentModel(
  //               name: local=="ar"?"رصيد":"credit",
  //             ),
  //             TransactionContentModel(
  //               name: local=="ar"?"انترنت":"internet",
  //             ),
  //           ],
  //         ),
  //         TransactionTypeModel(
  //           name: local=="ar"?"إيجار":"Rent",
  //           content: [
  //             TransactionContentModel(
  //               name: local=="ar"?"منزل":"house",
  //             ),
  //           ],
  //         ),
  //         TransactionTypeModel(
  //           name: local=="ar"?"أقساط":"Installments",
  //           content: [
  //             TransactionContentModel(
  //               name: local=="ar"?"موبايل":"mobile",
  //             ),
  //           ],
  //         ),
  //         TransactionTypeModel(
  //           name: local=="ar"?"تأمينات":"insurances",
  //           content: [
  //             TransactionContentModel(
  //               name: local=="ar"?"سيارة":"car",
  //             ),
  //           ],
  //         ),
  //         TransactionTypeModel(
  //           name: local=="ar"?"اشتراكات":"Subscriptions",
  //           content: [
  //             TransactionContentModel(
  //               name: local=="ar"?"نادي":"club",
  //             ),
  //             TransactionContentModel(
  //               name: local=="ar"?"جيم":"gym",
  //             ),
  //           ],
  //         ),
  //         TransactionTypeModel(
  //           name: local=="ar"?"مصاريف سيارة":"Car expenses",
  //           content: [
  //             TransactionContentModel(
  //               name: local=="ar"?"نظافة":"cleanliness",
  //             ),
  //             TransactionContentModel(
  //               name: local=="ar"?"صيانة":"maintenance",
  //             ),
  //           ],
  //         ),
  //         TransactionTypeModel(
  //           name: local=="ar"?"تبرعات و اعانات":"Donations & Subsidies",
  //           content: [
  //             TransactionContentModel(
  //               name: local=="ar"?"الهلال الأحمر":"Red Crescent",
  //             ),
  //           ],
  //         ),
  //         TransactionTypeModel(
  //           name: local=="ar"?"ادوية":"medicines",
  //           content: [
  //             TransactionContentModel(
  //               name: local=="ar"?"أدوية الضغط":"Pressure medications",
  //             ),
  //           ],
  //         ),
  //         TransactionTypeModel(
  //           name: local=="ar"?"مواصلات":"Transportation",
  //           content: [
  //             TransactionContentModel(
  //               name: local=="ar"?"سفر":"travel",
  //             ),
  //           ],
  //         ),
  //       ]
  //   ),
  //   TransactionModel(
  //     name: local=="ar"?"التسوق والشراء":"Shopping & Buying",
  //     image: Res.bag,
  //     content: [
  //       TransactionTypeModel(
  //         name: local=="ar"?"سوبر ماركت":"Supermarket",
  //         content: [
  //           TransactionContentModel(
  //             name: local=="ar"?"خضار":"vegetables",
  //           ),
  //           TransactionContentModel(
  //             name: local=="ar"?"فاكهة":"fruit",
  //           ),
  //           TransactionContentModel(
  //             name: local=="ar"?"بقوليات":"legumes",
  //           ),
  //           TransactionContentModel(
  //             name: local=="ar"?"زيوت":"oils",
  //           ),
  //         ],
  //       ),
  //       TransactionTypeModel(
  //         name: local=="ar"?"بقالة":"Grocery",
  //         content: [
  //         ],
  //       ),
  //       TransactionTypeModel(
  //         name: local=="ar"?"محل":"store",
  //         content: [
  //         ],
  //       ),
  //       TransactionTypeModel(
  //         name: local=="ar"?"شركة":"company",
  //         content: [
  //         ],
  //       ),
  //       TransactionTypeModel(
  //         name: local=="ar"?"سوق":"market",
  //         content: [
  //         ],
  //       ),
  //       TransactionTypeModel(
  //         name: local=="ar"?"مصنع":"factory",
  //         content: [
  //         ],
  //       ),
  //       TransactionTypeModel(
  //         name: local=="ar"?"ورشة":"workshop",
  //         content: [
  //         ],
  //       ),
  //       TransactionTypeModel(
  //         name: local=="ar"?"شخص":"person",
  //         content: [
  //         ],
  //       ),
  //       TransactionTypeModel(
  //         name: local=="ar"?"موقع الأكتروني":"website",
  //         content: [
  //         ],
  //       ),
  //       TransactionTypeModel(
  //         name: local=="ar"?"فيسبوك":"facebook",
  //         content: [
  //         ],
  //       ),
  //       TransactionTypeModel(
  //         name: local=="ar"?"انستجرام":"Instagram",
  //         content: [
  //         ],
  //       ),
  //       TransactionTypeModel(
  //         name: local=="ar"?"اعلان":"announcement",
  //         content: [
  //         ],
  //       ),
  //       TransactionTypeModel(
  //         name: local=="ar"?"تيكتوك":"tiktok",
  //         content: [
  //         ],
  //       ),
  //       TransactionTypeModel(
  //         name: local=="ar"?"عيادة":"clinic",
  //         content: [
  //         ],
  //       ),
  //       TransactionTypeModel(
  //         name: local=="ar"?"مستشفي":"hospital",
  //         content: [
  //         ],
  //       ),
  //
  //     ],
  //   ),
  // ];


  getCommitments(local){
    commitmentsCubit.onUpdateData(commitments);
  }
}
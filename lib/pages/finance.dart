import 'package:flutter/material.dart';
import 'package:hackaton_app/main.dart';
import 'package:hackaton_app/models/expenses.dart';
import 'package:hackaton_app/widgets/border_left_button.dart';
import 'package:hackaton_app/widgets/border_right_button.dart';
import 'package:hackaton_app/widgets/charts.dart';
import 'package:hackaton_app/widgets/reusable_card_buttom.dart';
import 'package:hackaton_app/constants.dart';
import 'dart:math';

final rnd = Random();

enum Tranzaction { rashod, zachislenie }

class Finacelayout extends StatelessWidget {
  const Finacelayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FinacePage(),
      theme: ThemeData.dark(),
    );
  }
}

class FinacePage extends StatefulWidget {
  const FinacePage({Key? key}) : super(key: key);

  @override
  State<FinacePage> createState() => _FinaceWidgetState();
}

class _FinaceWidgetState extends State<FinacePage> {
  // final DateTime? _dateTime;
  // final double _currentSliderValue = 1.0;
  // final String? value;
  final List<String> todoListrashod = [];
  final List<String> todoListzachisl = [];
  String sortedtype = 'week';
  var todoList;
  List<Expenses> AchartData = [];
  Tranzaction? tranzaction;

  @override
  void initState() {
    AchartData = _getChartRashod();
    super.initState();
    todoListrashod.addAll(['23 окт', '21 окт', '15 сен', '17 авг']);
    todoListzachisl.addAll(["12 сен", "31 авг", "18 июня"]);
    todoList = todoListrashod;
    tranzaction = Tranzaction.rashod;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FittedBox(
          fit: BoxFit.fitHeight,
          child: kTextFincAppBar,
        ),
        backgroundColor: kBackGraundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Control(),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 40,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: ReusableCardButtom(
              child: ChartsWidget(charData: AchartData),
              color: kLableStyle,
            ),
          ),
          Expanded(
            flex: 4,
            child: ReusableCardButtom(
              color: kLableStyle,
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: ReusableCardButtom(
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(10),
                                      ),
                                      const Text(
                                        "Сортировка по",
                                        style: kListSum,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 10),
                                      ),
                                      DropdownButton<String>(
                                        dropdownColor: kSortedColor,
                                        value: sortedtype,
                                        items: const [
                                          DropdownMenuItem(
                                            value: 'week',
                                            child: Text(
                                              'Недели',
                                              style: kListSum,
                                            ),
                                          ),
                                          DropdownMenuItem(
                                            value: 'month',
                                            child: Text(
                                              'Месяцу',
                                              style: kListSum,
                                            ),
                                          ),
                                          DropdownMenuItem(
                                            value: 'year',
                                            child: Text(
                                              'Году',
                                              style: kListSum,
                                            ),
                                          ),
                                        ],
                                        onChanged: (v) {
                                          // print(v);
                                          setState(() {
                                            sortedtype = v!;
                                          });
                                        },
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(10),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2001),
                                            lastDate: DateTime(2100),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.calendar_today,
                                          size: 42,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      color: kSortedColor,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      itemCount: todoList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: kDetalizationColor,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 15,
                                height: 5,
                              ),
                              const Text(
                                "Rostov_transport",
                                style: kListSum,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 15),
                              ),
                              Column(
                                children: [
                                  Text(
                                    todoList[index],
                                    style: kListTS,
                                  ),
                                  const Text(
                                    '1500',
                                    style: kListSum,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 5),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: BordarLeftWidgets(
                    onTap: () {
                      setState(() {
                        tranzaction = Tranzaction.rashod;
                        todoList = todoListrashod;
                        AchartData = _getChartRashod();
                      });
                    },
                    color: tranzaction == Tranzaction.rashod
                        ? kLableButtom
                        : kDetalizationColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "Расходы",
                            style: kTextStyleWhiteBottom,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BordarRightWidgets(
                    onTap: () {
                      setState(() {
                        tranzaction = Tranzaction.zachislenie;
                        todoList = todoListzachisl;
                        AchartData = _getChartZachisl();
                      });
                    },
                    color: tranzaction == Tranzaction.zachislenie
                        ? kLableButtom
                        : kDetalizationColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "Зачисления",
                            style: kTextStyleWhiteBottom,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Expenses> _getChartRashod() {
    final List<Expenses> chartData = [
      Expenses('Оплата услуг', 1699),
      Expenses('Иное', 2699),
      Expenses('Оплата услуг', 1899),
      Expenses('SexShope', 5699)
    ];
    return chartData;
  }

  List<Expenses> _getChartZachisl() {
    final List<Expenses> chartData = [
      Expenses('Внесение наличными', 1699),
      Expenses('Переводы', 2699),
      Expenses('Иное', 1899)
    ];
    return chartData;
  }
}

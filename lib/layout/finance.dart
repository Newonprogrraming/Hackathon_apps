import 'package:flutter/material.dart';
import 'package:hackaton_app/main.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:hackaton_app/constants.dart';
import 'dart:math';

var rnd = new Random();

enum Tranzaction { rashod, zachislenie }

class Finacelayout extends StatelessWidget {
  const Finacelayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FinacePage(),
      theme: ThemeData.dark(),
    );
  }
}

class FinacePage extends StatefulWidget {
  @override
  State<FinacePage> createState() => _FinaceWidgetState();
}

class _FinaceWidgetState extends State<FinacePage> {
  DateTime? _dateTime;
  double _currentSliderValue = 1.0;
  String? value;
  List<String> todoListrashod = [];
  List<String> todoListzachisl = [];
  var todoList;
  late List<Expenses> AchartData = [];
  Tranzaction? tranzaction;

  @override
  void initState() {
    AchartData = getChartRashod();
    super.initState();
    todoListrashod.addAll(['23 окт', '21 окт', '15 сен', '17 авг']);
    todoListzachisl.addAll(["12 сен", "31 авг", "18 июня"]);
    todoList = todoListrashod;
    tranzaction = Tranzaction.rashod;
  }

  var sortedtype = 'week';
  var divizh;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: FittedBox(
              fit: BoxFit.fitHeight, child: kTextFincAppBar), //TextAppBar
          backgroundColor: kBackGraundColor,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Control()));
            },
            icon: Icon(
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
                )),
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
                                          Padding(padding: EdgeInsets.all(10)),
                                          Text(
                                            "Сортировка по",
                                            style: kListSum,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          DropdownButton<String>(
                                              dropdownColor: kSortedColor,
                                              value: sortedtype,
                                              items: [
                                                DropdownMenuItem(
                                                    value: 'week',
                                                    child: Text(
                                                      'Недели',
                                                      style: kListSum,
                                                    )),
                                                DropdownMenuItem(
                                                    value: 'month',
                                                    child: Text(
                                                      'Месяцу',
                                                      style: kListSum,
                                                    )),
                                                DropdownMenuItem(
                                                    value: 'year',
                                                    child: Text(
                                                      'Году',
                                                      style: kListSum,
                                                    ))
                                              ],
                                              onChanged: (v) {
                                                print(v);
                                                setState(() {
                                                  sortedtype = v!;
                                                });
                                              }),
                                          Padding(padding: EdgeInsets.all(10)),
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
                                                  lastDate: DateTime(2100));
                                            },
                                            icon: Icon(
                                              Icons.calendar_today,
                                              size: 42,
                                            ))
                                      ],
                                    ))
                                  ],
                                )),
                              ],
                            ),
                            color: kSortedColor,
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: ListView.builder(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                itemCount: todoList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                      color: kDetalizationColor,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 15,
                                            height: 5,
                                          ),
                                          Text("Rostov_transport",
                                              style: kListSum),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                todoList[index],
                                                style: kListTS,
                                              ),
                                              Text(
                                                '1500',
                                                style: kListSum,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              )
                                            ],
                                          )
                                        ],
                                      ));
                                })),
                      ],
                    ))),
            Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: BordarLeftWidgets(
                          onTap: () {
                            setState(() {
                              tranzaction = Tranzaction.rashod;
                              todoList = todoListrashod;
                              AchartData = getChartRashod();
                              print(tranzaction);
                            });
                          },
                          color: tranzaction == Tranzaction.rashod
                              ? kLableButtom
                              : kDetalizationColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    "Расходы",
                                    style: kTextStyleWhiteBottom,
                                    textAlign: TextAlign.center,
                                  )),
                            ],
                          )),
                    ),
                    Expanded(
                        child: BordarRightWidgets(
                            onTap: () {
                              setState(() {
                                tranzaction = Tranzaction.zachislenie;
                                todoList = todoListzachisl;
                                AchartData = getChartZachisl();
                              });
                            },
                            color: tranzaction == Tranzaction.zachislenie
                                ? kLableButtom
                                : kDetalizationColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      "Зачисления",
                                      style: kTextStyleWhiteBottom,
                                      textAlign: TextAlign.center,
                                    )),
                              ],
                            )))
                  ],
                )),
          ],
        ));
  }

  List<Expenses> getChartRashod() {
    final List<Expenses> chartData = [
      Expenses('Оплата услуг', 1699),
      Expenses('Иное', 2699),
      Expenses('Оплата услуг', 1899),
      Expenses('SexShope', 5699)
    ];
    return chartData;
  }

  List<Expenses> getChartZachisl() {
    final List<Expenses> chartData = [
      Expenses('Внесение наличными', 1699),
      Expenses('Переводы', 2699),
      Expenses('Иное', 1899)
    ];
    return chartData;
  }
}

class ChartsWidget extends StatelessWidget {
  const ChartsWidget({
    Key? key,
    required List<Expenses> charData,
  })  : _charData = charData,
        super(key: key);

  final List<Expenses> _charData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: SfCircularChart(
          legend: Legend(
              isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
          series: <CircularSeries>[
            DoughnutSeries<Expenses, String>(
                dataSource: _charData,
                xValueMapper: (Expenses data, _) => data.continent,
                yValueMapper: (Expenses data, _) => data.gpd,
                dataLabelSettings: DataLabelSettings(isVisible: true))
          ],
        ));
  }
}

//Супер круглая кнопка левая
class BordarLeftWidgets extends StatelessWidget {
  final Widget child;
  final Color color;
  final Function() onTap;
  BordarLeftWidgets({
    Key? key,
    required this.onTap,
    required this.color,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: child,
        margin: EdgeInsets.only(top: 10, bottom: 10, left: 10),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60), bottomLeft: Radius.circular(60))),
      ),
    );
  }
}

//Супер круглая кнопка правая
class BordarRightWidgets extends StatelessWidget {
  final Widget child;
  final Color color;
  final Function() onTap;
  BordarRightWidgets({
    Key? key,
    required this.onTap,
    required this.color,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: child,
        margin: EdgeInsets.only(top: 10, bottom: 10, right: 10),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(60),
                bottomRight: Radius.circular(60))),
      ),
    );
  }
}

class Expenses {
  Expenses(this.continent, this.gpd);
  final String continent;
  final int gpd;
}

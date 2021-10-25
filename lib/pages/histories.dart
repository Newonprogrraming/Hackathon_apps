import 'package:flutter/material.dart';
import 'package:hackaton_app/constants.dart';
import 'package:hackaton_app/main.dart';
import 'dart:math';

import 'package:hackaton_app/widgets/reusable_card_buttom.dart';

class HistoryLayout extends StatelessWidget {
  const HistoryLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HistoryPage(),
      theme: ThemeData.dark(),
    );
  }
}

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryPage> {
  @override
  var todoList;
  var dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    todoList = ["12 окт", "23 сент", "10 авг", "12 март"];
  }

  var sortedtype = 'year';

  String randoma(min, max) {
    var rn = Random();
    return (min + rn.nextInt(max - min)).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FittedBox(
          fit: BoxFit.fitHeight,
          child: kTextHistoryAppBar,
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
            flex: 1,
            child: ReusableCardButtom(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20, right: 5),
                        ),
                        const Text(
                          "Упорядочить по",
                          textAlign: TextAlign.left,
                          style: kListSum,
                        ),
                        DropdownButton<String>(
                          dropdownColor: kSortedColor,
                          value: sortedtype,
                          items: const [
                            DropdownMenuItem(
                              value: 'week',
                              child: Text(
                                'Сумма: по-убыванию',
                                style: kListSum,
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'month',
                              child: Text(
                                'Сумма по-возрастанию',
                                style: kListSum,
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'year',
                              child: Text(
                                'Дата: сначала новые',
                                style: kListSum,
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'year2',
                              child: Text(
                                'Дата: сначала старые',
                                style: kListSum,
                              ),
                            ),
                          ],
                          onChanged: (v) {
                            setState(() {
                              sortedtype = v!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                  size: 32,
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
            flex: 5,
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
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          "#" + randoma(10000000, 99999999),
                          style: kListSum,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      Column(
                        children: [
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              todoList[index],
                              style: kListTS,
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              randoma(1000, 50000) + "  RUB",
                              style: kListSum,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top: 20)),
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hackaton_app/constants.dart';
import 'package:hackaton_app/pages/auth.dart';
import 'package:hackaton_app/pages/finance.dart';
import 'package:hackaton_app/pages/histories.dart';
import 'package:hackaton_app/widgets/card_visa.dart';
import 'package:hackaton_app/widgets/reusable_card.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final String chartsimg = 'icons/pie-chart.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App Bar, Username and showDialog
      appBar: AppBar(
        title: const FittedBox(
          fit: BoxFit.fitWidth,
          child: kTextUserAppBar,
        ),
        backgroundColor: kBackGraundColor,
        leading: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  elevation: 16,
                  child: SizedBox(
                    height: 200.0,
                    width: 360.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Подтвердите выход из аккаунта',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 18,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                        ),
                        FloatingActionButton.extended(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AuthList(),
                              ),
                            );
                          },
                          label: const Text('Выйти'),
                          backgroundColor: const Color(0xff98ebe6),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          icon: const Icon(
            Icons.account_circle,
            size: 40,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kLableButtom,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 16,
                            child: Container(
                              height: 200.0,
                              margin:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: const [
                                  Padding(padding: EdgeInsets.only(top: 25)),
                                  CardVisa(color: Colors.red),
                                  Padding(padding: EdgeInsets.only(top: 25)),
                                  CardVisa(color: Colors.blue),
                                  Padding(padding: EdgeInsets.only(top: 25)),
                                  CardVisa(color: Colors.green),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Row(
                      children: const [
                        Padding(padding: EdgeInsets.all(30)),
                        Expanded(
                          flex: 1,
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: kTextBile,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: kScore,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 5)),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'RUB',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(30)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HistoryLayout(),
                        ),
                      );
                    },
                    color: kLableStyle,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Column(
                            children: const [
                              Icon(Icons.history, size: 60),
                              Text(
                                "История\nопераций",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {});
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Column(
                            children: const [
                              Icon(Icons.check_circle_outline, size: 60),
                              Padding(padding: EdgeInsets.only(top: 5)),
                              Text(
                                "Цели",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    color: kLableStyle,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: ReusableCard(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Finacelayout(),
                        ),
                      );
                    },
                    color: kLableStyle,
                    child: Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 8)),
                        const Expanded(
                          flex: 1,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: kDetalOperation,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 15)),
                        Expanded(
                          flex: 4,
                          child: Image(
                            image: AssetImage(chartsimg),
                            height: 220,
                            width: 220,
                            fit: BoxFit.fitWidth,
                          ),
                        )
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
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_app/constants.dart';
import 'package:hackaton_app/layout/finance.dart';
import 'package:hackaton_app/layout/histories.dart';
import 'package:hackaton_app/layout/auth.dart';

void main() => runApp(Control());

class Control extends StatelessWidget {
  const Control({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InputPage(),
      theme: ThemeData.dark(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

String kBile = '30060';

class _InputPageState extends State<InputPage> {
  final String chartsimg = 'icons/pie-chart.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //App Bar, Username and showDialog
        appBar: AppBar(
          title: FittedBox(
              fit: BoxFit.fitWidth, child: kTextUserAppBar), //TextAppBar
          backgroundColor: kBackGraundColor,
          leading: IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        elevation: 16,
                        child: Container(
                            height: 200.0,
                            width: 360.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Подтвердите выход из аккаунта',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat', fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                FloatingActionButton.extended(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AuthList()));
                                  },
                                  label: Text('Выйти'),
                                  backgroundColor: Color(0xff98ebe6),
                                )
                              ],
                            )));
                  });
            },
            icon: Icon(
              Icons.account_circle,
              size: 40,
            ),
          ),
        ),
        //App Body
        body: Column(
          children: <Widget>[
            //First block счёт
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
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 16,
                                child: Container(
                                  height: 200.0,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 25,
                                      ),
                                      CardVisa(color: Colors.red),
                                      SizedBox(
                                        width: 25,
                                      ),
                                      CardVisa(color: Colors.blue),
                                      SizedBox(
                                        width: 25,
                                      ),
                                      CardVisa(color: Colors.green),
                                      SizedBox(
                                        width: 25,
                                      )
                                    ],
                                  ),
                                ));
                          });
                    },
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.all(30)),
                        Expanded(
                            flex: 1,
                            child: FittedBox(
                              fit: BoxFit.fitHeight,
                              child: kTextBile,
                            )),
                        Expanded(
                            flex: 1,
                            child: FittedBox(
                              fit: BoxFit.fitHeight,
                              child: kScore,
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            flex: 1,
                            child: Text('RUB',
                                style: TextStyle(
                                    fontSize: 15, fontFamily: 'Montserrat'))),
                        Padding(padding: EdgeInsets.all(30)),
                      ],
                    ),
                  ))
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HistoryLayout()));
                          },
                          color: kLableStyle,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Column(
                                    children: [
                                      Icon(Icons.history, size: 60),
                                      Text("История\nопераций",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontFamily: 'Montserrat')),
                                    ],
                                  )),
                            ],
                          ))),
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
                              children: [
                                Icon(Icons.check_circle_outline, size: 60),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Цели",
                                    style: TextStyle(
                                        fontSize: 25, fontFamily: 'Montserrat'))
                              ],
                            ))
                      ],
                    ),
                    color: kLableStyle,
                  ))
                ],
              ),
            ),
            //Финансовый график
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: ReusableCard(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Finacelayout()));
                        },
                        color: kLableStyle,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            Expanded(
                              flex: 1,
                              child: FittedBox(
                                  fit: BoxFit.fitWidth, child: kDetalOperation),
                            ),
                            SizedBox(
                              height: 15,
                            ),
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
                      ))
                ],
              ),
            ),
          ],
        ));
  }

  //Данные диаграммы
}

class CardVisa extends StatelessWidget {
  final Color color;
  const CardVisa({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 268.0,
        height: 160.0,
        child: Align(
          child: Text(
            "VISA",
            style: TextStyle(fontFamily: 'Montserrat', fontSize: 20),
          ),
          alignment: Alignment.bottomRight,
        ),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ));
  }
}

class ReusableCard extends StatelessWidget {
  final Widget child;
  final Function() onTap;
  final Color color;
  ReusableCard({
    Key? key,
    required this.color,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: child,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(15))),
      ),
    );
  }
}

class ReusableCardButtom extends StatelessWidget {
  final Widget child;
  final Color color;
  ReusableCardButtom({
    Key? key,
    required this.color,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: child,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(15))),
      ),
    );
  }
}

class Expenses {
  Expenses(this.continent, this.gpd);
  final String continent;
  final int gpd;
}

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

const kBottomTextStayle = TextStyle(fontSize: 20.0);

//Стиль белой кнопки
const kTextStyleWhiteBottom =
    TextStyle(fontSize: 20, fontFamily: 'Montserrat', color: Color(0xFF000000));

const kMontserratStyleText = TextStyle(fontSize: 28, fontFamily: 'Montserrat');
// Стиль - статистика - история операций - сумма
const kListSum =
    TextStyle(fontSize: 17, fontFamily: 'Montserrat', color: Color(0xFF000000));
// Стиль - статистика - история операций - дата
const kListTS =
    TextStyle(fontSize: 13, fontFamily: 'Montserrat', color: Color(0xFF000000));
//AppBar Text
const kTextUserAppBar = Text('User', style: kMontserratStyleText);
const kTextFincAppBar =
    Text('Финансовая статистика', style: kMontserratStyleText);

const kTextHistoryAppBar = Text(
  "История операций",
  style: kMontserratStyleText,
);

//Текст счёта
const kTextBile =
    Text('Счёт: ', style: TextStyle(fontSize: 30, fontFamily: 'Montserrat'));

//Text detal operation
const kDetalOperation = Text(
  'Финансовая\nстатистика',
  textAlign: TextAlign.center,
  style: TextStyle(fontSize: 28, fontFamily: 'Montserrat'),
);

//Сам счёт
const kScore = Text('30060', style: kMontserratStyleText);

//Цвета
const kLableStyle = Color(0xFF546a8c);
const kLableButtom = Color(0xFFe73e3e);
const kBackGraundColor = Color(0xFF303030);
const kDetalizationColor = Color(0xfffefbfb);
const kSortedColor = Color(0xFFf2d948);
//Конец цветов

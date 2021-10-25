import 'package:flutter/cupertino.dart';
import 'package:hackaton_app/models/expenses.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartsWidget extends StatelessWidget {
  final List<Expenses> _charData;

  const ChartsWidget({
    Key? key,
    required List<Expenses> charData,
  })  : _charData = charData,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: SfCircularChart(
        legend: Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
        ),
        series: <CircularSeries>[
          DoughnutSeries<Expenses, String>(
            dataSource: _charData,
            xValueMapper: (Expenses data, _) => data.continent,
            yValueMapper: (Expenses data, _) => data.gpd,
            dataLabelSettings: const DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }
}

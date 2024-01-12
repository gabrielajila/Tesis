import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ReportFacturas extends StatelessWidget {
  const ReportFacturas({super.key, required this.chartData});
  final List<SalesData> chartData;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Container(
              child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  series: <CartesianSeries>[
            // Renders line chart
            LineSeries<SalesData, String>(
                dataSource: chartData,
                xValueMapper: (SalesData sales, _) => sales.getMonthString,
                yValueMapper: (SalesData sales, _) => sales.sales)
          ]))),
    );
  }
}

class SalesData {
  SalesData(this.month, this.sales);
  final int month;
  final int sales;

  String get getMonthString {
    switch (month) {
      case 1:
        return 'ENE';
      case 2:
        return 'FEB';
      case 3:
        return 'MAR';
      case 4:
        return 'ABR';
      case 5:
        return 'MAY';
      case 6:
        return 'JUN';
      case 7:
        return 'JUL';
      case 8:
        return 'AGO';
      case 9:
        return 'SEP';
      case 10:
        return 'OCT';
      case 11:
        return 'NOV';
      case 12:
        return 'DIC';
      default:
        return '';
    }
  }
}

import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:poloniex_app/core/blocs/price-info/price_info_cubit.dart';
import 'package:poloniex_app/core/models/price_ticker_model.dart';

class PriceChartPage extends StatelessWidget {
  static const route = '/price_chart_page';

  const PriceChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 48, right: 24),
        child: Center(
          child: _View(),
        ),
      ),
    );
  }
}

class _View extends StatefulWidget {
  const _View();

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PriceInfoCubit, PriceInfoState>(
        buildWhen: (previous, current) =>
            previous.fetchWebsocketTokenState !=
                current.fetchWebsocketTokenState ||
            previous.priceTickers != current.priceTickers,
        builder: (context, state) {
          return _LineChart(state.priceTickers);
        });
  }
}

class _LineChart extends StatelessWidget {
  final List<PriceTickerModel> priceTickers;

  const _LineChart(this.priceTickers);

  double getMaxY() {
    List<double> list = priceTickers.map((element) => element.price).toList();
    double maxY = 10;
    if (list.isNotEmpty) {

      final highestNum = list.reduce(max);
      maxY = highestNum;
    }
    return maxY;
  }

  double getMinY() {
    List<double> list = priceTickers.map((element) => element.price).toList();
    double minY = 10;
    if (list.isNotEmpty) {
      final lowestNum = list.reduce(min);
      minY = lowestNum;
    }
    return minY;
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(
      data,
      duration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get data {
    return LineChartData(
      lineTouchData: lineTouchData,
      gridData: gridData,
      titlesData: titlesData,
      borderData: borderData,
      lineBarsData: lineBarsData,
      minX: 0,
      maxX: 15,
      maxY: getMaxY(),
      minY: getMinY(),
    );
  }

  LineTouchData get lineTouchData => const LineTouchData(
        enabled: true,
      );

  FlTitlesData get titlesData => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData => [
        chartBarData,
      ];

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff75729e),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    return Text(value.toInt().toString(),
        style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() {
   final maxMinRange = getMaxY() - getMinY();
    return SideTitles(
      getTitlesWidget: leftTitleWidgets,
      showTitles: true,
      interval: maxMinRange == 0 ? 1 : maxMinRange / 5,
      reservedSize: 48,
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff72719b),
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    final thisDate = DateTime.now();
    final date = thisDate.subtract(const Duration(minutes: 14)).add(
          Duration(
            minutes: value.toInt(),
          ),
        );
    return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child:
            Text(DateFormat.Hm().format(date.toLocal()), style: style));
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 24,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => const FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Color(0xff4e4965), width: 4),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get chartBarData {
    final thisDate = DateTime.now();
    final date = thisDate.subtract(const Duration(minutes: 14));

    Map<String, List<PriceTickerModel>> groupedData = {};

    for (final priceTicker in priceTickers) {
      String formattedDateTime = priceTicker.filledDateTime.toLocal().toIso8601String().substring(0, 16);

      if (!groupedData.containsKey(formattedDateTime)) {
        groupedData[formattedDateTime] = [];
      }

      groupedData[formattedDateTime]!.add(priceTicker);
    }

    List<FlSpot> flSpots = [];

    groupedData.forEach((dateTime, data) {
      double averagePrice = data.map((e) => e.price).reduce((a, b) => a + b) / data.length;
      DateTime parsedDateTime = DateTime.parse(dateTime);

      flSpots.add(FlSpot(parsedDateTime.subtract(Duration(minutes: date.minute)).minute.toDouble(), averagePrice));
    });
    return LineChartBarData(
      isCurved: true,
      curveSmoothness: 0,
      color: Colors.deepPurple,
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: true),
      belowBarData: BarAreaData(show: false),
      spots: flSpots,
    );
  }
}

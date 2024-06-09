import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../model/data_model/chart_data_model.dart';
import '../../../model/data_model/overview_model.dart';

class TurfOverviewWidget extends StatelessWidget {
  final OverViewModel overviewData;

  const TurfOverviewWidget({required this.overviewData, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatCard("Total Owners", overviewData.totalOwner),
              _buildStatCard("Total Users", overviewData.totalUser),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatCard(
                  "Today's Booking", overviewData.bookings.length.toString()),
              _buildStatCard("Today's Payment", overviewData.totalPayment),
            ],
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            height: 300, // Adjust the height according to your needs
            child: SfCartesianChart(
              title: ChartTitle(text: 'Bookings and Payments Overview'),
              legend: Legend(isVisible: true),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: [
                LineSeries<ChartData, DateTime>(
                  name: 'Bookings',
                  dataSource: overviewData.bookings,
                  xValueMapper: (ChartData data, _) => data.date,
                  yValueMapper: (ChartData data, _) => data.bookings,
                  markerSettings: const MarkerSettings(isVisible: true),
                ),
                LineSeries<ChartData, DateTime>(
                  name: 'Payments',
                  dataSource: overviewData.payment,
                  xValueMapper: (ChartData data, _) => data.date,
                  yValueMapper: (ChartData data, _) => data.payments,
                  markerSettings: const MarkerSettings(isVisible: true),
                ),
              ],
              primaryXAxis: DateTimeAxis(),
              primaryYAxis: NumericAxis(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Expanded(
      child: Card(
        elevation: 4,
        child: Container(
          color: Colors.black45,
          width: 150,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                  )),
              const SizedBox(height: 8.0),
              Text(value,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}

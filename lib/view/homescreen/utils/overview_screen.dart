import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../model/data_model/chart_data_model.dart';
import '../../../model/data_model/overview_model.dart';
import 'status_card.dart';

class TurfOverviewWidget extends StatelessWidget {
  final OverViewModel overviewData;

  const TurfOverviewWidget({required this.overviewData, super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenHeight * 0.02,
        vertical: screenWidth * 0.01,
      ),
      child: Column(
        children: [
          _buildResponsiveGrid(screenWidth, [
            StatCard(title: "Total Owners", value: overviewData.totalOwner),
            StatCard(title: "Total Users", value: overviewData.totalUser),
            StatCard(
                title: "Total Bookings",
                value: overviewData.bookings.length.toString()),
            StatCard(title: "Total Payments", value: overviewData.totalPayment),
          ]),
          // SizedBox(height: screenWidth * 0.04),
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

  Widget _buildResponsiveGrid(double screenWidth, List<Widget> children) {
    int crossAxisCount = screenWidth > 800 ? 4 : 2;

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: screenWidth * 0.04,
        crossAxisSpacing: screenWidth * 0.04,
        childAspectRatio: 2,
      ),
      itemCount: children.length,
      itemBuilder: (context, index) {
        return children[index];
      },
    );
  }
}

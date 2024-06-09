import 'chart_data_model.dart';

class OverViewModel {
  List<ChartData> bookings;
  List<ChartData> payment;
  String totalOwner;
  String totalPayment;
  String totalUser;
  OverViewModel({
    required this.bookings,
    required this.payment,
    required this.totalOwner,
    required this.totalPayment,
    required this.totalUser,
  });
}

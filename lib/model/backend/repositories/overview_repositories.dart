import 'package:admin_side_turf_application/model/controller/formater.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../../controller/firebase_exceptionhandler.dart';
import '../../data_model/booking_model.dart';
import '../../data_model/chart_data_model.dart';
import '../../data_model/overview_model.dart';
import '../../data_model/transaction_model.dart';

class OverView {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<OverViewModel> overViewStatus() async {
    try {
      // Define the range for the last two weeks
      DateTime endDate = DateTime.now();
      DateTime startDate = endDate.subtract(Duration(days: 14));

      // Fetch owners and users counts
      var ownerSnapshot = await _db.collection('Owner').get();
      var totalOwners = ownerSnapshot.size;

      var userSnapshot = await _db.collection('Users').get();
      var totalUsers = userSnapshot.size;

      // Fetch bookings in the date range
      var bookingsSnapshot = await _db.collectionGroup('bookings').get();
      // .where('bookedDate', isGreaterThanOrEqualTo: startDate)
      // .where('bookedDate', isLessThanOrEqualTo: endDate)

      // Fetch transactions in the date range
      var transactionsSnapshot =
          await _db.collectionGroup('transactions').get();
      // .where('transactionDate', isGreaterThanOrEqualTo: startDate)
      // .where('transactionDate', isLessThanOrEqualTo: endDate)

      // Convert Firestore documents to models
      List<BookingModel> bookings = [];
      for (var book in bookingsSnapshot.docs) {
        var bookingModel = BookingModel.fromSnapshot(book);
        if (bookingModel.bookedDate.isAfter(startDate) ||
            bookingModel.bookedDate.isBefore(endDate)) {
          bookings.add(bookingModel);
        }
      }

      // List<BookingModel> bookings = bookingsSnapshot.docs
      //     .map((doc) => BookingModel.fromSnapshot(doc))
      //     .toList();

      List<TransactionModel> transactions = [];
      for (var book in transactionsSnapshot.docs) {
        var transactionModel = TransactionModel.fromSnapshot(book);
        if (transactionModel.transactionDate.isAfter(startDate) ||
            transactionModel.transactionDate.isBefore(endDate)) {
          transactions.add(transactionModel);
        }
      }
      // List<TransactionModel> transactions = transactionsSnapshot.docs
      //     .map((doc) => TransactionModel.fromSnapshot(doc))
      //     .toList();

      // Aggregate data for the chart
      Map<String, double> bookingsData = {};
      Map<String, double> paymentsData = {};
      var totalPayment = 0.0;

      for (var booking in bookings) {
        String dateString = DateFormat('dd-MM-yy').format(booking.bookedDate);
        if (bookingsData.containsKey(dateString)) {
          bookingsData[dateString] = bookingsData[dateString]! + 1;
        } else {
          bookingsData[dateString] = 1;
        }
      }

      for (var transaction in transactions) {
        String dateString =
            DateFormat('dd-MM-yy').format(transaction.transactionDate);
        if (paymentsData.containsKey(dateString)) {
          paymentsData[dateString] =
              paymentsData[dateString]! + transaction.amount;
          totalPayment += transaction.amount;
        } else {
          paymentsData[dateString] = transaction.amount;
          totalPayment += transaction.amount;
        }
      }

      // Create ChartData objects
      List<ChartData> bookingsChartData = bookingsData.entries
          .map((entry) => ChartData(
              DateFormat('yyyy-MM-dd').parse(entry.key), entry.value, 0))
          .toList();

      List<ChartData> paymentsChartData = paymentsData.entries
          .map((entry) => ChartData(
              DateFormat('yyyy-MM-dd').parse(entry.key), 0, entry.value))
          .toList();

      return OverViewModel(
          bookings: bookingsChartData,
          payment: paymentsChartData,
          totalPayment: Formatter.formatCurrencyK(totalPayment),
          totalOwner: totalOwners.toString(),
          totalUser: totalUsers.toString());
    } catch (e) {
      throw ExceptionHandler.handleException(e);
    }
  }
}

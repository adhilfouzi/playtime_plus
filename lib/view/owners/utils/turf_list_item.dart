import 'package:flutter/material.dart';

class TurfListItem extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final String turfName;
  final String address;
  final String timings;
  final bool status;

  const TurfListItem({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.turfName,
    required this.address,
    required this.timings,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        leading: screenWidth < 600
            ? null
            : Container(
                width: screenWidth * 0.05,
                height: screenHeight * 0.05,
                color: Colors.green,
              ),
        title: Text(
          turfName,
          style: TextStyle(
            fontSize: screenWidth < 600 ? 12 : 18,
          ),
        ),
        subtitle: Text(
          address,
          style: TextStyle(fontSize: screenWidth < 600 ? 8 : 15),
        ),
        trailing: buildTrailing(context),
      ),
    );
  }

  Widget buildTrailing(BuildContext context) {
    if (screenWidth < 600) {
      return SizedBox(
        width: screenWidth * 0.46,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              timings,
              style: const TextStyle(fontSize: 10),
            ),
            SizedBox(width: screenWidth * 0.017),
            Text(
              status ? "Active" : "Disable",
              style: TextStyle(
                  fontSize: 11, color: status ? Colors.green : Colors.yellow),
            ),
            SizedBox(width: screenWidth * 0.017),
            IconButton(
              onPressed: () {
                // Edit action
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    } else {
      return SizedBox(
        width: screenWidth * 0.41,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(timings),
            SizedBox(width: screenWidth * 0.02),
            Text(
              status ? "Active" : "Disable",
              style: TextStyle(color: status ? Colors.green : Colors.yellow),
            ),
            SizedBox(width: screenWidth * 0.02),
            ElevatedButton.icon(
              onPressed: () {
                // Edit action
              },
              icon: const Icon(Icons.edit),
              label: const Text("Edit"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}

import 'package:admin_side_turf_application/view/owners/sub/view_owner/screen/view_owner_screen.dart';
import 'package:flutter/material.dart';

import '../../../model/utils/const/fontsize.dart';

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
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ViewOwnerScreen()));
        },
        leading: screenWidth < 600
            ? null
            : Container(
                width: screenWidth * 0.05,
                height: screenHeight * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AspectRatio(
                    aspectRatio: 16 / 9, // Adjust aspect ratio as needed
                    child: Image.asset(
                      "assets/image/turf_image.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
        title: Text(
          turfName,
          style: TextStyle(
            fontSize: ResponsiveFontSize.getFontSize(context),
          ),
        ),
        subtitle: Text(
          address,
          style: TextStyle(fontSize: ResponsiveFontSize.getFontSize(context)),
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
              style: TextStyle(
                fontSize: ResponsiveFontSize.getFontSize(context),
              ),
            ),
            SizedBox(width: screenWidth * 0.017),
            Text(
              status ? "Active" : "Disable",
              style: TextStyle(
                  fontSize: ResponsiveFontSize.getFontSize(context),
                  color: status ? Colors.green : Colors.yellow),
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
              style: TextStyle(color: status ? Colors.green : Colors.redAccent),
            ),
            SizedBox(width: screenWidth * 0.02),
            ElevatedButton.icon(
              onPressed: () {
                // Edit action
              },
              icon: const Icon(Icons.edit),
              label: Text(
                "Edit",
                style: TextStyle(
                  fontSize: ResponsiveFontSize.getFontSize(context),
                ),
              ),
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

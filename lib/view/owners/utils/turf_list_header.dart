import 'package:flutter/material.dart';

import '../../../model/utils/const/fontsize.dart';

class CustomColor {
  static const Color darksecondarycolor = Colors.black;
  static const Color mainColor = Colors.blue;
}

class OwnerHeader extends StatelessWidget {
  const OwnerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: CustomColor.darksecondarycolor,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.height * 0.02,
          vertical: MediaQuery.of(context).size.width * 0.01,
        ),
        child: Row(
          children: [
            Text(
              'Turf List',
              style: TextStyle(
                color: Colors.white,
                fontSize: ResponsiveFontSize.getFontSize(context),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width < 600
                    ? MediaQuery.of(context).size.width * 0.03
                    : MediaQuery.of(context).size.width * 0.01),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height * 0.02),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: CustomColor.darksecondarycolor),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search turf....',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(color: CustomColor.darksecondarycolor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width < 600
                    ? MediaQuery.of(context).size.width * 0.01
                    : MediaQuery.of(context).size.width * 0.01),
            buildAddTurfButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildAddTurfButton(BuildContext context) {
    return MediaQuery.of(context).size.width < 600
        ? IconButton(
            onPressed: () {
              // Add turf action
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        : ElevatedButton(
            onPressed: () {
              // Add turf action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: CustomColor.mainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                SizedBox(width: 8),
                Text(
                  "Add Turf",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          );
  }
}

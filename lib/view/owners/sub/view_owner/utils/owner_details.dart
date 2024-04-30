import 'package:flutter/material.dart';
import '../../../../../model/utils/const/colors.dart';
import '../../../../../model/utils/const/fontsize.dart';

class TurfDetails extends StatelessWidget {
  const TurfDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SectionTitle(title: 'Court Information'),
            SizedBox(height: screenHeight * 0.02),
            const CourtDetails(),
            SizedBox(height: screenHeight * 0.02),
            const SectionTitle(title: 'Owner Information'),
            SizedBox(height: screenHeight * 0.02),
            const OwnerDetails(),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: ResponsiveFontSize.getFontSize(context,
              styleType: TextStyleType.h2),
          // screenWidth > 600 ? 24.0 : (screenWidth > 360 ? 20 : 15),
          fontWeight: FontWeight.bold,
          color: CustomColor.mainColor,
        ),
      ),
    );
  }
}

class CourtDetails extends StatelessWidget {
  const CourtDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Card(
      color: CustomColor.slotunavailable[200],
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailRow(
                icon: Icons.person_pin,
                value: 'Court Name',
                screenWidth: screenWidth),
            SizedBox(height: screenHeight * 0.02),
            DetailRow(
                icon: Icons.location_on,
                value: 'Vazhakkad, Kozhikode',
                screenWidth: screenWidth),
            SizedBox(height: screenHeight * 0.02),
            DetailRow(
                icon: Icons.phone,
                value: '9856253686',
                screenWidth: screenWidth),
            SizedBox(height: screenHeight * 0.02),
            DetailRow(
                icon: Icons.email,
                value: 'coalcastle@gmail.com',
                screenWidth: screenWidth),
            SizedBox(height: screenHeight * 0.02),
            DetailRow(
                icon: Icons.access_time,
                value: '24H',
                screenWidth: screenWidth),
            SizedBox(height: screenHeight * 0.02),
            DetailRow(
              icon: Icons.info,
              value:
                  "Vazhakkad and its neighboring areas have produced many state and national players -- U Sharafali (former Indian player), Ijaz Ali (Indian Junior Team), Hanan Javed (Indian Junior Team), Shakkeer Manuppa (former Kerala Blasters), Shabaz Saleel (India U-21). Goal Castle is one of the first artificial turfs in the Malabar region. Good for 5-a-side matches.",
              screenWidth: screenWidth,
            ),
          ],
        ),
      ),
    );
  }
}

class OwnerDetails extends StatelessWidget {
  const OwnerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Card(
      color: CustomColor.slotunavailable[200],
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailRow(
                icon: Icons.person, value: 'Arshak', screenWidth: screenWidth),
            SizedBox(height: screenHeight * 0.02),
            DetailRow(
                icon: Icons.phone,
                value: '8089608089',
                screenWidth: screenWidth),
            SizedBox(height: screenHeight * 0.02),
            DetailRow(
                icon: Icons.email,
                value: 'arshak@gmail.com',
                screenWidth: screenWidth),
          ],
        ),
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  final IconData icon;
  final String value;
  final double screenWidth;

  const DetailRow({
    super.key,
    required this.icon,
    required this.value,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: CustomColor.mainColor,
          size: screenWidth < 600 ? 24.0 : 28.0,
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: ResponsiveFontSize.getFontSize(context),
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}

double constrainMaxWidth(double screenWidth) {
  // Define breakpoints for common device categories
  const double extraSmallScreen =
      360; // Example threshold for extra small screens
  const double smallScreen = 600; // Example threshold for small screens
  const double mediumScreen = 1024; // Example threshold for medium screens
  const double largeScreen = 1440; // Example threshold for large screens

  // Determine the maximum width based on the screen width
  if (screenWidth < extraSmallScreen) {
    // For extra small screens
    return screenWidth * 0.9;
  } else if (screenWidth < smallScreen) {
    // For small screens
    return screenWidth * 0.8;
  } else if (screenWidth < mediumScreen) {
    // For medium screens
    return screenWidth * 0.6;
  } else if (screenWidth < largeScreen) {
    // For large screens
    return screenWidth * 0.5;
  } else {
    // For extra large screens
    return screenWidth * 0.4;
  }
}

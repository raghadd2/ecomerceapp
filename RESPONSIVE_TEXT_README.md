# RESPONSIVE TEXT


### Explanation of the Sizes:

- **Display Large (40.0)**: Use for the most prominent text like app names or large numbers. Typically for headers or splash screens.
- **Display Medium (34.0)**: Major headings or large text that is prominent but not overwhelming.
- **Display Small (28.0)**: A bit smaller for titles that are still important but less dominant.
- **Headline Large (24.0)**: Use for section titles or important labels in the UI.
- **Headline Medium (22.0)**: For smaller section headings.
- **Headline Small (20.0)**: For subsections or minor headings.
- **Title Large (18.0)**: Used for medium-sized headings or secondary titles.
- **Title Medium (16.0)**: This would be standard for titles or headers.
- **Title Small (14.0)**: Used for subtitles or less emphasized text.
- **Body Large (16.0)**: This is the default size for body text in mobile apps, where legibility is key.
- **Body Medium (14.0)**: Slightly smaller body text, suitable for less important passages.
- **Body Small (12.0)**: For captions or less emphasized body text.
- **Label Large (14.0)**: For buttons, making them readable but not overly large.
- **Label Medium (12.0)**: Medium-sized text for UI labels or button text.
- **Label Small (10.0)**: For very small text elements like captions or micro-labels.

```dart
TextTheme(
  displayLarge: TextStyle(fontSize: 40.0), // Large text for very prominent titles
  displayMedium: TextStyle(fontSize: 34.0), // Slightly smaller for major headings
  displaySmall: TextStyle(fontSize: 28.0), // Smaller display text for short titles
  headlineLarge: TextStyle(fontSize: 24.0), // Headings for important sections
  headlineMedium: TextStyle(fontSize: 22.0), // Medium headings
  headlineSmall: TextStyle(fontSize: 20.0), // Smaller headings
  titleLarge: TextStyle(fontSize: 18.0), // For medium emphasis titles
  titleMedium: TextStyle(fontSize: 16.0), // For standard titles
  titleSmall: TextStyle(fontSize: 14.0), // Small titles or subtitles
  bodyLarge: TextStyle(fontSize: 16.0), // Default body text size
  bodyMedium: TextStyle(fontSize: 14.0), // Slightly smaller body text
  bodySmall: TextStyle(fontSize: 12.0), // Small body text for captions
  labelLarge: TextStyle(fontSize: 14.0), // Buttons or prominent labels
  labelMedium: TextStyle(fontSize: 12.0), // Medium-sized labels
  labelSmall: TextStyle(fontSize: 10.0), // Small labels or captions
),

```

## With Scale Factor

```dart
  double getScaleFactor(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    late double scaleFactor;
    if (width < AppConstance.mobileWidth) {
      scaleFactor = width / 400;
    } else if (width < AppConstance.tabletWidth) {
      scaleFactor = width / 700;
    } else {
      scaleFactor = width / 1000;
    }
    return scaleFactor.clamp(0.8, 1.5);
  }
```

## Get Font Size

```dart
double getFontSize(BuildContext context, double baseSize) =>
      baseSize * getScaleFactor(context);
```

## Now Usage With Font Size

```dart
  TextTheme responsiveTextTheme(BuildContext context) {
    return TextTheme(
      displayLarge: TextStyle(fontSize: getFontSize(context, 40.0)),
      displayMedium: TextStyle(fontSize: getFontSize(context, 34.0)),
      displaySmall: TextStyle(fontSize: getFontSize(context, 28.0)),
      headlineLarge: TextStyle(fontSize: getFontSize(context, 24.0)),
      headlineMedium: TextStyle(fontSize: getFontSize(context, 22.0)),
      headlineSmall: TextStyle(fontSize: getFontSize(context, 20.0)),
      titleLarge: TextStyle(fontSize: getFontSize(context, 18.0)),
      titleMedium: TextStyle(fontSize: getFontSize(context, 16.0)),
      titleSmall: TextStyle(fontSize: getFontSize(context, 14.0)),
      bodyLarge: TextStyle(fontSize: getFontSize(context, 16.0)),
      bodyMedium: TextStyle(fontSize: getFontSize(context, 14.0)),
      bodySmall: TextStyle(fontSize: getFontSize(context, 12.0)),
      labelLarge: TextStyle(fontSize: getFontSize(context, 14.0)),
      labelMedium: TextStyle(fontSize: getFontSize(context, 12.0)),
      labelSmall: TextStyle(fontSize: getFontSize(context, 10.0)),
    );
  }
```
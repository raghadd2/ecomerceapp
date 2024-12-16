import 'package:base_project/core/utils/app_constance.dart';
import 'package:base_project/core/utils/app_extension.dart';
import 'package:base_project/core/utils/theme/app_colors.dart';
import 'package:base_project/core/utils/theme/responsive_text_theme.dart';
import 'package:flutter/material.dart';

abstract class DarkTheme {
  const DarkTheme._();
  static ThemeData init(BuildContext context) => ThemeData(
        useMaterial3: true,
        fontFamily: AppConstance.appFont,
        scaffoldBackgroundColor: AppColors.scaffoldDarkThemeColor,
        brightness: Brightness.dark,
        colorScheme: colorScheme(),
        appBarTheme: appBarTheme(),
        inputDecorationTheme: inputDecorationTheme(),
        elevatedButtonTheme: elevatedButtonTheme(context),
        textButtonTheme: textButtonThemeData(),
        dialogTheme: dialogTheme(),
        bottomSheetTheme: bottomSheetTheme(),
        listTileTheme: listTileTheme(),
        textTheme: generalTextStyle(context),
      );

  static ColorScheme colorScheme() => const ColorScheme.dark(
        primary: AppColors.primaryColor,
        brightness: Brightness.dark,
      );

  static AppBarTheme appBarTheme() => const AppBarTheme(
        backgroundColor: AppColors.scaffoldDarkThemeColor,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: AppConstance.appFont,
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      );

  static InputDecorationTheme inputDecorationTheme() {
    const borderSide =
        BorderSide(color: AppColors.borderTextFieldColor, width: 1);
    final borderRadius = 24.radius;
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.fillTextFieldColor,
      hintStyle: const TextStyle(
        color: Color(0xff9C9C9C),
        fontSize: 12,
      ),
      border: OutlineInputBorder(
        borderSide: borderSide,
        borderRadius: borderRadius,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: borderSide,
        borderRadius: borderRadius,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: borderSide,
        borderRadius: borderRadius,
      ),
    );
  }

  static ElevatedButtonThemeData elevatedButtonTheme(BuildContext ctx) =>
      ElevatedButtonThemeData(
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.all(Colors.white.withOpacity(.2)),
          backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          textStyle: WidgetStateProperty.all(const TextStyle(
            fontSize: 14,
            fontFamily: AppConstance.appFont,
          )),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          ),
          minimumSize: WidgetStateProperty.all(Size(ctx.width, 50)),
        ),
      );

  static TextButtonThemeData textButtonThemeData() => TextButtonThemeData(
          style: TextButton.styleFrom(
        textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ));

  static DialogTheme dialogTheme() => DialogTheme(
        shape: RoundedRectangleBorder(borderRadius: 24.radius),
        backgroundColor: AppColors.scaffoldDarkThemeColor,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontFamily: AppConstance.appFont,
        ),
        contentTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: AppConstance.appFont,
        ),
      );

  static BottomSheetThemeData bottomSheetTheme() => BottomSheetThemeData(
        backgroundColor: AppColors.scaffoldDarkThemeColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      );

  static ListTileThemeData listTileTheme() => ListTileThemeData(
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: AppConstance.appFont,
        ),
      );

  static TextTheme generalTextStyle(BuildContext context) {
    return TextTheme(
      displayLarge: TextStyle(
        color: Colors.white,
        fontSize: ResponsiveTextTheme.getFontSize(context, 40.0),
      ),
      displayMedium: TextStyle(
        color: Colors.white,
        fontSize: ResponsiveTextTheme.getFontSize(context, 34.0),
      ),
      displaySmall: TextStyle(
        color: Colors.white,
        fontSize: ResponsiveTextTheme.getFontSize(context, 28.0),
      ),
      headlineLarge: TextStyle(
        color: Colors.white,
        fontSize: ResponsiveTextTheme.getFontSize(context, 24.0),
      ),
      headlineMedium: TextStyle(
        color: Colors.white,
        fontSize: ResponsiveTextTheme.getFontSize(context, 22.0),
      ),
      headlineSmall: TextStyle(
        color: Colors.white,
        fontSize: ResponsiveTextTheme.getFontSize(context, 20.0),
      ),
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: ResponsiveTextTheme.getFontSize(context, 18.0),
      ),
      titleMedium: TextStyle(
        color: Colors.white,
        fontSize: ResponsiveTextTheme.getFontSize(context, 16.0),
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontSize: ResponsiveTextTheme.getFontSize(context, 14.0),
      ),
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: ResponsiveTextTheme.getFontSize(context, 16.0),
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: ResponsiveTextTheme.getFontSize(context, 14.0),
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        fontSize: ResponsiveTextTheme.getFontSize(context, 12.0),
      ),
      labelLarge: TextStyle(
        color: Colors.white,
        fontSize: ResponsiveTextTheme.getFontSize(context, 14.0),
      ),
      labelMedium: TextStyle(
        color: Colors.white,
        fontSize: ResponsiveTextTheme.getFontSize(context, 12.0),
      ),
      labelSmall: TextStyle(
        color: Colors.white,
        fontSize: ResponsiveTextTheme.getFontSize(context, 10.0),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:theme/theme_fields.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

class GoldenTestUtils {
  GoldenTestUtils._();

  static Widget configureMaterialApp(Widget widget) {
    final theme = _buildTheme();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.themeDataLight,
      themeMode: ThemeMode.light,
      home: Material(
        child: Center(
          child: widget,
        ),
      ),
    );
  }

  static PatchAiTheme _buildTheme() {
    return PatchAiTheme(
      lightThemeColors: PatchAiThemeFields.fromJson(
        {
          'appointmentColorAccepted': '0xff6baf26',
          'appointmentColorDone': '0xff004d99',
          'appointmentColorPending': '0xffcfa50d',
          'appointmentColorRejected': '0xffe40046',
          'backgroundDarkerColor': '0xfff3f3f3',
          'barBackgroundColor': '0xffffffff',
          'barDividerColor': '0xffe8e8e8',
          'barrierColor': '0xff8e93ab',
          'buttonOutlineColor': '0xffd1d1d1',
          'eDiaryColorIncomplete': '0xffe40046',
          'eDiaryColorPending': '0xffcfa50d',
          'eDiaryColorSuccess': '0xff6baf26',
          'errorColor': '0xffe40046',
          'successColor': '0xff6baf26',
          'homeEdiaryButtonDateColor': '0xffcce0f5',
          'homeEdiaryButtonGradientFrom': '0xff67a2df',
          'homeEdiaryButtonGradientTo': '0xff004d99',
          'homeNoteBackgroundColor': '0xffeff2f5',
          'homeNoteDisabledColor': '0xffc0cbd5',
          'incomingChatBackgroundColor': '0xfff3f3f3',
          'newsDateTextColor': '0xff747474',
          'newsFilterListColor': '0xff004d99',
          'newsFilterSelectedColor': '0xffffffff',
          'newsFilterUnSelectedColor': '0xff004d99',
          'newsReadMoreColor': '0xff0066cc',
          'outgoingChatBackgroundColor': '0xff67a2df',
          'pinBackgroundColor': '0xff004d99',
          'pinBackgroundColorDark': '0xff003367',
          'primaryColor': '0xff004d99',
          'primaryColorDark': '0xff003367',
          'primaryColorLight': '0xff0066cc',
          'primaryColorText': '0xff004d99',
          'profileBackgroudColor': '0xffffffff',
          'settingsTileColor': '0xffffffff',
          'shadowColorReversed': '0xffe8e8e8',
          'symptomsBackgroudColor': '0xffffffff',
          'symptomsPainBackgorundCardColor': '0xff8e93ab',
          'symptomsSearchFormBorderColor': '0xfff3f3f4',
          'textColorAccent': '0xff002d2d',
          'textColorDarker': '0xff161616',
          'textColorPrimary': '0xff2d2d2d',
          'textColorQuaternary': '0xff8e93ab',
          'textColorQuinary': '0xff8a8a8a',
          'textColorReversed': '0xffffffff',
          'textColorSecondary': '0xff464646',
          'textColorTertiary': '0xff5d5d5d',
          'versionCheckAppButtonColor': '0xffffffff',
          'versionCheckAppButtonTextColor': '0xff004d99',
          'versionCheckBackgroundColor': '0xff004d99',
          'versionCheckTextColor': '0xffffffff',
          'scaffoldBackgroundColor': '0xffffffff',
          'medicationTrackerGenericTextContentColor': '0xFF575A69',
          'medicationTrackerTextFieldTitleColor': '0xFF777C93',
          'medicationTrackerTextFieldPlaceholderColor': '0xFFBFC2D0',
          'medicationTrackerSearchItemSubtitleTextColor': '0xFF757575',
          'medicationTrackerBackgroundDarkerColor': '0xFFF8F8F8',
          'medicationTrackerWizardWeekdayTextColor': '0xFF65697D',
        },
      ),
    );
  }

  static void configureToLookLikeIPhone11(WidgetTester tester) {
    tester.binding.window
      ..physicalSizeTestValue = Device.iphone11.size
      ..devicePixelRatioTestValue = Device.iphone11.devicePixelRatio
      ..textScaleFactorTestValue = Device.iphone11.textScale;
  }
}

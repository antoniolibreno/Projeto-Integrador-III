import 'package:flutter/material.dart';

/// Papéis semânticos disponíveis na paleta de cores da aplicação.
///
/// Use os papéis da paleta (`AppColors.light` ou `AppColors.dark`) em vez de
/// espalhar valores hexadecimais pelos widgets.
enum AppColorRole {
  primary,
  primaryDark,
  primaryLight,
  secondary,
  brandPurple,
  brandGreen,
  background,
  surface,
  surfaceVariant,
  surfaceElevated,
  textPrimary,
  textSecondary,
  textDisabled,
  onPrimary,
  onSecondary,
  success,
  onSuccess,
  successContainer,
  error,
  onError,
  errorContainer,
  warning,
  onWarning,
  warningContainer,
  info,
  onInfo,
  infoContainer,
  border,
  divider,
  focus,
  progressTrack,
  locked,
  scrim,
}

/// Cores fixas da identidade NatyApp.
abstract final class AppColors {
  // Marca e ações.
  static const brandGreen = Color(0xFF15C291);
  static const brandPurple = Color(0xFF6243E9);
  static const primary = Color(0xFF6B26D9);
  static const primaryDark = Color(0xFF561FB8);
  static const primaryLight = Color(0xFF9566E4);
  static const secondary = Color(0xFF22C35E);
  static const secondaryLight = Color(0xFF52DC85);

  // Neutros compartilhados.
  static const darkBackground = Color(0xFF0D1017);
  static const darkSurface = Color(0xFF171C26);
  static const darkSurfaceVariant = Color(0xFF202634);
  static const darkTextPrimary = Color(0xFFF0F1F4);
  static const darkTextSecondary = Color(0xFFC3C6CC);
  static const darkTextDisabled = Color(0xFF777E8D);
  static const darkBorder = Color(0xFF2B303B);

  static const lightBackground = Color(0xFFFFFFFF);
  static const lightSurface = Color(0xFFFFFFFF);
  static const lightSurfaceVariant = Color(0xFFF6F7FA);
  static const lightTextPrimary = Color(0xFF2B303B);
  static const lightTextSecondary = Color(0xFF5D667E);
  static const lightTextDisabled = Color(0xFF9298A5);
  static const lightBorder = Color(0xFFE2E4E9);

  // Estados semânticos.
  static const success = Color(0xFF22C35E);
  static const successContainerLight = Color(0xFFE8F8EE);
  static const successContainerDark = Color(0xFF123A24);
  static const error = Color(0xFFEF4444);
  static const errorContainerLight = Color(0xFFFDECEC);
  static const errorContainerDark = Color(0xFF491B20);
  static const warning = Color(0xFFF5A30B);
  static const warningContainerLight = Color(0xFFFFF6DE);
  static const warningContainerDark = Color(0xFF49320D);
  static const info = Color(0xFF3B82F6);
  static const infoContainerLight = Color(0xFFEAF2FE);
  static const infoContainerDark = Color(0xFF142D52);

  static const scrimLight = Color(0x7A0D1017); // #0D1017 a 48%.
  static const scrimDark = Color(0xA3000000); // preto a 64%.

  /// Gradiente de assinatura usado em splash, certificados e destaques raros.
  static const brandGradient = LinearGradient(
    colors: [brandGreen, brandPurple],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const light = AppColorPalette._light();
  static const dark = AppColorPalette._dark();
}

/// Tokens semânticos para um modo de tema.
class AppColorPalette {
  const AppColorPalette._({
    required this.primary,
    required this.primaryDark,
    required this.primaryLight,
    required this.secondary,
    required this.brandPurple,
    required this.brandGreen,
    required this.background,
    required this.surface,
    required this.surfaceVariant,
    required this.surfaceElevated,
    required this.textPrimary,
    required this.textSecondary,
    required this.textDisabled,
    required this.onPrimary,
    required this.onSecondary,
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.warning,
    required this.onWarning,
    required this.warningContainer,
    required this.info,
    required this.onInfo,
    required this.infoContainer,
    required this.border,
    required this.divider,
    required this.focus,
    required this.progressTrack,
    required this.locked,
    required this.scrim,
  });

  const AppColorPalette._light()
    : this._(
        primary: AppColors.primary,
        primaryDark: AppColors.primaryDark,
        primaryLight: AppColors.primaryLight,
        secondary: AppColors.secondary,
        brandPurple: AppColors.brandPurple,
        brandGreen: AppColors.brandGreen,
        background: AppColors.lightBackground,
        surface: AppColors.lightSurface,
        surfaceVariant: AppColors.lightSurfaceVariant,
        surfaceElevated: AppColors.lightSurface,
        textPrimary: AppColors.lightTextPrimary,
        textSecondary: AppColors.lightTextSecondary,
        textDisabled: AppColors.lightTextDisabled,
        onPrimary: Colors.white,
        onSecondary: AppColors.darkBackground,
        success: AppColors.success,
        onSuccess: Colors.white,
        successContainer: AppColors.successContainerLight,
        error: AppColors.error,
        onError: Colors.white,
        errorContainer: AppColors.errorContainerLight,
        warning: AppColors.warning,
        onWarning: AppColors.darkBackground,
        warningContainer: AppColors.warningContainerLight,
        info: AppColors.info,
        onInfo: Colors.white,
        infoContainer: AppColors.infoContainerLight,
        border: AppColors.lightBorder,
        divider: AppColors.lightBorder,
        focus: AppColors.primary,
        progressTrack: AppColors.lightBorder,
        locked: AppColors.lightTextDisabled,
        scrim: AppColors.scrimLight,
      );

  const AppColorPalette._dark()
    : this._(
        primary: AppColors.primaryLight,
        primaryDark: AppColors.primaryDark,
        primaryLight: AppColors.primaryLight,
        secondary: AppColors.secondaryLight,
        brandPurple: AppColors.brandPurple,
        brandGreen: AppColors.brandGreen,
        background: AppColors.darkBackground,
        surface: AppColors.darkSurface,
        surfaceVariant: AppColors.darkSurfaceVariant,
        surfaceElevated: AppColors.darkSurfaceVariant,
        textPrimary: AppColors.darkTextPrimary,
        textSecondary: AppColors.darkTextSecondary,
        textDisabled: AppColors.darkTextDisabled,
        onPrimary: AppColors.darkBackground,
        onSecondary: AppColors.darkBackground,
        success: AppColors.secondaryLight,
        onSuccess: AppColors.darkBackground,
        successContainer: AppColors.successContainerDark,
        error: AppColors.error,
        onError: Colors.white,
        errorContainer: AppColors.errorContainerDark,
        warning: AppColors.warning,
        onWarning: AppColors.darkBackground,
        warningContainer: AppColors.warningContainerDark,
        info: AppColors.info,
        onInfo: Colors.white,
        infoContainer: AppColors.infoContainerDark,
        border: AppColors.darkBorder,
        divider: AppColors.darkBorder,
        focus: AppColors.primaryLight,
        progressTrack: AppColors.darkBorder,
        locked: AppColors.darkTextDisabled,
        scrim: AppColors.scrimDark,
      );

  final Color primary;
  final Color primaryDark;
  final Color primaryLight;
  final Color secondary;
  final Color brandPurple;
  final Color brandGreen;
  final Color background;
  final Color surface;
  final Color surfaceVariant;
  final Color surfaceElevated;
  final Color textPrimary;
  final Color textSecondary;
  final Color textDisabled;
  final Color onPrimary;
  final Color onSecondary;
  final Color success;
  final Color onSuccess;
  final Color successContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color warning;
  final Color onWarning;
  final Color warningContainer;
  final Color info;
  final Color onInfo;
  final Color infoContainer;
  final Color border;
  final Color divider;
  final Color focus;
  final Color progressTrack;
  final Color locked;
  final Color scrim;

  Color operator [](AppColorRole role) => switch (role) {
    AppColorRole.primary => primary,
    AppColorRole.primaryDark => primaryDark,
    AppColorRole.primaryLight => primaryLight,
    AppColorRole.secondary => secondary,
    AppColorRole.brandPurple => brandPurple,
    AppColorRole.brandGreen => brandGreen,
    AppColorRole.background => background,
    AppColorRole.surface => surface,
    AppColorRole.surfaceVariant => surfaceVariant,
    AppColorRole.surfaceElevated => surfaceElevated,
    AppColorRole.textPrimary => textPrimary,
    AppColorRole.textSecondary => textSecondary,
    AppColorRole.textDisabled => textDisabled,
    AppColorRole.onPrimary => onPrimary,
    AppColorRole.onSecondary => onSecondary,
    AppColorRole.success => success,
    AppColorRole.onSuccess => onSuccess,
    AppColorRole.successContainer => successContainer,
    AppColorRole.error => error,
    AppColorRole.onError => onError,
    AppColorRole.errorContainer => errorContainer,
    AppColorRole.warning => warning,
    AppColorRole.onWarning => onWarning,
    AppColorRole.warningContainer => warningContainer,
    AppColorRole.info => info,
    AppColorRole.onInfo => onInfo,
    AppColorRole.infoContainer => infoContainer,
    AppColorRole.border => border,
    AppColorRole.divider => divider,
    AppColorRole.focus => focus,
    AppColorRole.progressTrack => progressTrack,
    AppColorRole.locked => locked,
    AppColorRole.scrim => scrim,
  };

  ColorScheme get colorScheme => ColorScheme(
    brightness: identical(this, AppColors.dark)
        ? Brightness.dark
        : Brightness.light,
    primary: primary,
    onPrimary: onPrimary,
    secondary: secondary,
    onSecondary: onSecondary,
    error: error,
    onError: onError,
    surface: surface,
    onSurface: textPrimary,
    surfaceContainerHighest: surfaceVariant,
    outline: border,
    scrim: scrim,
  );
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {

  static const Color primary = Color(0xFF0F4C81);
  static const Color accent = Color(0xFFFF8A00);
  static const Color bg = Color(0xFFF6F8FB);

  // ========== Common Values ==========
  static const double defaultRadius = 12.0;
  static const double defaultPadding = 16.0;
  static const double buttonHeight = 50.0;

  static final ThemeData lightTheme = ThemeData(

    useMaterial3: true,
    scaffoldBackgroundColor: bg,
    primaryColor: primary,
    colorScheme: ColorScheme.fromSeed(seedColor: primary),
    textTheme: GoogleFonts.poppinsTextTheme(),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
        ),
        elevation: 2,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(

      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),

    ),

  );

  // ========== Reusable Text Styles ==========
  static const TextStyle headingText = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subHeadingText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static TextStyle captionText = TextStyle(
    fontSize: 14,
    color: Colors.grey[600],
  );

  // ========== Common Decorations ==========
  static BoxDecoration cardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(defaultRadius),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    ],
  );

  static BoxDecoration commonBoxDecoration({Color? color}) {
    return BoxDecoration(
      color: color ?? Colors.white,
      borderRadius: BorderRadius.circular(defaultRadius),
    );
  }

  // ========== Spacers ==========
  static Widget spacerSmall() => const SizedBox(height: 8);
  static Widget spacerMedium() => const SizedBox(height: 16);
  static Widget spacerLarge() => const SizedBox(height: 24);

  // ========== Reusable UI Helpers ==========

  static Widget primaryButton({
    required String text,
    required VoidCallback onPressed,
    bool isLoading = false,
    double? width,
    IconData? icon,
  }) {
    return SizedBox(
      width: width ?? double.infinity,
      height: buttonHeight,
      child: icon != null
          ? ElevatedButton.icon(
              onPressed: isLoading ? null : onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
              ),
              icon: Icon(icon),
              label: Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            )
          : ElevatedButton(
              onPressed: isLoading ? null : onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
              ),
              child: isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ),
    );
  }

  static Widget secondaryButton({
    required String text,
    required VoidCallback onPressed,
    Color? color,
    IconData? icon,
  }) {
    return SizedBox(
      width: double.infinity,
      height: buttonHeight,
      child: icon != null
          ? OutlinedButton.icon(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                foregroundColor: color ?? primary,
                side: BorderSide(color: color ?? primary, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
              ),
              icon: Icon(icon),
              label: Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            )
          : OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                foregroundColor: color ?? primary,
                side: BorderSide(color: color ?? primary, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
              ),
              child: Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ),
    );
  }

  static Widget inputField({
    required TextEditingController controller,
    required String hint,
    String? label,
    IconData? icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label ?? hint,
        hintText: hint,
        prefixIcon: icon != null ? Icon(icon) : null,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
      ),
    );
  }

  static Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(text, style: subHeadingText),
    );
  }

  static Widget appCard({
    required Widget child,
    double? padding,
    EdgeInsets? customPadding,
  }) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      child: Padding(
        padding: customPadding ?? EdgeInsets.all(padding ?? defaultPadding),
        child: child,
      ),
    );
  }
}

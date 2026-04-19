import 'package:flutter/material.dart';

class AppColors {
  // Requested Tech Palette
  static const Color primary = Color(0xFFBCFF00); // Electric Lime
  static const Color secondary = Color(0xFF96998C); // Olive Grey
  static const Color accent = Color(0xFFBCFF00); // Same as primary for consistency
  
  // Background & Surface
  static const Color background = Color(0xFF061414); // Deep Dark Cyan
  static const Color surface = Color(0xFF0A1F1F); // Slightly lighter than background
  static const Color card = Color(0xFF132A2A); // Elevated Surface
  static const Color glass = Color(0x1AFFFFFF); // Translucent
  
  // Text colors
  static const Color textPrimary = Color(0xFFE9EBE6); // Off White
  static const Color textSecondary = Color(0xFFD2D3CE); // Light Grey
  static const Color textDimmed = Color(0xFF96998C); // Olive Grey

  // Status colors
  static const Color success = Color(0xFFBCFF00);
  static const Color warning = Color(0xFFEAB308);
  static const Color error = Color(0xFFFF4B4B);

  // Gradients
  static const LinearGradient mainGradient = LinearGradient(
    colors: [primary, Color(0xFF8EBF00)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient successGradient = LinearGradient(
    colors: [primary, Color(0xFF7AA300)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

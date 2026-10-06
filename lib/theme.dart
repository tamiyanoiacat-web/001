import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Brand Colors: Cyberpunk Dark Gray + Electric Cyber Blue Accent
const Color kBlue = Color(0xFF0084FF); // Vibrant Electric Cyber Blue
const Color kBlueLight = Color(0xFF38BDF8); // Neon Cyan / Luminous Highlight
const Color kBlueDark = Color(0xFF00E5FF); // Electric Neon Cyan Accent
const Color kBlueSoft = Color(0xFF111E2E); // Deep Cyber Blue Tint / Container
const Color kBlueDeep = Color(0xFF0052CC); // Deep Electric Royal Blue

// Aliases for kPurple (for seamless Web3 Cyberpunk styling across all components)
const Color kPurple = kBlue;
const Color kPurpleLight = kBlueLight;
const Color kPurpleDark = kBlueDark;
const Color kPurpleSoft = kBlueSoft;

// Cyberpunk Gray Surfaces
const Color kWhite = Color(0xFF0B0E14); // Cyberpunk Obsidian / Carbon Dark Gray Background
const Color kOffWhite = Color(0xFF101622); // Subtle Dark Gunmetal Gray for Alternating Sections
const Color kCardBg = Color(0xFF151C2A); // High-Tech Dark Cyber Slate Card Background
const Color kBorderColor = Color(0xFF1E293B); // Cyber Slate Grid Border

// Cyberpunk Typography Colors
const Color kTextDark = Color(0xFFF8FAFC); // Crisp Ice White / Platinum for Headings
const Color kTextMuted = Color(0xFF94A3B8); // High-tech Slate Gray for Body Text
const Color kTextSubtle = Color(0xFF64748B); // Gunmetal Gray for Secondary Labels

// Aliases for compatibility
const Color kYellow = kBlue;
const Color kYellowLight = kBlueLight;
const Color kBlack = Color(0xFF06080D);
const Color kDarkGray = Color(0xFF101622);
const Color kMidGray = Color(0xFF1E293B);

TextStyle headingStyle({
  double size = 42,
  FontWeight weight = FontWeight.w900,
  Color color = kTextDark,
}) {
  return GoogleFonts.inter(
    fontSize: size,
    fontWeight: weight,
    color: color,
    height: 1.1,
  );
}

TextStyle bodyStyle({
  double size = 16,
  FontWeight weight = FontWeight.w400,
  Color color = kTextMuted,
}) {
  return GoogleFonts.inter(
    fontSize: size,
    fontWeight: weight,
    color: color,
    height: 1.6,
  );
}

TextStyle labelStyle({
  double size = 13,
  Color color = kBlue,
  FontWeight weight = FontWeight.w700,
  double spacing = 2,
}) {
  return GoogleFonts.inter(
    fontSize: size,
    fontWeight: weight,
    color: color,
    letterSpacing: spacing,
  );
}

Widget yellowDivider() {
  return Container(
    width: 48,
    height: 3,
    margin: const EdgeInsets.only(top: 12, bottom: 20),
    decoration: BoxDecoration(
      color: kBlue,
      borderRadius: BorderRadius.circular(4),
      boxShadow: [
        BoxShadow(
          color: kBlue.withOpacity(0.55),
          blurRadius: 10,
          offset: const Offset(0, 2),
        ),
      ],
    ),
  );
}

Widget sectionLabel(String text) {
  return Text(text.toUpperCase(), style: labelStyle());
}

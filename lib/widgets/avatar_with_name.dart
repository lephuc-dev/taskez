import 'package:flutter/material.dart';
import '../resources/resources.dart';

class AvatarWithName extends StatelessWidget {
  final String name;
  final BoxShape? boxShape;
  final double fontSize;
  final double shapeSize;
  final int? count;

  const AvatarWithName({
    Key? key,
    required this.name,
    required this.fontSize,
    required this.shapeSize,
    this.boxShape,
    this.count,
  }) : super(key: key);

  static const colorDefault = Color(0xFF717171);

  static final colorInitial = {
    'A': const Color(0xFFAA00FF),
    'B': const Color(0xFF2196F3),
    'C': const Color(0xFF1DE9B6),
    'D': const Color(0xFFCDDC39),
    'E': const Color(0xFF689F38),
    'F': const Color(0xFF388E3C),
    'G': const Color(0xFFF57C00),
    'H': const Color(0xFFFFA000),
    'I': const Color(0xFFFBC02D),
    'J': const Color(0xFFFFEA00),
    'K': const Color(0xFFE64A19),
    'L': const Color(0xFF5D4037),
    'M': const Color(0xFF7E57C2),
    'N': const Color(0xFF2196F3),
    'O': const Color(0xFFAA00FF),
    'P': const Color(0xFF2196F3),
    'Q': const Color(0xFF00B0FF),
    'R': const Color(0xFF00E5FF),
    'S': const Color(0xFFAA00FF),
    'T': const Color(0xFF2196F3),
    'U': const Color(0xFF64DD17),
    'V': const Color(0xFFAEEA00),
    'W': const Color(0xFFAA00FF),
    'X': const Color(0xFFFFAB00),
    'Y': const Color(0xFFAA00FF),
    'Z': const Color(0xFF2196F3),
  };

  Color fixedColor(String text) {
    if (text.isEmpty) {
      return colorDefault;
    }

    var split = text[0].toUpperCase();

    return colorInitial[split] ?? colorDefault;
  }

  @override
  Widget build(BuildContext context) {
    return avatarWidget(name: name, fontSize: fontSize, shapeSize: shapeSize, count: count, boxShape: boxShape);
  }

  Widget avatarWidget({BoxShape? boxShape, required String name, required double fontSize, required double shapeSize, required int? count}) {
    return Container(
      height: shapeSize,
      width: shapeSize,
      decoration: BoxDecoration(
        shape: boxShape ?? BoxShape.circle,
        //borderRadius: boxShape == null ? null : BorderRadius.circular(8),
        color: name == ''
            ? colorDefault
            : fixedColor(
                InitialName.parseName(name, count),
              ),
      ),
      child: Center(
        child: Text(
          name == '' ? '' : InitialName.parseName(name, count).toUpperCase(),
          style: TextStyle(
            color: AppColors.primaryWhite,
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
            letterSpacing: 1.4,
          ),
        ),
      ),
    );
  }
}

class InitialName {
  // @string name
  // @int letterLimit (optional) to limit the number of letters that appear
  static String parseName(String name, int? letterLimit) {
    // separate each word
    var parts = name.split(' ');
    var initial = '';

    // check length
    if (parts.length > 1) {
      // check max limit
      if (letterLimit != null) {
        for (var i = 0; i < letterLimit; i++) {
          // combine the first letters of each word
          initial += parts[i][0];
        }
      } else {
        // this default, if word > 1
        initial = parts[0][0] + parts[1][0];
      }
    } else {
      // this default, if word <=1
      initial = parts[0][0];
    }
    return initial;
  }
}

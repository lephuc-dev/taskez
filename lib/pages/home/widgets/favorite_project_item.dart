import 'package:flutter/material.dart';

import '../../../models/models.dart';
import '../../../resources/resources.dart';
import '../../../router/router.dart';
import '../../../widgets/widgets.dart';

class FavoriteProjectItem extends StatelessWidget {
  final Project project;

  const FavoriteProjectItem({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWellWrapper(
      onTap: () => Navigator.pushNamed(context, Routes.project, arguments: {"project": project}),
      child: Stack(
        children: [
          project.image == ""
              ? Container(
                  color: fixedColor(project.name ?? ""),
                )
              : Image.network(
                  project.image!,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
          Container(
            color: AppColors.primaryBlack1.withOpacity(0.35),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              project.name ?? "Unknown",
              style: Theme.of(context).textTheme.headline5?.copyWith(fontSize: 14, color: AppColors.primaryWhite),
            ),
          ),
        ],
      ),
    );
  }

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
}

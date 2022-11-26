import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TitleAppbar extends StatefulWidget {
  const TitleAppbar({super.key});

  @override
  State<TitleAppbar> createState() => _TitleAppbarState();
}

class _TitleAppbarState extends State<TitleAppbar> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
     SizedBox(),
      Text(
        'Thông báo',
        style: Theme.of(context).textTheme.headline5?.copyWith(fontSize: 20),
      ),
      Row(
        children: [
          Container(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.05),
            child: const FaIcon(FontAwesomeIcons.squareCheck),
          ),
          const FaIcon(FontAwesomeIcons.ellipsisVertical)
        ],
      )
    ]);

  }
}
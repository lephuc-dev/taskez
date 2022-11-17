import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../enums/enums.dart';
import '../resources/colors.dart';

class NotifyComponent extends StatelessWidget {
  final String list;
  final String card;
  final String board;
  final String user;
  final Type type;
  final String expiredtime;
  final String time;
  final String avt;
  final String change;
  final void Function() onTap;

  const NotifyComponent({
    Key? key,
    this.list = '',
    required this.card,
    this.board = '',
    this.user = '',
    this.avt='',
    this.change = '',
    required this.type,
    this.expiredtime = '',
    required this.time,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: ListTile(
        onTap: onTap,
        leading: type == Type.expired
            ? const FaIcon(
                FontAwesomeIcons.clock,
                size: 40,
              )
            : Image.network(
                avt,width: 40,height: 40,),
        title: content(type),
        subtitle: Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom:
                      BorderSide(width: 0.5, color: AppColors.primaryGray2))),
          child: Container(
            padding: const EdgeInsets.only(bottom: 15,top: 2),
            child: Text(
              time,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
            ),
          ),
        ),
      ),
    );
  }

  Widget content(Type type) {
    switch (type) {
      case Type.add:
        return RichText(
          text: TextSpan(
              style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: AppColors.primaryBlack3,
                  fontSize: 15),
              children: <TextSpan>[
                TextSpan(
                  text: user,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: ' đã thêm bạn vào thẻ '),
                TextSpan(
                  text: card,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: ' ở bảng '),
                TextSpan(
                  text: board,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ]),
        );
      case Type.change:
        return RichText(
          text: TextSpan(
              style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: AppColors.primaryBlack3,
                  fontSize: 15),
              children: <TextSpan>[
                TextSpan(
                  text: user,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: ' đã thay đổi '),
                TextSpan(text: change),
                const TextSpan(text: ' của thẻ '),
                TextSpan(
                  text: card,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: ' ở bảng '),
                TextSpan(
                  text: board,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ]),
        );
      case Type.expired:
        return RichText(
          text: TextSpan(
              style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: AppColors.primaryBlack3,
                  fontSize: 15),
              children: <TextSpan>[
                const TextSpan(text: 'thẻ '),
                TextSpan(
                  text: card,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: ' trong bảng '),
                TextSpan(
                  text: board,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: ' đã hết hạn '),
                TextSpan(
                  text: expiredtime,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ]),
        );
      case Type.move:
        return RichText(
          text: TextSpan(
              style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: AppColors.primaryBlack3,
                  fontSize: 15),
              children: <TextSpan>[
                TextSpan(
                  text: user,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: ' đã di chuyển thẻ '),
                TextSpan(
                  text: card,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: ' tới danh sách '),
                TextSpan(
                  text: list,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: ' ở bảng '),
                TextSpan(
                  text: board,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ]),
        );
      default:
        return const Text('default');
    }
  }
}

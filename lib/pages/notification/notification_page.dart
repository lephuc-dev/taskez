import 'package:badges/badges.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taskez/pages/notification/widgets/title_appbar.dart';
import '../../blocs/blocs.dart';
import '../../base/base.dart';
import '../../resources/colors.dart';
import '../../resources/resources.dart';
import 'package:flutter/material.dart';
import 'widgets/tabbar_view.dart';

class NotificationPage extends StatefulWidget {
  final NotificationBloc bloc;

  const NotificationPage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState
    extends BaseState<NotificationPage, NotificationBloc>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              controller: _tabController,
              labelColor: AppColors.primaryBlack1,
              indicatorColor: AppColors.yellow,
              tabs: [
                Tab(
                  text: 'Tất cả',
                  icon: Badge(
                    position: BadgePosition.topEnd(end: -8),
                    shape: BadgeShape.circle,
                    badgeColor: AppColors.primaryRed,
                    badgeContent: const Text(
                      '2',
                      style: TextStyle(
                          color: AppColors.primaryWhite, fontSize: 12),
                    ),
                    animationType: BadgeAnimationType.slide,
                    child: const FaIcon(
                      FontAwesomeIcons.bell,
                      color: AppColors.primaryBlack1,
                    ),
                  ),
                ),
                Tab(
                  text: 'Hết hạn',
                  icon: Badge(
                    position: BadgePosition.topEnd(end: -8),
                    shape: BadgeShape.circle,
                    badgeColor: AppColors.primaryRed,
                    showBadge: false,
                    badgeContent: const Text(
                      '3',
                      style: TextStyle(
                          color: AppColors.primaryWhite, fontSize: 12),
                    ),
                    animationType: BadgeAnimationType.slide,
                    child: const FaIcon(
                      FontAwesomeIcons.clockRotateLeft,
                      color: AppColors.primaryBlack1,
                    ),
                  ),
                ),
                Tab(
                    text: 'Lời mời',
                    icon: Badge(
                      position: BadgePosition.topEnd(end: -8),
                      shape: BadgeShape.circle,
                      badgeColor: AppColors.primaryRed,
                      badgeContent: const Text(
                        '1',
                        style: TextStyle(
                            color: AppColors.primaryWhite, fontSize: 12),
                      ),
                      animationType: BadgeAnimationType.slide,
                      child: const FaIcon(
                        FontAwesomeIcons.envelopesBulk,
                        color: AppColors.primaryBlack1,
                      ),
                    )),
              ],
            ),
            automaticallyImplyLeading: true,
            backgroundColor: AppColors.primaryWhite,
            iconTheme: const IconThemeData(color: AppColors.primaryBlack1),
            elevation: 0,
            title: const TitleAppbar(),
          ),
          body: TabBarView(controller: _tabController, children: [
            TabBarItem(
              type: 'all',
              bloc: widget.bloc,
            ),
            TabBarItem(
              type: 'expired',
              bloc: widget.bloc,
            ),
            TabBarItem(
              type: 'invite',
              bloc: widget.bloc,
            ),
          ])),
    );
  }

  @override
  NotificationBloc get bloc => widget.bloc;
}

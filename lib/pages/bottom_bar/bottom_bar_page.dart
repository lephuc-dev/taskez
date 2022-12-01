import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskez/pages/my_information/my_information.dart';
import '../home/home.dart';
import '../notification/notification.dart';
import '../../repositories/repositories.dart';
import '../../blocs/blocs.dart';
import '../../resources/resources.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  HomeBloc homeBloc = HomeBloc(
    AuthenticationRepository(),
    UserRepository(),
    ProjectRepository(),
    ProjectParticipantRepository(),
  );

  NotificationBloc notificationBloc = NotificationBloc(
    NotificationRepository(),
    UserRepository(),
    ProjectRepository(),
    AuthenticationRepository(),
  );

  MyInformationBloc myInformationBloc = MyInformationBloc(
    AuthenticationRepository(),
    UserRepository(),
  );

  @override
  void initState() {
    super.initState();
    _widgetOptions = [
      HomePage(homeBloc),
      const Scaffold(),
      NotificationPage(notificationBloc),
      MyInformationPage(myInformationBloc),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 1,
        backgroundColor: AppColors.primaryWhite,
        type: BottomNavigationBarType.fixed,
        iconSize: 18,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: const IconThemeData(color: Colors.black),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              VectorImageAssets.ic_home,
              color: AppColors.primaryGray1,
            ),
            activeIcon: SvgPicture.asset(
              VectorImageAssets.ic_home,
              color: AppColors.primaryBlack1,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              VectorImageAssets.ic_schedule,
              color: AppColors.primaryGray1,
            ),
            activeIcon: SvgPicture.asset(
              VectorImageAssets.ic_schedule,
              color: AppColors.primaryBlack1,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              VectorImageAssets.ic_notification,
              color: AppColors.primaryGray1,
            ),
            activeIcon: SvgPicture.asset(
              VectorImageAssets.ic_notification,
              color: AppColors.primaryBlack1,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              VectorImageAssets.ic_user,
              color: AppColors.primaryGray1,
            ),
            activeIcon: SvgPicture.asset(
              VectorImageAssets.ic_user,
              color: AppColors.primaryBlack1,
            ),
            label: "Home",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

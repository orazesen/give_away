part of '../main_page.dart';

class _BottomNavBarPart extends StatelessWidget {
  _BottomNavBarPart(
    this.router,
  );

  final TabsRouter router;

  final _icons = [
    Icons.home,
    Icons.person,
    Icons.person,
  ];

  // List<String> get _titles => [
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      elevation: 4,
      height: kBottomNavigationBarHeight,
      disableDefaultTabController: false,
      curve: Curves.ease,
      initialActiveIndex: 0,
      onTap: (index) {
        router.setActiveIndex(index);
      },
      onTabNotify: (index) {
        return true;
      },
      backgroundColor: Colors.white,
      color: Colors.white,
      style: TabStyle.reactCircle,
      items: _icons.map<TabItem>((e) {
        return TabItem(
          icon: Icon(
            e,
          ),
          // title: _titles[index],
        );
      }).toList(),
    );
  }
}

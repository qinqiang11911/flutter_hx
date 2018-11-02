import 'package:flutter/material.dart';
import '../constants.dart' show Constants;
import '../constants.dart' show AppColors;

class NavigationIconView{
  final String _title;
  final IconData  _icon;
  final IconData _activeIcon;
  final BottomNavigationBarItem item;
//定义一个数据结构，用于底部导航
  NavigationIconView({Key key,String title,IconData icon,IconData activeIcon}):
      _title=title,
  _icon=icon,
  _activeIcon=activeIcon,
  item = new BottomNavigationBarItem(
      icon: Icon(icon),
      activeIcon:Icon(icon),
      title: Text(title),
      backgroundColor: Colors.white
  );
      
}

class HomeScreen extends StatefulWidget {

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;
  int _currentIndex=0;
  List<NavigationIconView> _navigationViews;
  List<Widget> _pages;
  void initState()
  {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
    _pages = [
      Container(child: Text('首页'),),
      Container(child: Text('2'),),
      Container(child: Text('3'),),
      Container(child: Text('4'),),
    ];
    _navigationViews=[
     NavigationIconView(
       title: '首页',
       icon: IconData(
         0xe63a,
         fontFamily:Constants.IconFontFamily,
       ),
       activeIcon: IconData(
       0xe63a,
         fontFamily:Constants.IconFontFamily,
       ),
       
     ),
     NavigationIconView(
       title: '我要投资',
       icon: IconData(
       0xe927,
         fontFamily:Constants.IconFontFamily,
       ),
       activeIcon: IconData(
       0xe92c,
         fontFamily:Constants.IconFontFamily,
       ),
     ),
     NavigationIconView(
       title: '安全保障',
       icon: IconData(
       0xe6b3,
         fontFamily:Constants.IconFontFamily,
       ),
       activeIcon: IconData(
       0xe92e,
         fontFamily:Constants.IconFontFamily,
       ),
     ),
     NavigationIconView(
       title: '个人中心',
       icon: IconData(
       0xe64d,
         fontFamily:Constants.IconFontFamily,
       ),
       activeIcon: IconData(
       0xe92d,
         fontFamily:Constants.IconFontFamily,
       ),
     ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar= new BottomNavigationBar(
      fixedColor: const Color(AppColors.TabIconActive),
      items: _navigationViews.map((NavigationIconView view)
        {
          return view.item;
        }

    ).toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index)
      {

        setState(() {
          _currentIndex = index;
          _pageController.animateToPage(_currentIndex, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
        });
        //print('click is $index le ok!');
      },
    );

    return Scaffold(

      appBar: AppBar(
         title:new Image.asset('assets/icons/logo.png',fit:BoxFit.contain,height: 30.0,),
        //title: Text('鸿禧链'),
       //leading:new Image.asset('assets/icons/logo.png',fit:BoxFit.fill,),

      ),
      body: PageView.builder(
       
       itemBuilder: (BuildContext context, int index)
        {
          return _pages[index];
        },
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (int index){
         setState(() {
           _currentIndex = index;
         });
        },
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}

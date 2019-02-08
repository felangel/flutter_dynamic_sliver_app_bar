import 'package:flutter/material.dart';

class AltApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Sliver App Bar'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () => null,
          ),
        ],
      ),
      body: CollapsingTabList(),
    );
  }
}

class CollapsingTabList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        CollapsingHeader(),
        SliverTabBar(),
        getSliverList(context),
      ],
    );
  }
}

class CollapsingHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _SliverCollapsingHeaderDelegate(
        child: PreferredSize(
          preferredSize: Size.fromHeight(200),
          child: Container(
              child: Center(
                  child: Center(
            child: SizedBox.expand(
              child: Image.network(
                'https://lz12v4f1p8c1cumxnbiqvm10-wpengine.netdna-ssl.com/wp-content/uploads/2018/02/banana-with-low-self-esteem.jpg',
                fit: BoxFit.cover,
              ),
            ),
            //RaisedButton(child: Text('Hello')))),
            //FlutterLogo()),
          ))),
        ),
      ),
    );
  }
}

class _SliverCollapsingHeaderDelegate extends SliverPersistentHeaderDelegate {
  _SliverCollapsingHeaderDelegate({@required this.child});

  final PreferredSizeWidget child;
  @override
  double get minExtent => 0;
  @override
  double get maxExtent => child.preferredSize.height;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverCollapsingHeaderDelegate oldDelegate) =>
      child != oldDelegate.child;
}

class SliverTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverTabHeaderDelegate(),
    );
  }
}

class _SliverTabHeaderDelegate extends SliverPersistentHeaderDelegate {
  final _tabBar = TabBar(
    tabs: [
      Tab(text: 'Tab1'),
      Tab(text: 'Tab2'),
    ],
  );

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return DefaultTabController(
      length: 2,
      child: Container(
        color: Colors.blue,
        child: _tabBar,
      ),
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}

Widget getSliverList(BuildContext context) {
  return SliverFixedExtentList(
    itemExtent: 150.0,
    delegate: SliverChildListDelegate(
      <Widget>[
        Container(color: Colors.red),
        Container(color: Colors.purple),
        Container(color: Colors.green),
        Container(color: Colors.orange),
        Container(color: Colors.yellow),
      ],
    ),
  );
}

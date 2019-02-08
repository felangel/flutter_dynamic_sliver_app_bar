import 'package:flutter/material.dart';

class Alt2App extends StatelessWidget {
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
        ContentSliverList(extent: 50),
        SliverTabBar(),
        ContentSliverList(extent: 150),
      ],
    );
  }
}

// SliverToBoxAdapter

class ContentSliverList extends StatelessWidget {
  ContentSliverList({this.extent});
  final double extent;

  @override
  Widget build(BuildContext context) {
    return SliverFixedExtentList(
      itemExtent: extent,
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

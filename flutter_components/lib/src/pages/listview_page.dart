import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();
  List<int> _numberList = new List();
  int _lastNumber = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _addImages();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listas'),
        ),
        body: Stack(
          children: <Widget>[
            _createLoading(),
            _createList(),
          ],
        ));
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15)
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: refreshPage,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _numberList.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _numberList[index];

          return FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image:
                  NetworkImage('https://picsum.photos/500/300?random=$imagen'));
        },
      ),
    );
  }

  Future<Null> refreshPage() async {
    final duration = new Duration(seconds: 2);

    new Timer(duration, () {
      _numberList.clear();
      _lastNumber++;
      _addImages();
    });

    return Future.delayed(duration);
  }

  void _addImages() {
    for (int i = 0; i < 10; i++) {
      _lastNumber++;
      _numberList.add(_lastNumber);
    }

    setState(() {});
  }

  Future<Null> _fetchData() async {
    _isLoading = true;

    setState(() {
      final duration = new Duration(seconds: 2);
      new Timer(duration, responseHTTP);
    });
  }

  void responseHTTP() {
    _isLoading = false;

    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
    _addImages();
  }
}

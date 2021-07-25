import 'package:flutter/material.dart';
import 'package:herbafriend/src/model/herbafriend_model.dart';
import 'package:herbafriend/src/service/herfriend_service.dart'
    show HerbaFriendService;
import 'package:herbafriend/src/widget/herbafriend_card.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final HerbaFriendService _service = HerbaFriendService();

  List<Recipes> _result = [];

  @override
  void initState() {
    super.initState();
    _loadResult();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _result.length == 0
          ? Container(
              height: 150.0,
              child: Center(child: CircularProgressIndicator()),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: SingleChildScrollView(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: _result.map((e) => HerbaFriendCard(e)).toList(),
              )),
            ),
    );
  }

  _loadResult() {
    _service.getRecipes().then((value) {
      print(value);
      _result = value;
      setState(() {});
    });
  }
}

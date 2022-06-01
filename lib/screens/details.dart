import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Align(
              alignment: Alignment.bottomLeft,
              child: Text("Evenement")),
            backgroundColor: Color(0xFF080808),
            primary: true,
            pinned: true,
            expandedHeight: 215,
            flexibleSpace: FlexibleSpaceBar(
              background:  new ClipRect(
            child: new Container(
                decoration: new BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/fem.jpeg",
                        ),
                        fit: BoxFit.fitWidth
					)
				),
			),),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text("List tile $index"),
                );
              },
              childCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}
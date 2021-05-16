import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/adopt.dart';
import '../widgets/adopt_item.dart';

class AdoptScreen extends StatelessWidget {
  static const routeName = '/adopt';
  @override
  Widget build(BuildContext context) {
    final adopt = Provider.of<Adopt>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your pending adoptions'),
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: adopt.numberOfApplications,
            itemBuilder: (ctx, i) => AdoptItem(
              adopt.animals.values.toList()[i].id,
              adopt.animals.keys.toList()[i],
              adopt.animals.values.toList()[i].name,
              adopt.animals.values.toList()[i].imageURL,
              adopt.animals.values.toList()[i].adoptStatus,
            ),
          ),
        )
      ]),
    );
  }
}

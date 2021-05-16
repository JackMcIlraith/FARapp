//reveiw 210

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../models/vtr.dart';
// import '../widgets/vtr_item.dart';

// class VTRScreen extends StatelessWidget {
//   static const routeName = '/vtr';
//   @override
//   Widget build(BuildContext context) {
//     final vtr = Provider.of<VTR>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Current Vet Treatement Record'),
//       ),
//       body: Column(children: <Widget>[
//         Expanded(
//           child: ListView.builder(
//             itemCount: vtr.numberOfRecords,
//             //itemBuilder: (ctx, i) => VTRItem(
//             //  vtr.vetRecord.values.toList()[i].id,
//             //  vtr.vetRecord.values.toList()[i].dateOfVisit,
//             //  vtr.vetRecord.values.toList()[i].description,
//             ),
//           ),
//         )
//       ]),
//     );
//   }
// }

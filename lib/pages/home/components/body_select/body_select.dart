// import 'package:anime_aspdm/models/home_body_type.dart';
// import 'package:anime_aspdm/providers/provier_home.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class BodySelect extends StatelessWidget {
//   const BodySelect({Key? key}) : super(key: key);

//   List<bool> _getSelected(ProviderHome provider) {
//     return provider.homeBodyType == HomeBodyType.anime
//         ? [true, false]
//         : [false, true];
//   }

//   void _updateSelected(ProviderHome provider, int index) {
//     index == 0
//         ? provider.updateHomeBodyType(HomeBodyType.anime)
//         : provider.updateHomeBodyType(HomeBodyType.manga);
//   }

//   @override
//   Widget build(BuildContext context) {
//     debugPrint("Building $runtimeType");
//     return Consumer<ProviderHome>(
//       builder: (context, value, child) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 20.0),
//           child: ToggleButtons(
//             isSelected: _getSelected(value),
//             selectedColor: Colors.white,
//             fillColor: Colors.orange,
//             borderRadius: const BorderRadius.all(Radius.circular(10)),
//             onPressed: (i) {
//               _updateSelected(value, i);
//             },
//             textStyle: const TextStyle(fontWeight: FontWeight.bold),
//             borderWidth: 1.5,
//             children: const [
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 10),
//                 child: Center(child: Text("ANIME")),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 10),
//                 child: Center(child: Text("MANGA")),
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

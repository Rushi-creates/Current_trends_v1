// import 'package:flutter/cupertino.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:url_launcher/url_launcher.dart';

// class MyMapWidget extends StatelessWidget {
//   const MyMapWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FlutterMap(
//       options: const MapOptions(
//         initialCenter: LatLng(19.0760, 72.8777),
//         initialZoom: 9.2,
//       ),
//       children: [
//         // TileLayer(
//         //   urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//         //   userAgentPackageName: 'com.example.app',
//         // ),
//         RichAttributionWidget(
//           attributions: [
//             TextSourceAttribution(
//               'OpenStreetMap contributors',
//               onTap: () =>
//                   launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

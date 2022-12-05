import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class FullScreenMapScreen extends StatefulWidget {
  @override
  State<FullScreenMapScreen> createState() => _FullScreenMapScreenState();
}

class _FullScreenMapScreenState extends State<FullScreenMapScreen> {
  late MapboxMapController mapController;
  final center = LatLng(19.366904, -99.006874);
  final String tokenAcceso =
      "sk.eyJ1IjoiamF2aWVyZCIsImEiOiJjbGJhZXR5cG0wN3o2M25wa3FraG95Y2RsIn0.dQIruTDRRrp9uKHvST_mCg";
  String selectedStyle = 'mapbox://styles/javierd/clbafveqn001814mx6w4y3awm';
  final String streetStyle =
      "mapbox://styles/javierd/clbafy3if000w14n8jvreqzdi";
  final String nightStyle = "mapbox://styles/javierd/clbafveqn001814mx6w4y3awm";
  double zoom = 14;

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _CrearMapa(),
      bottomNavigationBar: _botones(),
      // floatingActionButton: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     FloatingActionButton(
      //         onPressed: () {
      //           if (selectedStyle == streetStyle) {
      //             selectedStyle = nightStyle;
      //           } else {
      //             selectedStyle = streetStyle;
      //           }

      //           setState(() {});
      //         },
      //         child: Icon(
      //           Icons.add_to_home_screen_outlined,
      //         )),
      //   ],
      // ),
    );
  }

  Container _botones() {
    return Container(
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          botonApariencia(Icons.layers_sharp, "Cambia apariencia"),
          SizedBox(width: 30),
          ampliar(Icons.add_outlined, "Ampliar"),
          SizedBox(width: 30),
          reducir(Icons.linear_scale, "Reducir"),
          SizedBox(width: 30),
          // marcarObjetos(Icons.person_outline, "Mostrar"),
        ],
      ),
    );
  }

  Column marcarObjetos(IconData icon, String texto) {
    return Column(
      children: [
        IconButton(
          color: Colors.grey,
          icon: Icon(icon, size: 30),
          onPressed: () {
            mapController.addSymbol(
              SymbolOptions(
                geometry: center,
                iconSize: 3,
                // iconImage: 'attraction-15',
                textColor: "Montaña creada aqui",
                textOffset: Offset(0, 1),
              ),
            );
          },
        ),
        Text(texto),
      ],
    );
  }

  Column botonApariencia(IconData icon, String texto) {
    return Column(
      children: [
        IconButton(
          color: Colors.grey,
          icon: Icon(icon, size: 30),
          onPressed: () {
            if (selectedStyle == streetStyle) {
              selectedStyle = nightStyle;
            } else {
              selectedStyle = streetStyle;
            }

            setState(() {});
          },
        ),
        Text("Cambiar Apariencia"),
      ],
    );
  }

  Column ampliar(IconData icon, String texto) {
    return Column(
      children: [
        IconButton(
          color: Colors.grey,
          icon: Icon(icon, size: 30),
          onPressed: () {
            mapController.animateCamera(CameraUpdate.zoomIn());
          },
        ),
        Text(texto),
      ],
    );
  }

  Column reducir(IconData icon, String texto) {
    return Column(
      children: [
        IconButton(
          color: Colors.grey,
          icon: Icon(icon, size: 30),
          onPressed: () {
            mapController.animateCamera(CameraUpdate.zoomOut());
          },
        ),
        Text(texto),
      ],
    );
  }

  MapboxMap _CrearMapa() {
    return MapboxMap(
      styleString: selectedStyle,
      accessToken: tokenAcceso,
      onMapCreated: _onMapCreated,
      // minMaxZoomPreference: MinMaxZoomPreference.unbounded,
      initialCameraPosition: CameraPosition(
        target: center,
        zoom: zoom,
      ),
    );
  }
}

import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class ClassifyResult extends StatefulWidget {
  final Uint8List imageInBytes;

  ClassifyResult({required this.imageInBytes});

  @override
  _ClassifyResultViewState createState() => _ClassifyResultViewState();
}

class _ClassifyResultViewState extends State<ClassifyResult> {
  int _precisionValue = 3;
  int _likeNumber = 10;
  final ScrollController _firstController = ScrollController();

  Completer<GoogleMapController> _controller = Completer();

  final Set<Marker> _markers = {};

  _markersMaps() {
    _markers.add(
      Marker(
          markerId: MarkerId("AM"),
          position: const LatLng(-4.82386429861951, -63.96572147309308),
          icon: BitmapDescriptor.defaultMarker),
    );
    _markers.add(
      Marker(
          markerId: MarkerId("PA"),
          position: const LatLng(-5.611595873037647, -52.45205026292503),
          icon: BitmapDescriptor.defaultMarker),
    );
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(1.5862395405133518, -60.977440395644884),
    zoom:
        4, // https://developers.google.com/maps/documentation/android-sdk/views
  );

  _precisionBarValue() {
    if (_precisionValue > 7) {
      return StepProgressIndicator(
        totalSteps: 10,
        currentStep: 10,
        size: 20,
        selectedColor: Colors.green,
        unselectedColor: Colors.white,
      );
    } else if (_precisionValue > 5 && _precisionValue <= 7) {
      return StepProgressIndicator(
        totalSteps: 10,
        currentStep: _precisionValue,
        size: 20,
        selectedColor: Colors.yellow,
        unselectedColor: Colors.white,
      );
    } else {
      return StepProgressIndicator(
        totalSteps: 10,
        currentStep: _precisionValue,
        size: 20,
        selectedColor: Colors.red,
        unselectedColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _markersMaps();
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.all(5),
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.memory(
                                widget.imageInBytes,
                                height: 150,
                                //width: 200,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Flexible(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "RESULTADO",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Precisão:",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        _precisionBarValue(),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Número de curtidas: $_likeNumber",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.thumbsUp,
                              color: Colors.white,
                              size: 30,
                            ),
                            FaIcon(
                              FontAwesomeIcons.bookmark,
                              color: Colors.white,
                              size: 30,
                            ),
                            FaIcon(
                              FontAwesomeIcons.exclamationCircle,
                              color: Colors.white,
                              size: 30,
                            ),
                          ],
                        )
                      ],
                    )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: EdgeInsets.all(7),
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.search,
                                color: Colors.green,
                                size: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Descrição:",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 200,
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(5),
                                      child: ListView.builder(
                                          controller: _firstController,
                                          itemCount: 100,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  'Scrollable 1 : >>>>>>>>>>>>>>> >>>>>>>>>>>>>>>>>>>>>>>>>>> >>>>>>>>>>>>>>>>> Index $index'),
                                            );
                                          }),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.all(7),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.mapMarker,
                              color: Colors.green,
                              size: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Encontrada em:",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 500,
                                width: MediaQuery.of(context).size.width,
                                child: GoogleMap(
                                  mapType: MapType.normal,
                                  markers: _markers,
                                  initialCameraPosition: _kGooglePlex,
                                  onMapCreated:
                                      (GoogleMapController controller) {
                                    _controller.complete(controller);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

// ignore_for_file: file_names, depend_on_referenced_packages, avoid_print, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'component_message.dart';
import 'component_information.dart';
import '../../components/errorAlert.dart';
import '../../api/api_getAllData_dynamic.dart';
import '../../variables/global_variable.dart';

class GetLocation extends StatefulWidget {
  const GetLocation({super.key});
  // ignore: library_private_types_in_public_api
  @override
  // ignore: library_private_types_in_public_api
  _GetLocationState createState() => _GetLocationState();
}

class _GetLocationState extends State<GetLocation> {
  double latitude = 0, longitude = 0;
  String message = "", name = "", date = "", location = "";
  TextEditingController codeController = TextEditingController();

  void filteredData() {
    getData().then((data) {
      List<Map<String, dynamic>> filteredData =
          data.where((item) => item['code'] == codeController.text).toList();

      if (filteredData.isEmpty) {
        onAlertButtonPressedError(context, 'Tidak Ditemukan.',
            "${codeController.text} tersebut tidak ada.");
      } else {
        for (var item in filteredData) {
          setState(() {
            latitude = double.parse(item['latitude']);
            longitude = double.parse(item['longitude']);
            date = item['date'].toString();
            name = item['name'].toString();
            message = item['message'].toString();
            location = item['location'].toString();
          });
        }
      }
    }).catchError((error) {
      print('Error: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    if (latitude == 0 || longitude == 0) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(children: [
          _inputCode(context),
          const SizedBox(
            height: 35,
          )
        ]),
      );
    } else {
      if (message == "") {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              _inputCode(context),
              informationBar(context, location, name, date),
              const SizedBox(
                height: 30,
              ),
              _mapsDisplay(context),
              const SizedBox(
                height: 35,
              )
            ],
          ),
        );
      } else {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              _inputCode(context),
              messageBar(context, name, location, message, date),
              const SizedBox(
                height: 30,
              ),
              _mapsDisplay(context),
              const SizedBox(
                height: 35,
              )
            ],
          ),
        );
      }
    }
  }

  Container _mapsDisplay(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      height: 400,
      child: OpenStreetMapSearchAndPick(
          center: LatLong(latitude, longitude),
          buttonColor: Colors.black,
          buttonTextColor: Colors.white,
          locationPinIconColor: Colors.red,
          buttonText: 'Lihat Lokasi Teman',
          onPicked: (pickedData) {
            setState(() {
              latitude = latitude;
              longitude = longitude;
            });
          }),
    );
  }

  Container _inputCode(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 35),
        child: Container(
          decoration: boxContainer,
          padding:
              const EdgeInsets.only(top: 25, right: 30, bottom: 30, left: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Masukkan Kode dari Temanmu.",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: codeController,
                decoration: borderInput('Kode UUID'),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 37,
                child: ElevatedButton(
                    onPressed: () {
                      if (codeController.text == '' ||
                          codeController.text == null) {
                        onAlertButtonPressedError(context, "Kode Kosong",
                            "Kode belum dimasukkan, input kode terlebih dahulu.");
                      } else {
                        filteredData();
                      }
                    },
                    style: customButtonStyle,
                    child: Text(
                      "Authentikasi Kode",
                      style: TextStyle(
                        color: Colors.blue.shade600,
                      ),
                    )),
              ),
            ],
          ),
        ));
  }
}

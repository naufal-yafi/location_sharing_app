import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import '../../variables/global_variable.dart';
import '../../components/errorAlert.dart';
import '../../components/successAlert.dart';
import '../../function/copyClipboard.dart';
import '../../api/api_postData.dart';
import 'component_codeClipboard.dart';

class ShareYourLocation extends StatefulWidget {
  const ShareYourLocation({super.key});
  _ShareYourLocationState createState() => _ShareYourLocationState();
}

class _ShareYourLocationState extends State<ShareYourLocation> {
  String locationaddress = "Belum Ditentukan",
      code = '',
      datetime = '',
      name = '',
      message = '';
  double latitude = -6.8777373, longitude = 109.670932;
  TextEditingController nameController = TextEditingController();
  TextEditingController messsageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (locationaddress == "Belum Ditentukan") {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            SizedBox(
              height: 35,
            ),
            _mapsDisplay(context),
            SizedBox(
              height: 35,
            ),
          ],
        ),
      );
    } else if (code != '' && locationaddress != "Belum Ditentukan") {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            copyCode(context, locationaddress, code),
            SizedBox(
              height: 36,
            ),
            _mapsDisplay(context),
            SizedBox(
              height: 15,
            ),
            _sendLocation(context),
            SizedBox(
              height: 35,
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            SizedBox(
              height: 35,
            ),
            _mapsDisplay(context),
            SizedBox(
              height: 15,
            ),
            _sendLocation(context),
            SizedBox(
              height: 35,
            ),
          ],
        ),
      );
    }
  }

  Container _mapsDisplay(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      height: 400,
      child: OpenStreetMapSearchAndPick(
          center: LatLong(latitude, longitude),
          buttonColor: Colors.black,
          buttonTextColor: Colors.white,
          locationPinIconColor: Colors.red,
          buttonText: 'Tandai Lokasi',
          onPicked: (pickedData) {
            // Navigator.pop(context);
            setState(() {
              locationaddress = pickedData.address;
              latitude = pickedData.latLong.latitude;
              longitude = pickedData.latLong.longitude;

              var now = DateTime.now();
              var formatter = DateFormat('dd-MM-yyyy, HH.mm');
              datetime = formatter.format(now);
            });
          }),
    );
  }

  Container _sendLocation(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 5),
        child: Container(
          decoration: boxContainer,
          padding: EdgeInsets.only(top: 25, right: 30, bottom: 30, left: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Kirim Lokasi yang Ditandai.",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              SizedBox(
                height: 10,
              ),
              Text("${locationaddress}",
                  style: TextStyle(fontSize: 15, color: Colors.black45)),
              SizedBox(
                height: 19,
              ),
              TextFormField(
                controller: nameController,
                decoration: borderInput("nama pengirim"),
              ),
              SizedBox(
                height: 14,
              ),
              TextFormField(
                controller: messsageController,
                decoration: borderInput("pesan singkat"),
              ),
              SizedBox(
                height: 34,
              ),
              ElevatedButton.icon(
                style: customButtonStyle,
                label: Text(
                  "Share",
                  style: TextStyle(
                    color: Colors.blue.shade600,
                  ),
                ),
                icon: Icon(Icons.share, color: Colors.blue.shade600, size: 16),
                onPressed: () {
                  if (locationaddress == "Belum Ditentukan") {
                    onAlertButtonPressedError(
                        context,
                        "Lokasi Belum Ditentukan",
                        "Tentukan lokasi terlebih dahulu.");
                  } else {
                    setState(() {
                      if (nameController.text == '' ||
                          nameController.text == null) {
                        name = 'Anonymous';
                      } else {
                        name = nameController.text;
                      }
                      message = messsageController.text;
                      code = Uuid().v4();
                    });

                    copyToClipboard("${code}");
                    addData(latitude, longitude, code, datetime,
                        locationaddress, name, message);
                    onAlertButtonPressedSuccess(
                        context, "Berhasil Terkirim", "${locationaddress}");
                  }
                },
              ),
            ],
          ),
        ));
  }
}

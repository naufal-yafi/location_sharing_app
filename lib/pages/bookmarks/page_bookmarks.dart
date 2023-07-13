import 'package:flutter/material.dart';
import 'package:locationsharing/pages/bookmarks/component_bar.dart';
import '../../api/api_getAllData.dart';

class DaftarKode extends StatefulWidget {
  const DaftarKode({super.key});
  _DaftarKodeState createState() => _DaftarKodeState();
}

class _DaftarKodeState extends State<DaftarKode> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? ItemList(
                list: snapshot.data,
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}

class ItemList extends StatelessWidget {
  final List? list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list!.length,
      itemBuilder: (context, i) {
        if (list == null || list!.length == 0) {
          return Container(
            padding: EdgeInsets.only(top: 5, left: 3, right: 3),
            child: Center(
              child: Text("Data masih kosong."),
            ),
          );
        } else {
          return bar(context, "${list![i]['code']}", "${list![i]['date']}");
        }
      },
    );
  }
}

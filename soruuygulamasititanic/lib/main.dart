import 'package:flutter/material.dart';

import 'constants.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];
  List<String> sorular = [
    'New york ABD nin baskentidir ',
    'Dunyadaki tavuk sayisi insan sayisindan fazladir',
    'Kelebeklerin omru bir gundur',
    'Kaju fistigi bir mevyenin sapidir',
    'Fatih Sultan Mehmetin en sevdigi yiyecek patatestir'
  ];

  List<bool> yanitlar = [false, true, false, true, false];
  int soruIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                sorular[soruIndex],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.start,
          runSpacing: 5,
          spacing: 5,
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.red[400],
                          child: Icon(
                            Icons.thumb_down,
                            size: 30.0,
                          ),
                          onPressed: () {
                            bool dogruYanit = yanitlar[soruIndex];
                            setState(() {
                              /*  if (dogruYanit == false) {
                                secimler.add(kDogruIconu);
                              } else {
                                secimler.add(kYanlisIconu);
                              }*/
                              dogruYanit == false
                                  ? secimler.add(kDogruIconu)
                                  : secimler.add(kYanlisIconu);
                              soruIndex++;
                              //   secimler.add(kYanlisIconu);
                            });
                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.green[400],
                          child: Icon(Icons.thumb_up, size: 30.0),
                          onPressed: () {

                            setState(() {
                              /*  if (dogruYanit == false) {
                                secimler.add(kDogruIconu);
                              } else {
                                secimler.add(kYanlisIconu);
                              }*/
                              yanitlar[soruIndex] == true
                                  ? secimler.add(kDogruIconu)
                                  : secimler.add(kYanlisIconu);
                              soruIndex++;
                              //   secimler.add(kYanlisIconu);
                            });
                          },
                        ))),
              ])),
        )
      ],
    );
  }
}

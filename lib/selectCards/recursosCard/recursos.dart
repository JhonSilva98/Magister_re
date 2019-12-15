import 'package:flutter/material.dart';

class TelaRecursos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width ,
              decoration: BoxDecoration(
                color: Colors.blue[700]
              ),
            ),
          Center(
            child: Opacity(opacity: 0.1,child: Image.network("http://uges.org.br/wp-content/uploads/2019/04/estudante.png")),
          ),
          Container(
            height: 80,
            child: AppBar(
              elevation: 10,
              backgroundColor: Color(0xff0c3467),
              centerTitle: true,
              automaticallyImplyLeading: true,
              title: Text("Recursos",
              style: TextStyle(
                fontSize: 40,
                fontFamily: "fontInstagram"
              ),
              ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                  ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                      icons("WIFI", Icons.wifi),
                      icons("Avalie o Magister", Icons.mobile_screen_share)
                ],
              ),
            ],
          )
            ],
      ),
    );
  }
}

Widget icons (String texto, var icone){
  return Container(
    height: 120,
    width: 170,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.white
      ),
      color: Color(0xff389ee6),
      borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Colors.blue,
          Colors.blue[300],
        ],
        stops: [0.4,1]
      )
    ),
  child: Stack(
    children: <Widget>[
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Material(
              type: MaterialType.transparency,
              child: Text("$texto",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              )),
          ],
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Opacity(opacity: 0.4,child: Icon(icone, size: 80, color: Colors.white,)),
            ],
          ),
        ],
      )
    ],
  ),
  );
}
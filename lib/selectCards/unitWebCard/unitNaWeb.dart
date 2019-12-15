import 'package:flutter/material.dart';
import 'package:magister_re/selectCards/unitWebCard/openwebpage.dart';
import 'package:url_launcher/url_launcher.dart' as url;
class CardWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    tags("Unit Notícias", WebViewWebPage(), cor1: Color(0xff183883),cor2: Color(0xff255ba6), gerar: Row(children: <Widget>[Text("Unit Notícias",style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),), Icon(Icons.fiber_new, size: 80, color: Colors.white,)],), context: context),
                    tags("facebook", "https://pt-br.facebook.com/Unit.br/",font: "fontFacebook", cor1: Color(0xff0065e0),cor2: Color(0xff18acfe)),
                    tags("instagram","https://www.instagram.com/unit_br/?hl=pt-br",font: "fontInstagram"),
                    tags("", "https://www.youtube.com/channel/UC6JkyQiDmEx8n4ChXuOC25Q", cor1: Color(0xffb40f0f),cor2: Color(0xffea0303), gerar: Image.asset("youtube.png",height: 80,),),
                  ],
                )
              )
            ),
          ),
          Container(
            height: 80,
            child: AppBar(
              backgroundColor: Color(0xff0c3467),
              centerTitle: true,
              automaticallyImplyLeading: true,
              title: Text("Unit na Web",
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
        ],
      ),
    );
  }
}

Widget tags(String texto, dynamic abrirPag,{String font,Color cor1, Color cor2, Widget gerar, BuildContext context}){
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: texto== "instagram"? [
            Color(0xfffcad50),
            Color(0xffea634f),
            Color(0xffc94173),
            Color(0xff9c33a9),
            Color(0xff4c68d6),
          ]:[cor1,cor2],
          begin: texto== "instagram"? Alignment.bottomLeft : Alignment.centerLeft,
          end: texto== "instagram"? Alignment.topRight : Alignment.centerRight,
          stops:texto== "instagram"? [0.1,0.4,0.6,0.8,1] : [0.4,1]
        )
      ),
      child: Stack(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(child: Stack(
            children: <Widget>[
              Opacity(opacity: 0.7, child: texto=="facebook" || texto=="instagram"? Text("$texto",
              style: TextStyle(
                fontSize: 75,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: texto=="facebook" || texto=="instagram"? "$font" : ""
              ),
              ): gerar
              ),
            ],
          ),),
            ],
          ),
          SizedBox.expand(
            child: FlatButton(
              onPressed: (){
                texto=="Unit Notícias"?
                Navigator.of(context).push(
                  MaterialPageRoute<Null>(builder: (BuildContext context) {
                return abrirPag;
              })) : url.launch(abrirPag);
              },
            ),
          )
        ],
      ),
    ),
  );
}
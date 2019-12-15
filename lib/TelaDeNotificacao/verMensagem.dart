import 'package:flutter/material.dart';

class Tela_notificacao extends StatefulWidget {
  final Color cor1;
  final Color cor2;
  final String texto;
  final String professor;
  final dynamic iconatt;
  final String fotoProf;

  const Tela_notificacao({Key key, this.cor1, this.cor2, this.texto, this.professor, this.iconatt, this.fotoProf}) : super(key: key);
  
  @override
  _Tela_notificacaoState createState() => _Tela_notificacaoState();
}

class _Tela_notificacaoState extends State<Tela_notificacao> {
  var now = new DateTime.now();
  List <bool> corAvaliarAtivar=[false,false,false,false,false];
  void corAvaliacao(int i){
    setState(() {
      switch (i) {
        case 0:
        corAvaliarAtivar[0] = true;
        corAvaliarAtivar[1] = false;
        corAvaliarAtivar[2] = false;
        corAvaliarAtivar[3] = false;
        corAvaliarAtivar[4] = false;
          break;
        case 1:
        corAvaliarAtivar[0] = true;
        corAvaliarAtivar[1] = true;
        corAvaliarAtivar[2] = false;
        corAvaliarAtivar[3] = false;
        corAvaliarAtivar[4] = false;
          break;
        case 2:
        corAvaliarAtivar[0] = true;
        corAvaliarAtivar[1] = true;
        corAvaliarAtivar[2] = true;
        corAvaliarAtivar[3] = false;
        corAvaliarAtivar[4] = false;
          break;
        case 3:
        corAvaliarAtivar[0] = true;
        corAvaliarAtivar[1] = true;
        corAvaliarAtivar[2] = true;
        corAvaliarAtivar[3] = true;
        corAvaliarAtivar[4] = false;
          break;
        case 4:
        corAvaliarAtivar[0] = true;
        corAvaliarAtivar[1] = true;
        corAvaliarAtivar[2] = true;
        corAvaliarAtivar[3] = true;
        corAvaliarAtivar[4] = true;
          break;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Color(0xff0c3467),
        centerTitle: true,
        title: Text('Avaliação',
          style: TextStyle(
          fontSize: 40,
          fontFamily: "fontInstagram"
        ),
        ),
      ),*/
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      widget.cor1,
                      widget.cor2,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.5,1]
                  )
                ),
              child: Center(
                child: Stack(
                  children: <Widget>[
                    Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      cardsMensagens(widget.fotoProf, widget.professor, widget.iconatt, widget.texto)
                    ],
                  ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 80,
            child: AppBar(
              backgroundColor: Color(0xff0c3467),
              centerTitle: true,
              automaticallyImplyLeading: true,
              title: Text("Atividades",
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
  Widget cardsMensagens (String fotoProf, String nomeProf, var iconNotificacao, String texto){
      return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 25.0,
          child: Container(
            height: MediaQuery.of(context).size.height - 140,
            width: MediaQuery.of(context).size.width - 40,
            child: Container(
              margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
              child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset(
              fotoProf,
              width: 70.0,
              height: 70.0,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Text(nomeProf,
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w700,)),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(icon: Icon(corAvaliarAtivar[0]== false? Icons.star_border : Icons.star), iconSize: 40, color: Colors.yellow, splashColor: Colors.yellow, onPressed: (){corAvaliacao(0);},),
                        IconButton(icon: Icon(corAvaliarAtivar[1]== false? Icons.star_border : Icons.star), iconSize: 40, color: Colors.yellow, splashColor: Colors.yellow, onPressed: (){corAvaliacao(1);},),
                        IconButton(icon: Icon(corAvaliarAtivar[2]== false? Icons.star_border : Icons.star), iconSize: 40, color: Colors.yellow, splashColor: Colors.yellow, onPressed: (){corAvaliacao(2);},),
                        IconButton(icon: Icon(corAvaliarAtivar[3]== false? Icons.star_border : Icons.star), iconSize: 40, color: Colors.yellow, splashColor: Colors.yellow, onPressed: (){corAvaliacao(3);},),
                        IconButton(icon: Icon(corAvaliarAtivar[4]== false? Icons.star_border : Icons.star), iconSize: 40, color: Colors.yellow, splashColor: Colors.yellow, onPressed: (){corAvaliacao(4);},),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue
                  ),
                  width: 70,
                  height: 1.0,
                ),
                Container(
                  child: OutlineButton(
                    borderSide: BorderSide(color: Colors.blue),
                    onPressed: () => null,
                    shape: StadiumBorder(),
                    child: SizedBox(
                      width: 60.0,
                      height: 45.0,
                      child: Center(
                          child: Icon(iconNotificacao,
                          color: Colors.blue,
                          )
                              ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue
                  ),
                  width: 70,
                  height: 1.0,
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width - 50,
              height: MediaQuery.of(context).size.width /2 ,
              child: ListView(
                children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(texto,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                        ),
                      )
                    ],
                  ),
            )
          ],
        ) ,
            ),
          ),
        );
    }
}

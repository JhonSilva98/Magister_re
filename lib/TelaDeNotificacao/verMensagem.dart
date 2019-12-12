import 'package:flutter/material.dart';

class Tela_notificacao extends StatefulWidget {
  final Color cor1;
  final Color cor2;
  final String texto;
  final String professor;

  const Tela_notificacao({Key key, this.cor1, this.cor2, this.texto, this.professor}) : super(key: key);
  
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
      appBar: AppBar(
        backgroundColor: Color(0xff0c3467),
        centerTitle: true,
        title: Text('Avaliação',
          style: TextStyle(
          fontSize: 40,
          fontFamily: "fontInstagram"
        ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue
            ),
            gradient: LinearGradient(
              colors: [
                widget.cor1,
                widget.cor2,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.3,1]
            )
          ),
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: <Widget>[
            Text("${widget.professor}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Colors.black,
                      offset: Offset(5.0, 1.0),
                    ),
                    Shadow(
                      color: Colors.black,
                      blurRadius: 5.0,
                      offset: Offset(5.0, 3.0),
                    ),
                  ],
                ),
                ),
            Column(
              children: <Widget>[
                Divider(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    IconButton(icon: Icon(corAvaliarAtivar[0]== false? Icons.star_border : Icons.star), iconSize: 40, color: Colors.yellow, splashColor: Colors.yellow, onPressed: (){corAvaliacao(0);},),
                    IconButton(icon: Icon(corAvaliarAtivar[1]== false? Icons.star_border : Icons.star), iconSize: 40, color: Colors.yellow, splashColor: Colors.yellow, onPressed: (){corAvaliacao(1);},),
                    IconButton(icon: Icon(corAvaliarAtivar[2]== false? Icons.star_border : Icons.star), iconSize: 40, color: Colors.yellow, splashColor: Colors.yellow, onPressed: (){corAvaliacao(2);},),
                    IconButton(icon: Icon(corAvaliarAtivar[3]== false? Icons.star_border : Icons.star), iconSize: 40, color: Colors.yellow, splashColor: Colors.yellow, onPressed: (){corAvaliacao(3);},),
                    IconButton(icon: Icon(corAvaliarAtivar[4]== false? Icons.star_border : Icons.star), iconSize: 40, color: Colors.yellow, splashColor: Colors.yellow, onPressed: (){corAvaliacao(4);},),
                    
                  ],
                ),
                Divider(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.black.withAlpha(70), offset: const Offset(3.0, 10.0), blurRadius: 15.0)],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.elliptical(20, 20))
                  ),
                  child: ListView(
                    children: <Widget>[
                      Text("$now"),
                      Divider(
                        height: 10,
                      ),
                      Text("${widget.texto}",
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                      ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
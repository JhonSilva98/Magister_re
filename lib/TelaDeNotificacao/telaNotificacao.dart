import 'package:flutter/material.dart';
import 'package:magister_re/TelaDeNotificacao/verMensagem.dart';


class Tela_Notificacao extends StatefulWidget {
  @override
  _Tela_NotificacaoState createState() => _Tela_NotificacaoState();
}

class _Tela_NotificacaoState extends State<Tela_Notificacao> {
  int _key = 1;
  bool vTodos = true;
  bool vAva = true;
  bool vAviso = true;
  bool vNotifica = true;
  String gerarText = "Lorem ipsum dolor sit amet consectetur adipiscing elit porttitor senectus, tellus interdum tincidunt proin mauris maximus libero non torquent duis, accumsan facilisis elementum cras ad suspendisse iaculis habitant. Iaculis class vehicula maecenas porta senectus hendrerit proin varius sodales in dui urna primis, massa praesent ex hac dignissim facilisi lectus ad neque conubia cursus. Semper duis phasellus tempus erat odio ac pellentesque, tellus feugiat tortor luctus congue elementum consequat, mi";
  var now = new DateTime.now();
  void comandDrawer(int aut){
    setState(() {
      switch (aut) {
        case 1 :
          vTodos = true;
          vAva = true;
          vAviso = true;
          vNotifica = true;
          break;
        case 2:
          vTodos = false;
          vAva = true;
          vAviso = false;
          vNotifica = false;
          break;
        case 3:
          vTodos = false;
          vAva = false;
          vAviso = true;
          vNotifica = false;
          break;
        case 4:
          vTodos = false;
          vAva = false;
          vAviso = false;
          vNotifica = true;
          break;
        case 5:
          vTodos = false;
          vAva = false;
          vAviso = false;
          vNotifica = false;
          break;
        
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
              appBar: AppBar(
                      elevation: 10,
                      backgroundColor: Color(0xff0c3467),
                      centerTitle: true,
                      automaticallyImplyLeading: true,
                      title: Text("Notificações",
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
              body: Stack(
                children: <Widget>[
                   Center(
                     child: Opacity(
                       opacity: 0.30,
                       child: Image.asset("sino.png",
                        height: 200,
                        width: 200,
                       ),
                     ),
                   ),
                  ListView(
                    children: <Widget>[
                          SizedBox(
                              height: 20,
                          ),
                          card(Icons.all_inclusive,"avatar1.png",
                              "Professor Chavier!", Color(0xFFFD8183), Color(0xFFFB425A), vTodos,  0, Tela_notificacao(cor1: Color(0xFFFD8183), cor2: Color(0xFFFB425A), texto: gerarText, professor: "Professor Chavier", iconatt: Icons.all_inclusive, fotoProf: "avatar1.png",)),
                          card(Icons.assignment_turned_in,"avatar2.png",
                              "Professor Carlos!", Color(0xFFF8C08E), Color(0xFFFDA65B), vAva, 1, Tela_notificacao(cor1: Color(0xFFF8C08E), cor2: Color(0xFFFDA65B),texto: gerarText,professor: "Professor Carlos",iconatt: Icons.assignment_turned_in, fotoProf: "avatar2.png",)),
                          card(Icons.error_outline,"avatar3.png",
                              "Professor Jonas!", Color(0xFFFBD3E9), Color(0xFFBB377D), vAviso, 2,Tela_notificacao(cor1: Color(0xFFFBD3E9),cor2: Color(0xFFBB377D),texto: gerarText,professor: "Professor Jonas",iconatt: Icons.error_outline, fotoProf: "avatar3.png",)),
                          card(Icons.notifications_active,"avatar4.png",
                              "Professora Maria!", Color(0xff31a7f6), Color(0xff1ff4b4), vNotifica, 3,Tela_notificacao(cor1: Color(0xff31a7f6), cor2: Color(0xff1ff4b4),texto: gerarText,professor: "Professora Maria",iconatt: Icons.notifications_active, fotoProf: "avatar4.png",)),
                        ],
                    ),
                ],
              ),
              drawer: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle
                ),
                alignment: Alignment.topCenter,
                height: MediaQuery.of(context).size.height,
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    gerarGesture(Icons.all_inclusive, 1,1),
                    gerarGesture(Icons.assignment_turned_in, 2,2),
                    gerarGesture(Icons.error_outline, 3,3),
                    gerarGesture(Icons.notifications_active, 4,4),
                  ],
                ),
              ),
            );
  }
  Widget gerarGesture(var icone, int key, int aut){
  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        padding: const EdgeInsets.only(bottom: 8),
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: _key == key ? Colors.blue: Colors.white, width: 2
            ), 
        ),
        child: Column(
          children: <Widget>[
            IconButton(
          onPressed: (){
            setState(() {
              _key = key;
              comandDrawer(aut);
            });
          },
          icon: Padding(
            padding: const EdgeInsets.only(top: 2.7),
            child: Icon(icone),
          ),
          iconSize:  _key == key ? 60 : 40,
          color: _key == key ? Colors.blue: Colors.white,
        ),
          ],
        ) ,
      ),
    ],
  );
}
  Widget card (var icon,String avatar, String titulo, Color cor1, Color cor2, bool visu, int pos, var pagNot){
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Center(
      child: Visibility(
        visible: visu,
        child: Container(
          height: 180,
          width:  330,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
            border: Border.all(
              color: Colors.blue
            ),
            gradient: LinearGradient(
              colors: [
                cor1,
                cor2
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            )
          ),
          child: Stack(
            children: <Widget>[
              Opacity(
                opacity: 0.20,
                child: Image.asset("desingCard.png",
                  fit: BoxFit.fitWidth,
                  height: 300,
                  width: 300,
                  ),
              ),
              ListTile(
                leading: Image.asset(avatar),
                title: Text(titulo,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
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
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                ),
                ),
                subtitle: Text(gerarText,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Colors.black,
                      offset: Offset(2.0, 1.0),
                    ),
                    Shadow(
                      color: Colors.black,
                      blurRadius: 5.0,
                      offset: Offset(2.0, 1.0),
                    ),
                  ],
                ),
                ),
              ),
              /*SizedBox.expand(
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => pagNot));
                  },
                  ),
              ),*/
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white
                            ),
                            width: 70,
                            height: 1.0,
                          ),
                          Container(
                            child: OutlineButton(
                              splashColor: cor2,
                              borderSide: BorderSide(color: Colors.white),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => pagNot));
                              },
                              shape: StadiumBorder(),
                              child: SizedBox(
                                width: 60.0,
                                height: 45.0,
                                child: Center(
                                    child: Icon(icon,
                                    color: Colors.white,
                                    )
                                        ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white
                            ),
                            width: 70,
                            height: 1.0,
                          ),
                        ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
}
import 'package:flutter/material.dart';

class TelaRecursos extends StatefulWidget {
  @override
  _TelaRecursosState createState() => _TelaRecursosState();
}

class _TelaRecursosState extends State<TelaRecursos> {
  PageController pageController;
  List<dynamic> listaCor =[
    [Color(0xFFFD8183), Color(0xFFFB425A)],
    [Color(0xFFF8C08E), Color(0xFFFDA65B)],
    [Color(0xFF6CD8F0), Color(0xFF6AD89D)],
    [Color(0xFFEE0979), Color(0xFFFF6A00)],
    [Color(0xFFFBD3E9), Color(0xFFBB377D)],
  ];
  Color back1 = Color(0xFFFD8183);
  Color back2 = Color(0xFFFB425A);
  
  @override
  void initState() {
    // TODO: implement initState
    pageController = PageController(initialPage: 0, viewportFraction: 0.8);
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width ,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [back1, back2]
                )
              ),
            ),
          PageView(
              scrollDirection: Axis.horizontal,
              controller: pageController,
              onPageChanged: (index){
                setState(() {
                  switch (index) {
                  case 0:
                    back1 = listaCor[0][0];
                    back2 = listaCor[0][1];
                    break;
                  case 1:
                    back1 = listaCor[1][0];
                    back2 = listaCor[1][1];
                    break;
                  case 2:
                    back1 = listaCor[2][0];
                    back2 = listaCor[2][1];
                    break;  
                }
                });
              },
              children: <Widget>[
                cardsMensagens( "Wifi", Icons.wifi, "Acesso ao Wifi Unit - Universidade Tiradentes", listaCor[0][1]),
                cardsMensagens("Avaliar o Magister", Icons.mobile_screen_share, "Avalie o Aplicativo Magister", listaCor[1][1]),
                cardsMensagens("Biblioteca", Icons.book, "Avalie sua Biblioteca", listaCor[2][1])
              ],
            ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    bootomNav(Icons.wifi,listaCor[0][1], 0,"btn1"),
                    bootomNav(Icons.mobile_screen_share, listaCor[1][1],1,"btn2"),
                    bootomNav(Icons.book, listaCor[2][1],2,"btn3")
                  ],
                ),
              ),
            ],
          ) ,
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
        ],
      ),
    );
  }

  Widget cardsMensagens ( String nomeWidget, var iconNotificacao, String texto , Color cor){
      return Center(
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 25.0,
            child: Container(
              height: MediaQuery.of(context).size.height - 250,
              width: MediaQuery.of(context).size.width,
              child: Container(
                margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: cor,
                      child: Icon(iconNotificacao, size: 50, color: Colors.white,),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text(nomeWidget,
                              style: TextStyle(
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "fontInstagram",
                                  color: cor
                                  )),
                        ],
                        ),
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
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: cor
                          ),
                          width: 70,
                          height: 1.0,
                        ),
                        Container(
                          child: OutlineButton(
                            splashColor: cor,
                            borderSide: BorderSide(color: cor),
                            onPressed: () => null,
                            shape: StadiumBorder(),
                            child: SizedBox(
                              width: 60.0,
                              height: 45.0,
                              child: Center(
                                  child: Icon(iconNotificacao,
                                  color: cor,
                                  )
                                      ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: cor
                          ),
                          width: 70,
                          height: 1.0,
                        ),
                      ],
                    ),
                  ],
                ) ,
              ),
            ),
          ),
      );
    } 
  Widget bootomNav (var icone, Color cor, int index,String hero){
    return FloatingActionButton(
      heroTag: hero,
      onPressed: (){
        setState(() {
          pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.linear
            );
        });
      },
      elevation: 10,
      backgroundColor: cor,
      child: Icon(icone, size: 40,),
    );
  }
}
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:magister_re/TelaDeNotificacao/telaNotificacao.dart';
import 'package:magister_re/selectCards/recursosCard/recursos.dart';
import 'package:magister_re/selectCards/unitWebCard/unitNaWeb.dart';


class Magister extends StatefulWidget {
  @override
  _MagisterState createState() => _MagisterState();
}

class _MagisterState extends State<Magister> {
  int bottomSelectedIndex = 0;
  var pageController;
  PageController pageController2;
  int _curIndex2 = 0;
 
  
  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }
  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController2.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }
  void initState() {
    // TODO: implement initState
    pageController = PageController(initialPage: 0, viewportFraction: 0.8);
    pageController2 = PageController(initialPage: 0);

    super.initState();
  }
  void dispose() {
    pageController2.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xff0c3467),
        child: PageView(
          onPageChanged: (index) {
            setState(() {
              _curIndex2 = index;
            });
          },
          scrollDirection: Axis.horizontal,
          controller: pageController2,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Text("Magister",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontFamily: "fontInstagram"
                      ),
                      ),
                    )),
                  ],
                ),                
                Padding(
                  padding: const EdgeInsets.only(top: 40, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        height: 75,
                        width: 65,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: CircleAvatar(child: Image.asset("avatar2.png"),),
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 80.0),
                      child: Center(
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white
                            ),
                            borderRadius: BorderRadius.circular(100)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image.asset(
                              "simbolo.png",
                              height: 100,
                              width: 100,
                              ),
                          ),
                        )),
                    ),
                    SizedBox(
                      height: 75,
                    ),                   
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: PageView(
                          scrollDirection: Axis.horizontal,
                          controller: pageController,
                          children: <Widget>[
                            corpo(Icons.school,  "Acadêmico"),
                            corpo(Icons.rate_review, "Recursos", executarCard: TelaRecursos()),
                            corpo(Icons.tv, "Unit na Web", executarCard: CardWeb()),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                  ],
                ),
              ],
            ),
            Tela_Notificacao()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _curIndex2,
        onItemSelected: (index) {
          setState(() => _curIndex2 = index);
          pageController2.jumpToPage(index);
        },
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text('Inicial'),
            icon: Icon(Icons.home)
          ),
          BottomNavyBarItem(
            title: Text('Notificações'),
            icon: Icon(Icons.notifications)
          ),
        ],
      ),
    );
  }
  Widget corpo(dynamic icone, String texto, {var executarCard}){
    return Center(
        child: Container(
                height: 350,
                width: 260,
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.black.withAlpha(70), offset: const Offset(3.0, 10.0), blurRadius: 15.0)],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
                  border: Border.all(
                    width: 2,
                    color: Colors.black
                  )
                ),
                child: FlatButton(
                  splashColor: Color(0xff0c3467),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => executarCard));
                  },
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            width: 300,
                            height: 60,
                            decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.all(Radius.elliptical(20, 20))
                          ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Center(
                            child: Icon(icone, color: Color(0xff0c3467), size: 150,),
                          ),
                      ),
                      Stack(
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text("$texto",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 35,
                                        color: Color(0xff0c3467)
                                        ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
        ),
      );
  }
}
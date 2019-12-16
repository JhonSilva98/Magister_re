import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:magister_re/TelaDeNotificacao/telaNotificacao.dart';
import 'package:magister_re/selectCards/academico/academico.dart';
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
    pageController2 = PageController(initialPage: 0,);

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
                    SizedBox(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: PageView(
                          scrollDirection: Axis.horizontal,
                          controller: pageController,
                          children: <Widget>[
                            cards("Acadêmico", Icons.school, executar: Academico()),
                            cards("Recursos", Icons.rate_review, executar: TelaRecursos()),
                            cards("Unit na Web", Icons.tv, executar: CardWeb()),
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
  Widget cards ( String nomeWidget, var iconNotificacao, {var executar}){
      return Center(
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 25.0,
            child: Container(
              height: MediaQuery.of(context).size.height - 400,
              width: MediaQuery.of(context).size.width - 100,
              child: Container(
                margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Color(0xff0c3467),
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
                                  color: Color(0xff0c3467)
                                  )),
                        ],
                        ),
                ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xff0c3467)
                          ),
                          width: 70,
                          height: 1.0,
                        ),
                        Container(
                          child: OutlineButton(
                            splashColor: Color(0xff0c3467),
                            borderSide: BorderSide(color: Color(0xff0c3467)),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => executar));
                            },
                            shape: StadiumBorder(),
                            child: SizedBox(
                              width: 60.0,
                              height: 45.0,
                              child: Center(
                                  child: Icon(iconNotificacao,
                                  color: Color(0xff0c3467),
                                  )
                                      ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xff0c3467)
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

}
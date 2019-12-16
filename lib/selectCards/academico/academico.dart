import 'package:flutter/material.dart';

class Academico extends StatefulWidget {
  @override
  _Academico createState() => _Academico();
}

class _Academico extends State<Academico> {
  PageController pageController;
  PageController pageController2;
  List<dynamic> listaCor =[
    [Color(0xFFFD8183), Color(0xFFFB425A)],
    [Color(0xFFF8C08E), Color(0xFFFDA65B)],
    [Color(0xFF6CD8F0), Color(0xFF6AD89D)],
    [Color(0xFFEE0979), Color(0xFFFF6A00)],
    [Color(0xFFFBD3E9), Color(0xFFBB377D)],
    [Color(0xffef79cc), Color(0xff917ff1)],
    [Color(0xff53c5f5), Color(0xff4560b2)],
    [Color(0xfffacf78), Color(0xfffb7e72)],
    [Color(0xff31a7f6), Color(0xff1ff4b4)],
    [Color(0xffef8754), Color(0xff912222)]

  ];
  Color back1 = Color(0xFFFD8183);
  Color back2 = Color(0xFFFB425A);
  
  @override
  void initState() {
    // TODO: implement initState
    pageController = PageController(initialPage: 0, viewportFraction: 0.8);
    pageController2 = PageController(initialPage: 0);
    
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
                    pageController2.animateToPage(
                      0,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear
                    );
                    break;
                  case 1:
                    back1 = listaCor[1][0];
                    back2 = listaCor[1][1];
                    pageController2.animateToPage(
                      0,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear
                    );
                    break;
                  case 2:
                    back1 = listaCor[2][0];
                    back2 = listaCor[2][1];
                    pageController2.animateToPage(
                      0,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear
                    );
                    break;
                  case 3:
                    back1 = listaCor[3][0];
                    back2 = listaCor[3][1];
                    pageController2.animateToPage(
                      0,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear
                    );
                    break;
                  case 4:
                    back1 = listaCor[4][0];
                    back2 = listaCor[4][1];
                    pageController2.animateToPage(
                      0,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear
                    );
                    break;
                  case 5:
                    back1 = listaCor[5][0];
                    back2 = listaCor[5][1];
                    pageController2.animateToPage(
                      1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear
                    );
                    break;
                  case 6:
                    back1 = listaCor[6][0];
                    back2 = listaCor[6][1];
                    pageController2.animateToPage(
                      1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear
                    );
                    break;
                  case 7:
                    back1 = listaCor[7][0];
                    back2 = listaCor[7][1];
                    pageController2.animateToPage(
                      1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear
                    );
                    break;
                  case 8:
                    back1 = listaCor[8][0];
                    back2 = listaCor[8][1];
                    pageController2.animateToPage(
                      1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear
                    );
                    break;
                  case 9:
                    back1 = listaCor[9][0];
                    back2 = listaCor[9][1];
                    pageController2.animateToPage(
                      1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear
                    );
                    break;
                }
                });
              },
              children: <Widget>[
                cardsMensagens( "Horários", Icons.schedule, "Veja aqui seu Horário de aula", listaCor[0][1]),
                cardsMensagens("Calendário", Icons.calendar_today, "Veja seu calendário do ano letivo", listaCor[1][1]),
                cardsMensagens("Matricula", Icons.monetization_on, "Veja se sua matricula foi processada", listaCor[2][1]),
                cardsMensagens("Notas e faltas", Icons.assignment_turned_in, "Suas notas do bimestre", listaCor[3][1]),
                cardsMensagens("Pagamentos", Icons.attach_money, "Imprima seus boletos mensais", listaCor[4][1]),
                cardsMensagens("Calcule sua média", Icons.receipt, "Faça as contas de sua média", listaCor[5][1]),
                cardsMensagens("Biblioteca", Icons.local_library, "Veja todos nossos livros do banco", listaCor[6][1]),
                cardsMensagens("Protocolos", Icons.chrome_reader_mode, "Abra sua ocorrência", listaCor[7][1]),
                cardsMensagens("Pendências", Icons.pie_chart_outlined, "Veja se você tem alguma pendência", listaCor[8][1]),
                cardsMensagens("Material de aula", Icons.category, "Quais materiais de aula", listaCor[9][1]),                
              ],
            ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 80,
                child: PageView(
                  controller: pageController2,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          bootomNav(Icons.schedule,listaCor[0][1], 0, "btn0"),
                          bootomNav(Icons.calendar_today, listaCor[1][1],1, "btn1"),
                          bootomNav(Icons.monetization_on, listaCor[2][1],2, "btn2"),
                          bootomNav(Icons.assignment_turned_in,listaCor[3][1], 3, "btn3"),
                          bootomNav(Icons.attach_money, listaCor[4][1],4, "btn4"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          bootomNav(Icons.receipt,listaCor[5][1], 5, "btn5"),
                          bootomNav(Icons.local_library, listaCor[6][1],6, "btn6"),
                          bootomNav(Icons.chrome_reader_mode, listaCor[7][1],7, "btn7"),
                          bootomNav(Icons.pie_chart_outlined,listaCor[8][1], 8, "btn8"),
                          bootomNav(Icons.category, listaCor[9][1],9, "btn9"),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            height: 80,
            child: AppBar(
              elevation: 10,
              backgroundColor: Color(0xff0c3467),
              centerTitle: true,
              automaticallyImplyLeading: true,
              title: Text("Acadêmico",
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
      child: Icon(icone, size: 35,),
    );
  }
}
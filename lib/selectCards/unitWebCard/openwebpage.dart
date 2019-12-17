import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart' as url;

class WebViewWebPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Color(0xff0c3467),
        centerTitle: true,
        title: Text('Unit Notícias',
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
      body: WebView(
        initialUrl: "https://portal.unit.br/blog/categoria/noticias/",
      ),
    );
  }
}
void abrir(){
  url.launch("https://www.google.com.br/");
}
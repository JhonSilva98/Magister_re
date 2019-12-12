import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
//import 'package:url_launcher/url_launcher.dart';

class WebViewWebPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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

/*launchURL() async {
  const url = 'https://flutter.dev';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}*/
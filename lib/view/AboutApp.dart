import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutApp extends StatefulWidget {
  @override
  _AboutAppViewState createState() => _AboutAppViewState();
}

class _AboutAppViewState extends State<AboutApp> {
  static const String _url = 'https://prismrr.github.io';

  void _launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  _sendEmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'prismufrr@gmail.com',
      //queryParameters: {'subject':"QPlant App Contato",'body':"Gostaria de falar sobre:"},
    );
    String url = params.toString();
    print(">>>>>>>>>>>");
    print(url);
    if (!await launch(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(7),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Card(
              child: Padding(
                  padding: EdgeInsets.all(7),
                  child: Column(
                    children: [
                      Text(
                        "Desenvolvido por:",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          "assets/images/logo_prism.ai.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.envira,
                          color: Colors.green,
                          size: 40,
                        ),
                        Text(
                          "QPlant App",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      ],
                    ),
                    Text(
                      "Este aplicativo visa a classificação de plantas via imagens, adotando técnicas de aprendizagem de máquina e visão computacional.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              elevation: 2,
              child: SizedBox(
                height: 150,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(7),
                      child: GestureDetector(
                        onTap: () {
                          _sendEmail();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.mailBulk,
                              color: Colors.green,
                              size: 50,
                            ),
                            Text(
                              "prismufrr@gmail.com",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(7),
                      child: GestureDetector(
                        onTap: () {
                          _launchURL();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.sitemap,
                              color: Colors.green,
                              size: 50,
                            ),
                            Text(
                              "https://prismrr.github.io",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

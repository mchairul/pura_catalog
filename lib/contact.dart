import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContentContact extends StatefulWidget {
  const ContentContact({super.key});

  @override
  State<ContentContact> createState() => _ContentContact();
}

class _ContentContact extends State<ContentContact>
{
  late final WebViewController controller;
  int _rating = 0;

  void _setRatingAsOne() {
    setState(() {
      _rating = 1;
    });
  }

  void _setRatingAsTwo() {
    setState(() {
      _rating = 2;
    });
  }

  void _setRatingAsThree() {
    setState(() {
      _rating = 3;
    });
  }

  void _setRatingAsFour() {
    setState(() {
      _rating = 4;
    });
  }

  void _setRatingAsFive() {
    setState(() {
      _rating = 5;
    });
  }

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadHtmlString('''
      <html lang="en">
      <style>html,body{pointer-events: none;}</style>
      <body>
      <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15864.365000824862!2d106.8431481!3d-6.2517066!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e69f3b6971fc2db%3A0x1b6c815b6e5fb9df!2sGraha%20Pura!5e0!3m2!1sen!2sid!4v1684528603418!5m2!1sen!2sid" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
      </body>
      </html>
''');
  }

  @override
  Widget build(BuildContext context) {
    double size = 20;
    return Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Text("Jakarta",
                style: TextStyle(
                    color: Colors.deepPurple,fontSize: 28
                ),
              ),
            ),
            const Text(
                "Representative Office",
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 20
                )
            ),
            const Text(
              "Graha PuraJl. Pancoran Indah I No. 52Jakarta Selatan 12780, Indonesia",
              textAlign: TextAlign.center,
            ),
            Container(
              height: 120,
              child: WebViewWidget(
                controller: controller,
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(0),
                    child: IconButton(
                      icon: (_rating >= 1
                          ? Icon(Icons.stars)
                          : Icon(
                        Icons.star_border,
                        size: size,
                      )
                      ),
                      color: Colors.red,
                      onPressed: _setRatingAsOne,
                      iconSize: size,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(0),
                    child: IconButton(
                      icon: (_rating >= 2
                          ? Icon(Icons.stars)
                          : Icon(
                        Icons.star_border,
                        size: size,
                      )
                      ),
                      color: Colors.red,
                      onPressed: _setRatingAsTwo,
                      iconSize: size,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(0),
                    child: IconButton(
                      icon: (_rating >= 3
                          ? Icon(Icons.stars)
                          : Icon(
                        Icons.star_border,
                        size: size,
                      )
                      ),
                      color: Colors.red,
                      onPressed: _setRatingAsThree,
                      iconSize: size,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(0),
                    child: IconButton(
                      icon: (_rating >= 4
                          ? Icon(Icons.stars)
                          : Icon(
                        Icons.star_border,
                        size: size,
                      )
                      ),
                      color: Colors.red,
                      onPressed: _setRatingAsFour,
                      iconSize: size,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(0),
                    child: IconButton(
                      icon: (_rating >= 5
                          ? Icon(Icons.stars)
                          : Icon(
                        Icons.star_border,
                        size: size,
                      )
                      ),
                      color: Colors.red,
                      onPressed: _setRatingAsFive,
                      iconSize: size,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Terima Kasih'),
                    content: Text('Atas Bintang ' + _rating.toString() + ' nya'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
                child: const Text('Rate Us!'),
              ),
            )
          ],
        ),
    );
  }
}

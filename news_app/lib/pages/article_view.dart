import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String blogUrl;
  const ArticleView({required this.blogUrl, Key? key}) : super(key: key);

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.blogUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Buzz",
              style: TextStyle(
                color: Color(0xff3280ef),
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Line",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class ArticleView extends StatefulWidget {
//   String blogUrl;
//   ArticleView({required this.blogUrl});

//   @override
//   State<ArticleView> createState() => _ArticleViewState();
// }

// class _ArticleViewState extends State<ArticleView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Buzz",
//               style: TextStyle(
//                 color: Color(0xff3280ef),
//                 fontSize: 30.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               "Line",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 30.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//         centerTitle: true,
//         elevation: 0.0,
//       ),
//       body: Container(
//         child: WebView(
//           initialUrl: widget.blogUrl,
//           javascriptMode: JavascriptMode.unrestricted,
//         ),
//       ),
//     );
//   }
// }

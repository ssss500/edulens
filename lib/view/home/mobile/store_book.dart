import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StoreBook extends StatefulWidget {
  const StoreBook({super.key});

  @override
  State<StoreBook> createState() => _StoreBookState();
}

class _StoreBookState extends State<StoreBook> {
  WebViewController? controller;

  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://sllr.co/edulens-bookstore'));
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(25.0)),
      child: Stack(
        children: [
          WebViewWidget(controller: controller!),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              :   Container(),
        ],
      ),
    );
  }
}

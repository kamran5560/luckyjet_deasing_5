import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../Constants/Constants.dart';
import '../Controller/DioClient/DioClient.dart';
import '../Controller/Services/ServerPageeService.dart';
import '../Controller/cubit_and_bloc/Authentication_cubit/ServerCubit.dart';

class Screen6 extends StatefulWidget {
  Screen6();

  @override
  createState() => _Screen6State();
}

class _Screen6State extends State<Screen6> {
  String _url = "https://flutter.dev";
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    late final PlatformWebViewControllerCreationParams params;

    params = const PlatformWebViewControllerCreationParams();

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
    Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      );
    _controller = controller;
  }

  _Screen6State();

  @override
  Widget build(BuildContext context) {
    String lang = Localizations.localeOf(context).toString();

    return SafeArea(
      child: Scaffold(
          body: BlocProvider(
        create: (context) => ServerCubit(
          apiRepository: ServerPageeService(
            apiService: DioClient(Globals.BaseURL),
          ),
        )..GetAnswers(lang),
        child: BlocConsumer<ServerCubit, ServerState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is ServerSuccess2) {
              print("Success");
              Map<String, dynamic> maper = jsonDecode(state.response?.data);

              print(maper["url"]);
              this._url = maper["url"];
              setState(() {});
              print(_url);
              _controller..loadRequest(Uri.parse(_url));
            }
          },
          builder: (context, state) {
            if (state is ServerSuccess2) {
              return Column(children: [
                Expanded(
                  child: WebViewWidget(controller: _controller),
                )
              ]);
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../logic/blocs/internet/internet_bloc.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<InternetBloc, InternetState>(
          builder: (context, state) {
            if (state is InternetConnected) {
              return WebView(
                zoomEnabled: false,
                gestureNavigationEnabled: true,
                onProgress: (progress) {},
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: 'https://www.google.com/',
              );
            }
            if (state is InternetDisconnected) {
              return const Center(
                child: Text('No Internet Connection'),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

import 'package:assign_project/utils/models/news.dart';
import 'package:get/get_core/get_core.dart';
import 'package:intl/intl.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailsController extends GetxController {
  News news = Get.arguments;
  WebViewController? cont;
  formatDate(givenDate) {
    String formattedDate =
        DateFormat('yyyy-dd-MM').format(DateTime.parse(givenDate));
    return formattedDate;
  }

  openBrowser(url) {
    cont = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(url)) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
    update();
  }
}

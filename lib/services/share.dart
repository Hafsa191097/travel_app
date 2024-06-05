import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:travel_app/models/place.dart';
import 'package:url_launcher/url_launcher.dart';

class ShareData {
  static Future<void> shareRecipeToEmail(Places place) async {
    final dynamicLinkParams = DynamicLinkParameters(
      link: Uri.parse(
          'https://sailingchefs.page.link/recipe?recipe=${place.placeName}'),
      uriPrefix: 'https://sailingchefs.page.link',
      androidParameters:
          const AndroidParameters(packageName: 'com.example.travel_app'),
      iosParameters: const IOSParameters(bundleId: 'com.example.travel_app'),
    );

    final dynamicLink =
        await FirebaseDynamicLinks.instance.buildLink(dynamicLinkParams);

    final emailUrl =
        'mailto:?subject=Recipe&body=${Uri.encodeComponent(dynamicLink.toString())}';
    await launchUrl(Uri.parse(emailUrl),
        mode: LaunchMode.externalApplication);
  }
}

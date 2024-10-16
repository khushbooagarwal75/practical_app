import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';


class Textscreen extends StatefulWidget {
  const Textscreen({super.key});

  @override
  State<Textscreen> createState() => _TextscreenState();
}

class _TextscreenState extends State<Textscreen> {
  String text = "This is a message";
  String customLink = "https://practical_mindlink.com/post/123";


  Future<String> createShortLink(String url) async {
    final response = await http.get(
      Uri.parse('https://practical_mindlink.com/api-create.php?url=$url'),
    );

    if (response.statusCode == 200) {
      return response.body; // Return the shortened URL
    } else {
      throw Exception('Failed to shorten the URL');
    }
  }

  Future<void> shareDynamicLink() async {
    try {
      String shortLink = await createShortLink(customLink);
      Share.share('Check out this post: $shortLink');
    } catch (e) {
      print('Error creating or sharing link: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            IconButton(
              onPressed: () {
                shareDynamicLink();
              },
              icon: Icon(Icons.share),
            ),
          ],
                ),
        ),
    );
  }
}

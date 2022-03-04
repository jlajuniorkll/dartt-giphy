import 'package:flutter/material.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:share_plus/share_plus.dart';

class GifPage extends StatelessWidget {
  const GifPage({Key? key, required Map gifData})
      : _gifData = gifData,
        super(key: key);

  final Map _gifData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_gifData["title"]),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () async {
                String url = _gifData["images"]["fixed_height"]["url"];
                try {
                  // Saved with this method.
                  var imageId = await ImageDownloader.downloadImage(url);
                  if (imageId == null) {
                    return;
                  }
                  var path = await ImageDownloader.findPath(imageId);
                  await Share.shareFiles([path!]);
                } catch (error) {
                  print(error);
                }
              },
              icon: const Icon(Icons.share))
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
          child: Image.network(_gifData["images"]["fixed_height"]["url"])),
    );
  }
}

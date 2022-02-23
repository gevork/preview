import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:notamedia/data/models/place/image.dart' as place;

class ImageList extends StatelessWidget {
  const ImageList({Key? key, this.images}) : super(key: key);

  final List<place.Image>? images;

  @override
  Widget build(BuildContext context) {
    if (images?.isNotEmpty != true) {
      return const SizedBox.shrink();
    }
    return SizedBox(
      height: MediaQuery.of(context).size.width / 3,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        separatorBuilder: (context, index) => const SizedBox(width: 12.0),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            _buildImageItem(context, images![index]),
        itemCount: images!.length,
      ),
      //color: Colors.amber,
    );
  }

  Widget _buildImageItem(BuildContext context, place.Image image) {
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: CachedNetworkImage(
        imageUrl: image.url ?? '',
        fit: BoxFit.cover,
        placeholder: (context, url) => const Icon(Icons.image_outlined),
        errorWidget: (context, url, error) => const Icon(Icons.error_outline),
      ),
    );
  }
}

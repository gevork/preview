import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:notamedia/data/models/place/place.dart';
import 'package:notamedia/ui/places_on_map/widgets/image_list.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceInfo extends StatelessWidget {
  const PlaceInfo(
      {Key? key, required this.place, required this.scrollController})
      : super(key: key);

  final ScrollController scrollController;
  final Place place;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      controller: scrollController,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 4.0),
          Text(
            place.data?.general?.organization?.name ?? '',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
          ),
          ImageList(images: place.data?.general?.gallery),
          Text(
            place.data?.general?.address?.fullAddress ?? '',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const SizedBox(height: 8.0),
          Html(
            data: place.data?.general?.description,
            onLinkTap: (String? url, RenderContext context,
                    Map<String, String> attributes, _) =>
                url?.isNotEmpty == true ? launch(url!) : null,
          )
        ],
      ),
    );
  }
}

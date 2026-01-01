import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CollectionPage extends StatelessWidget {
  final String collectionId;
  const CollectionPage({super.key, required this.collectionId});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Collection ID: $collectionId'));
  }
}

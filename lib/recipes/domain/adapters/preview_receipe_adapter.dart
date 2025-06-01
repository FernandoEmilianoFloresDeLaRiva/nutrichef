import 'package:nutrichef/common/domain/adapters/tags_adapter.dart';

class PreviewRecipeAdapter {
  final int id;
  final String title;
  final String image;
  final String sourceUrl;
  final int readyInMinutes;
  final TagsAdapter tags;

  PreviewRecipeAdapter(
      {required this.id,
      required this.title,
      required this.image,
      required this.sourceUrl,
      required this.readyInMinutes,
      required this.tags});

  factory PreviewRecipeAdapter.fromJson(Map<String, dynamic> json) {
    return PreviewRecipeAdapter(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      sourceUrl: json['sourceUrl'],
      readyInMinutes: json['readyInMinutes'],
      tags: TagsAdapter.fromJson(json),
    );
  }
}

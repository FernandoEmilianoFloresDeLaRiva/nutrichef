class PreviewRecipeAdapter {
  final int id;
  final String title;
  final String image;
  final String sourceUrl;
  final int readyInMinutes;
  final List<String> tags;

  PreviewRecipeAdapter(
      {required this.id,
      required this.title,
      required this.image,
      required this.sourceUrl,
      required this.readyInMinutes,
      required this.tags});

  factory PreviewRecipeAdapter.fromJson(Map<String, dynamic> json) {
    final List<String> tags = [];
    if (json['vegetarian'] == true) tags.add('Vegetariano');
    if (json['vegan'] == true) tags.add('Vegano');
    if (json['glutenFree'] == true) tags.add('Sin gluten');
    if (json['dairyFree'] == true) tags.add('Sin lácteos');
    if (json['veryHealthy'] == true) tags.add('Muy saludable');
    if (json['cheap'] == true) tags.add('Económico');
    if (json['veryPopular'] == true) tags.add('Popular');
    if (json['sustainable'] == true) tags.add('Sustentable');
    if (json['lowFodmap'] == true) tags.add('Low FODMAP');
    return PreviewRecipeAdapter(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      sourceUrl: json['sourceUrl'],
      readyInMinutes: json['readyInMinutes'],
      tags: tags,
    );
  }
}

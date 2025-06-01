class TagsAdapter {
  final List<String> tags;

  TagsAdapter({required this.tags});

  factory TagsAdapter.fromJson(Map<String, dynamic> json) {
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
    return TagsAdapter(tags: tags);
  }
}

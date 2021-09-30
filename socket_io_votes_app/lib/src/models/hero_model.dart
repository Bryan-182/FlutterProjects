class Heros {
  String id;
  String name;
  int votes;

  Heros({required this.id, required this.name, required this.votes});

  factory Heros.fromMap(Map<String, dynamic> obj) => Heros(
        id: obj['id'],
        name: obj['name'],
        votes: obj['votes'],
      );
}

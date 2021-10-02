class Heros {
  String id;
  String name;
  int votes;

  Heros({required this.id, required this.name, required this.votes});

  factory Heros.fromMap(Map<String, dynamic> obj) => Heros(
        id: obj.containsKey('id') ? obj['id'] : 'no-id',
        name: obj.containsKey('name') ? obj['name'] : 'no-name',
        votes: obj.containsKey('votes') ? obj['votes'] : 'no-votes',
      );
}

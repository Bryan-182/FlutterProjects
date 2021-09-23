class Cast {
  List<Actor> actors = new List();

  Cast();

  Cast.fromJsonList(List<dynamic> jsonList) {
    if (jsonList != null) {
      jsonList.forEach((element) {
        final actor = Actor.fromJsonMap(element);
        actors.add(actor);
      });
    } else {
      return;
    }
  }
}

class Actor {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  Actor.fromJsonMap(Map<String, dynamic> json) {
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    gender = json['gender'];
    id = json['id'];
    name = json['name'];
    order = json['order'];
    profilePath = json['profile_path'];
  }

  getActorImg() {
    if (profilePath != null) {
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    } else {
      return 'https://annam-finefood.com/wp-content/uploads/2016/09/no-avatar.png';
    }
  }
}

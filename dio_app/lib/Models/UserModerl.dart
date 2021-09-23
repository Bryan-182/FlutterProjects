class User {
  Name name;
  String email;
  String cell;
  Picture picture;

  User({
    this.name,
    this.email,
    this.cell,
    this.picture,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: Name.fromJson(json['name']),
        email: json['email'],
        cell: json['cell'],
        picture: Picture.fromJson(json['picture']),
      );
}

class Name {
  String first;
  String last;

  Name({
    this.first,
    this.last,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        first: json['first'],
        last: json['last'],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
      };
}

class Picture {
  String large;
  String medium;
  String thumbnail;

  Picture({
    this.large,
    this.medium,
    this.thumbnail,
  });

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        large: json['large'],
        medium: json['medium'],
        thumbnail: json['thumbnail'],
      );
}

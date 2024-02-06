class Student {
  int? id;
  late String name;
  late String desc;
  late String photoLink;
  // late String photo;
  // late String lan;

  Student(
    this.id,
    this.name,
    this.desc,
    this.photoLink,
  );

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['id'] = id;
    map['name'] = name;
    map['desc'] = desc;
    map['photoLink'] = photoLink;
    // map['photo'] = photo;
    // map['lan'] = lan;
    return map;
  }

  Student.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    desc = map['desc'];
    photoLink = map['photoLink'];
    // photo = map['photo'];
    // lan = map['lan'];
  }
}

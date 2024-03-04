class RandomuserModel {
  late final String id;
  late final String firstname;
  late final String secondname;
  late final String gender;
  late final String email;
  late final String bigpictureUrl;
  late final String smallpictureUrl;
  late final String city;
  late final String state;
  late final String country;

  RandomuserModel.fromMap(this.id, Map<String, dynamic> map) {
    firstname = (map['name'] as Map<String, dynamic>)['first'] as String;
    secondname = (map['name'] as Map<String, dynamic>)['last'] as String;
    gender = map['gender'] as String;
    email = map['email'];
    bigpictureUrl = (map['picture'] as Map<String, dynamic>)['large'] as String;
    smallpictureUrl = (map['picture'] as Map<String, dynamic>)['thumbnail'] as String;
    city = (map['location'] as Map<String, dynamic>)['city'] as String;
    state = (map['location'] as Map<String, dynamic>)['state'] as String;
    country = (map['location'] as Map<String, dynamic>)['country'] as String;
  }
}
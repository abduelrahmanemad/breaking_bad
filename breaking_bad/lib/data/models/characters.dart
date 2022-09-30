class Character {
  int charId=0;
  String name='';
  List<String> occupation=[];
  String img='';
  String status='';
  String nickname='';
  List<int> appearance=[];
  List<int> better_call_saul_appearance=[];
  String portrayed='';
  String category='';

  Character(
      {required this.charId,
        required this.name,
        required this.occupation,
        required this.img,
        required this.status,
        required this.nickname,
        required this.appearance,
        required this.better_call_saul_appearance,
        required this.portrayed,
        required this.category
      }
  );

  Character.fromJson(Map<String, dynamic> json) {
    charId = json['char_id'];
    name = json['name'];
    occupation = json['occupation'].cast<String>();
    img = json['img'];
    status = json['status'];
    nickname = json['nickname'];
    appearance = json['appearance'].cast<int>();
    better_call_saul_appearance = json['better_call_saul_appearance'].cast<int>();
    portrayed = json['portrayed'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['char_id'] = this.charId;
    data['name'] = this.name;
    data['occupation'] = this.occupation;
    data['img'] = this.img;
    data['status'] = this.status;
    data['nickname'] = this.nickname;
    data['appearance'] = this.appearance;
    data['better_call_saul_appearance'] = this.better_call_saul_appearance;
    data['portrayed'] = this.portrayed;
    data['category'] = this.category;
    return data;
  }
}
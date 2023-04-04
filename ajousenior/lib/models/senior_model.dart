class Senior {
  //닉네임,이메일,성별,나이,센터,생일//
  String? profile_nickname;
  String? account_email;
  String? gender;
  String? age_range;
  String? seniorcenter;
  String? birthday;
  Senior(this.profile_nickname, this.account_email, this.gender, this.age_range,
      this.seniorcenter, this.birthday);
  String split = "//";
  @override
  String toString() {
    // TODO: implement toString
    return profile_nickname! +
        split +
        account_email! +
        split +
        gender! +
        split +
        age_range! +
        split +
        seniorcenter! +
        split +
        birthday!;
  }
}

Senior StringTo(String a) {
  List<String> result = a.split('//');
  return Senior(
      result[0], result[1], result[2], result[3], result[4], result[5]);
}

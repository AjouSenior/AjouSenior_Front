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
  @override
  String toString() {
    // TODO: implement toString
    return profile_nickname! +
        account_email! +
        gender! +
        age_range! +
        seniorcenter! +
        birthday!;
  }
}

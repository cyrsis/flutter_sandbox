import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Util/Functions.dart';
class Profile {
  String firstName;
  String lastName;
  String location;
  int numberOfFollowers;
  int numberFollowing;
  int totalLikes;
   
  String get fullName => "$firstName $lastName";


  String get numberOfFollowersString => funabbreviatedCount(numberOfFollowers);

  String get numberFollowingString => funabbreviatedCount(numberFollowing);

  String get totalLikesString => funabbreviatedCount(totalLikes);

}

Profile getProfile() {
  return new Profile()
    ..firstName = "Victor"
    ..lastName = "Tong"
    ..location = "Hong Kong"
    ..numberOfFollowers = 5700000
    ..numberFollowing = 924
    ..totalLikes = 1700;
}
class ProfileColors {
  static final Color primaryColor = new Color(0xFF9A10FF);
}
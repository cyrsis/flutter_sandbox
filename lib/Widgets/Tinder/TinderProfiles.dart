import 'package:flutter_sandbox/Styles/AppImage.dart';

final List<Profile> demoProfiles = [
  new Profile(
    photos: [
      AppImage.tinderPhoto1,
      AppImage.tinderPhoto2,
      AppImage.tinderPhoto3,
      AppImage.tinderPhoto4,

    ],
    name: 'Someone Special',
    bio: 'This is the person you want!',
  ),
  new Profile(
    photos: [
      AppImage.tinderPhoto4,
      AppImage.tinderPhoto3,
      AppImage.tinderPhoto2,
      AppImage.tinderPhoto1,
    ],
    name: 'Gross Person',
    bio: 'You better swipe left...',
  ),
];

class Profile {
  final List<String> photos;
  final String name;
  final String bio;

  Profile({
    this.photos,
    this.name,
    this.bio,
  });
}

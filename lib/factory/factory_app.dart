import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String url =
      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg';

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gallery Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ProfileFactory(input: url),
    );
  }
}

class ProfileFactory extends StatelessWidget {
  final String input;

  const ProfileFactory({Key? key, this.input = ""}) : super(key: key);

  ProfileImage getProfileImage() {
    if (input.isNotEmpty && input.contains("https")) {
      return NetworkImage(input);
    }
    return DefaultImage();
  }

  @override
  Widget build(BuildContext context) {
    return getProfileImage().getProfile();
  }
}

class DefaultImage extends ProfileImage {
  @override
  Widget getProfile() {
    return const Icon(Icons.person);
  }
}

class NetworkImage extends ProfileImage {
  final String url;

  NetworkImage(this.url);

  @override
  Widget getProfile() {
    return Image.network(url);
  }
}

abstract class ProfileImage {
  Widget getProfile();
}

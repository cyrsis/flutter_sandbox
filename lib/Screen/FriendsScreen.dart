import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sandbox/Models/FriendModel.dart';
import 'package:flutter_sandbox/Screen/FriendDetailsScreen.dart';


class FriendsScreen extends StatefulWidget {
  @override
  _FriendsScreenState createState() => new _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  List<Friend> _friends = [];

  @override
  void initState() {
    super.initState();
    _loadFriends();
  }

  _loadFriends() async {
    String response =
    await createHttpClient().read('https://randomuser.me/api/?results=25');

    setState(() {
      _friends = Friend.allFromResponse(response);
    });
  }

  _buildFriendItem(BuildContext context, int index) {
    Friend friend = _friends[index];

    return new ListTile(
      onTap: () => _navigateToFriendDetails(friend, index),
      leading: new Hero(
        tag: index,
        child: new CircleAvatar(
          backgroundImage: new NetworkImage(friend.avatar),
        ),
      ),
      title: new Text(friend.name),
      subtitle: new Text(friend.email),
    );
  }

  _navigateToFriendDetails(Friend friend, Object avatarTag) {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (c) {
          return new FriendDetailsScreen(friend, avatarTag: avatarTag);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var content;

    if (_friends.isEmpty) {
      content = new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      content = new ListView.builder(
        itemCount: _friends.length,
        itemBuilder: _buildFriendItem,
      );
    }

    return new Scaffold(
      appBar: new AppBar(title: new Text('Friends')),
      body: content,
    );
  }
}
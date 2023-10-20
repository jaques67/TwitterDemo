import 'package:cloud_firestore/cloud_firestore.dart';

class Tweet {
  final String uid;
  final String profilePic;
  final String name;
  final String tweet;
  final Timestamp postTime;

//<editor-fold desc="Data Methods">
  const Tweet({
    required this.uid,
    required this.profilePic,
    required this.name,
    required this.tweet,
    required this.postTime,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tweet &&
          runtimeType == other.runtimeType &&
          uid == other.uid &&
          profilePic == other.profilePic &&
          name == other.name &&
          tweet == other.tweet &&
          postTime == other.postTime);

  @override
  int get hashCode =>
      uid.hashCode ^
      profilePic.hashCode ^
      name.hashCode ^
      tweet.hashCode ^
      postTime.hashCode;

  @override
  String toString() {
    return 'Tweet{ uid: $uid, profilePic: $profilePic, name: $name, tweet: $tweet, postTime: $postTime,}';
  }

  Tweet copyWith({
    String? uid,
    String? profilePic,
    String? name,
    String? tweet,
    Timestamp? postTime,
  }) {
    return Tweet(
      uid: uid ?? this.uid,
      profilePic: profilePic ?? this.profilePic,
      name: name ?? this.name,
      tweet: tweet ?? this.tweet,
      postTime: postTime ?? this.postTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'profilePic': profilePic,
      'name': name,
      'tweet': tweet,
      'postTime': postTime,
    };
  }

  factory Tweet.fromMap(Map<String, dynamic> map) {
    return Tweet(
      uid: map['uid'] as String,
      profilePic: map['profilePic'] as String,
      name: map['name'] as String,
      tweet: map['tweet'] as String,
      postTime: map['postTime'] as Timestamp,
    );
  }

//</editor-fold>
}
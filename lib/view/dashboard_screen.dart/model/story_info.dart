class Story {
  final int id;
  final int storyId;
  final String storyUrl;
  final String storyName;
  final String storyImg;

  Story({
    required this.id,
    required this.storyId,
    required this.storyUrl,
    required this.storyName,
    required this.storyImg,
  });

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      id: json['id'] as int,
      storyId: json['story_id'] as int,
      storyUrl: json['sotry_url'] as String,
      storyName: json['story_name'] as String,
      storyImg: json['story_img'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'story_id': storyId,
      'sotry_url': storyUrl,
      'story_name': storyName,
      'story_img': storyImg,
    };
  }
}

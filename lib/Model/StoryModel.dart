// --- Story Model ---
class StoryModel {
  final String id;
  final String name;
  final String imageUrl;
  final bool isViewed;
  final bool isMyStory;

  StoryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.isViewed = false,
    this.isMyStory = false,
  });
}

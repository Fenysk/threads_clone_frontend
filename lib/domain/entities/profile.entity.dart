class ProfileEntity {
  final String userId;
  final String? pseudo;
  final String? displayName;
  final String? biography;
  final String? link;
  final String? avatarUrl;

  ProfileEntity({
    required this.userId,
    required this.pseudo,
    required this.displayName,
    required this.biography,
    required this.link,
    required this.avatarUrl,
  });
}

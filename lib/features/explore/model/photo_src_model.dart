class PhotoSrcModel {
  const PhotoSrcModel({
    required this.original,
    required this.large2x,
    required this.large,
    required this.medium,
    required this.small,
    required this.portrait,
    required this.landscape,
    required this.tiny,
  });

  factory PhotoSrcModel.fromMap(Map<String, dynamic> map) {
    return PhotoSrcModel(
      original: map['original'] as String,
      large2x: map['large2x'] as String,
      large: map['large'] as String,
      medium: map['medium'] as String,
      small: map['small'] as String,
      portrait: map['portrait'] as String,
      landscape: map['landscape'] as String,
      tiny: map['tiny'] as String,
    );
  }
  final String original;
  final String large2x;
  final String large;
  final String medium;
  final String small;
  final String portrait;
  final String landscape;
  final String tiny;
}

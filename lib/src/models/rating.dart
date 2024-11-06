class Rating {
  final double rate;
  final int count;

  const Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'rate': num rate,
        'count': int count,
      } =>
        Rating(
          rate: rate.toDouble(),
          count: count,
        ),
      _ => throw const FormatException('Failed to load rating.'),
    };
  }
}

class Prediction {
  final String classType;
  final double confidence;
  final double x;
  final double y;
  final double width;
  final double height;

  Prediction({
    required this.classType,
    required this.confidence,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
  });

  factory Prediction.fromJson(Map<String, dynamic> json) {
    return Prediction(
      classType: json['class'],
      confidence: json['confidence'],
      x: json['x'],
      y: json['y'],
      width: json['width'],
      height: json['height'],
    );
  }
}

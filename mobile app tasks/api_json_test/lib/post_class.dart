
class Predict {

  int? id;
  double? sepalLengthCm;
  double? sepalWidthCm;
  double? petalLengthCm;
  double? petalWidthCm;
  dynamic procesId;
  String? species;

  Predict({
    this.id,
    this.sepalLengthCm,
    this.sepalWidthCm,
    this.petalLengthCm,
    this.petalWidthCm,
    this.procesId,
    this.species,
  });


  factory Predict.fromJson(Map<String, dynamic> json){
    return Predict(
      id: json["id"],
      sepalLengthCm: json["SepalLengthCm"],
      sepalWidthCm: json["SepalWidthCm"],
      petalLengthCm: json["PetalLengthCm"],
      petalWidthCm: json["PetalWidthCm"],
      procesId: json["proces_id"],
      species: json["Species"],
    );
  }
}

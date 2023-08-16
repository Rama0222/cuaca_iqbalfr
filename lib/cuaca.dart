class cuaca1 {
  String? jamCuaca;
  String? kodeCuaca;
  String? cuaca;
  String? tempC;

  cuaca1({
    this.jamCuaca,
    this.kodeCuaca,
    this.cuaca,
    this.tempC,
  });

  cuaca1.fromJson(Map<String, dynamic> json) {
    jamCuaca = json['jamCuaca'];
    kodeCuaca = json['kode_Cuaca'];
    cuaca = json['Cuaca'];
    tempC = json['tempC'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = jamCuaca;
    data['kode_Cuaca'] = kodeCuaca;
    data['Cuaca'] = cuaca;
    data['tempC'] = tempC;

    return data;
  }
}

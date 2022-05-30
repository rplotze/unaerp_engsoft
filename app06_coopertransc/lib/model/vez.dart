// ignore_for_file: non_constant_identifier_names

class Vez {
  String id;
  String dataMarcacao;
  String horaMarcacao;
  String idUnidade;
  String cooperado;
  String veiculo;
  String engatado;
  String tipo_veiculo;
  String unidade;
  String estados;
  String chegada;

  Vez(
    this.id,
    this.dataMarcacao,
    this.horaMarcacao,
    this.idUnidade,
    this.cooperado,
    this.veiculo,
    this.engatado,
    this.tipo_veiculo,
    this.unidade,
    this.estados,
    this.chegada,
  );

  factory Vez.fromJson(Map<String, dynamic> json) {
    return Vez(
      json['id'],
      json['data_marcacao'],
      json['hora_marcacao'],
      json['id_unidade'],
      json['cooperado'],
      json['veiculo'],
      json['Engatado'],
      json['tipo_veiculo'],
      json['unidade'],
      json['estados'],
      json['chegada'],
    );
  }

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['id'] = id;
    data['data_marcacao'] = dataMarcacao;
    data['hora_marcacao'] = horaMarcacao;
    data['id_unidade'] = idUnidade;
    data['cooperado'] = cooperado;
    data['veiculo'] = veiculo;
    data['Engatado'] = engatado;
    data['tipo_veiculo'] = tipo_veiculo;
    data['unidade'] = unidade;
    data['estados'] = estados;
    data['chegada'] = chegada;
    return data;
  }
}

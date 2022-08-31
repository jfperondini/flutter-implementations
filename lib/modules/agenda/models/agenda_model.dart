class AgendaModel {
  late final int idAgenda;
  late final String tituloEvento;
  late final String dataEvento;
  late final String horaInicial;
  late final String horaFinal;
  late final String corEvento;
  late final int? isCompleted;

  AgendaModel({
    required this.idAgenda,
    required this.tituloEvento,
    required this.dataEvento,
    required this.horaInicial,
    required this.horaFinal,
    required this.corEvento,
    this.isCompleted,
  });

  AgendaModel.fromJson(Map<String, dynamic> json) {
    idAgenda = json['idAgenda'];
    tituloEvento = json['tituloEvento'];
    dataEvento = json['horaInicial'];
    horaInicial = json['horaInicial'];
    horaFinal = json['horaFinal'];
    corEvento = json['corEvento'];
    isCompleted = json['isCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['idAgenda'] = idAgenda;
    json['tituloEvento'] = tituloEvento;
    json['dataEvento'] = dataEvento;
    json['horaInicial'] = horaInicial;
    json['horaFinal'] = horaFinal;
    json['corEvento'] = corEvento;
    json['isCompleted'] = isCompleted;
    return json;
  }
}

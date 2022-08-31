class Observacaorecebimento {
  String linhaDigitavel;

  Observacaorecebimento({
    required this.linhaDigitavel,
  });

  static Observacaorecebimento fromJson(Map<String, dynamic> map) {
    return Observacaorecebimento(
      linhaDigitavel: map["linhaDigitavel"],
    );
  }
}

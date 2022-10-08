class Countries {
  Countries._();

  static const Country AD = Country(
    dialingCode: "376",
    isoCode: "AD",
    name: "andorra",
  );

  static const Country AE = Country(
    dialingCode: "971",
    isoCode: "AE",
    name: "United Arab Emirates",
  );

  static const Country AF = Country(
    dialingCode: "93",
    isoCode: "AF",
    name: "Afghanistan",
  );

  static const Country AG = Country(
    dialingCode: "1",
    isoCode: "AG",
    name: "Antigua and Barbuda",
  );

  static const Country AI = Country(
    dialingCode: "1",
    isoCode: "AI",
    name: "Anguilla",
  );

  static const Country AL = Country(
    dialingCode: "355",
    isoCode: "AL",
    name: "Albania",
  );

  static const ALL = [
    Countries.AD,
    Countries.AE,
    Countries.AF,
    Countries.AG,
    Countries.AI,
    Countries.AL,
  ];
}

class Country {
  final String dialingCode;
  final String isoCode;
  final String name;

  const Country({
    required this.dialingCode,
    required this.isoCode,
    required this.name,
  });
}

class CountryItem {
  final String? name;
  final String? phoneCode;
  final String? isoCode;
  final String? iso3Code;

  CountryItem({this.name, this.phoneCode, this.isoCode, this.iso3Code});
  bool operator ==(dynamic other) =>
      other != null && other is CountryItem && this.isoCode == other.isoCode;

  @override
  int get hashCode => super.hashCode;
}

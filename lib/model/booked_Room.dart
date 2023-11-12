class BookedRoom {
  int num = 1;
  int adults = 1;
  int childern = 0;
  List<int> agesOfChildern = [];
  bool pet = false;

  BookedRoom(
      {required this.num,
      required this.adults,
      required this.childern,
      this.pet = false,
      required this.agesOfChildern});
  bool operator ==(dynamic other) =>
      other != null && other is BookedRoom && this.num == other.num;

  @override
  int get hashCode => super.hashCode;
}

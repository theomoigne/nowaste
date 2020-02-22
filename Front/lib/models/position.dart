class Position {
  double lat;
  double lng;

  Position(this.lat, this.lng);

  String getCoordinateSentence() {
    return 'Vous êtes situé sur les coordoonées : ($lat, $lng).';
  }
}
class Position {
  double lat;
  double lng;

  Position(this.lat, this.lng);

  static Position makePosition(List values){
    return Position(values[0], values[1]);
  }

  String getCoordinateSentence() {
    return 'Vous êtes situé sur les coordoonées : ($lat, $lng).';
  }
}
class MatchCard {
  int redColor = 0;
  int greenColor = 0;
  int blueColor = 0;

  MatchCard(int red, int green, int blue) {
    redColor = red;
    greenColor = green;
    blueColor = blue;
  }
}

class MatchPage {
  String image;
  String title;
  String description;

  MatchPage({this.image, this.title, this.description});
}

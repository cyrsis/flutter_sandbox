import 'dart:ui';

class Beer {
  final int id;
  final String title;
  final String word;
  final double rating;
  final double alcohol;
  final String size;
  final String note;
  final String foodMatch;
  final String image;
  final Color color;

  Beer(
      {this.id,
        this.title,
        this.word,
        this.rating,
        this.size,
        this.foodMatch,
        this.note,
        this.image,
        this.alcohol,
        this.color});

  String get asset => 'assets/Beer/$image.png';
  bool get isDark => color.computeLuminance() < 0.6;
}

final List<Beer> beers = [
  Beer(
      id: 1,
      title: 'Hallertau Luxe Kölsch',
      word: 'Kölsch is the local brew of the city of Cologne in Southern Germany. Our version has all New Zealand ingredients. A great entry level craft beer to quench that lawn mowing thirst.',
      rating: 3.2,
      alcohol: 4.5,
      size: '12x330ml',
      note: 'Some say she’s the luxe life. Exuberant. Snappy. Bright. Chatty. Sunlit. Lush. Passionfruit. Blueberries. Sparkling. Refined. Considered. Dry. And frankly, refreshing.',
      foodMatch: 'Ceasar Salad, Mature Cheddar, Fish & Chips',
      image: 'luxe',
      color: Color.fromRGBO(234, 188, 48, 1.0)),
  Beer(
      id: 2,
      title: 'Hallertau Statesman Pale Ale',
      word: 'No.2 is an iconic beer for Hallertau with a cult following. An eminently approachable Pale Ale with a delicious hop profile.',
      rating: 3.8,
      alcohol: 5.3,
      size: '12x330ml',
      note: 'Yowza! This character’s outspoken. Bursting with opinions. Arrives with a floral bouquet. Hoots. Honks. Hops.Charismatic. Honey. Bombastic. Citrus. Distinguished. Tang. Then closes the deal guaranteeing your thirst thoroughly quenched.',
      foodMatch: 'Thai Beef Salad, Chicken Vindloo, Sweet & Sour Pork.',
      image: 'statesman',
      color: Color.fromRGBO(237, 142, 47, 1.0)),
  Beer(
      id: 3,
      title: 'Hallertau Copper Tart Red Ale',
      word: 'An Irish style beer given a New Zealand twist. Restrained hopping makes this beer more of a malt showcase. Flys in the autumn.',
      rating: 3.8,
      alcohol: 4.2,
      size: '12x330ml',
      note: 'This’d surely be a miner’s delight. Substantial. Satisfying. Deserved. Malt.Forged Caramel. Bitter. Chocolate. Rich. Worthwhile. Smooth and dry, earner of a knowing smile.',
      foodMatch: 'Char grilled Tuna, Steak, Spicy Crabcakes.',
      image: 'copper',
      color: Color.fromRGBO(200, 76, 42, 1.0)),
  Beer(
      id: 4,
      title: 'Hallertau Deception Schwarzbier',
      word: 'None of the dryness associated with those other black beers Stouts and Porters. Dehusked malt delivers tons of flavour whilst remaining light on the palate. A real hit with ladies.',
      rating: 3.8,
      alcohol: 5.1,
      size: '12x330ml',
      note: 'This number is not what he seems.A bit of a trickster really. Smooth.Firm. Dark. Light. Bitter. Sweet.Coffee. Intricate. Chocolate. Subterfuge. You’ve been warned.',
      foodMatch: 'Cold cuts, BBQ Blackened lamb, Confit of Duck.',
      image: 'deception',
      color: Color.fromRGBO(155, 77, 42, 1.0)),
  Beer(
      id: 5,
      title: 'Hallertau Pilsnah',
      word: 'This style of Pils is a wonderful thing. Super dry and really rather hopper than you’d expect.',
      rating: 3.8,
      alcohol: 5.0,
      size: '12x330ml',
      note: 'De-sweat your brow. Lawns mown. Hay bailed. Yoga stretched. Inning had. Here’s the reward. Citrus. Wood chips. Unexpected Hop notes. Ahh.',
      foodMatch: 'Wok seared cuttlefish w pickled cucumber, herbs & chilli.',
      image: 'pilsnah',
      color: Color.fromRGBO(54, 80, 143, 1.0)),
  Beer(
      id: 6,
      title: 'Hallertau Session IPA',
      word: 'A super hoppy Session India Pale Ale with all the hops but half the alcohol. Perfect for those long afternoon sessions in the sun.',
      rating: 3.8,
      alcohol: 3.8,
      size: '12x330ml',
      note: 'Double the hops, half the tipsy. Revel in the hop bounty and enjoy the journey.',
      foodMatch: 'Goan Curry, Eggs Benedict with Smoked Salmon, Chorizo',
      image: 'session',
      color: Color.fromRGBO(130, 61, 99, 1.0)),
  Beer(
      id: 7,
      title: 'Hallertau Granny Smith Apple Cider',
      word: 'Created in an off dry style with pleasing acidity from the Granny Smith apple. A cider for grown-ups.',
      rating: 3.8,
      alcohol: 5.1,
      size: '12x330ml',
      note: 'Crunch. Clean. Crisp. Refreshing. Bite. Blue skies. Cut grass. Good times. Granny Smith would be rapt with this sublimely cider.',
      foodMatch: 'Pork Stroganoff, Eggs Benedict with bacon.',
      image: 'cider',
      color: Color.fromRGBO(88, 90, 59, 1.0)),
  Beer(
      id: 8,
      title: 'Hallertau Maximus IPA',
      word: 'Dry hopping is the process of adding hops to the post fermentation. These NZ and US hops give the beer a delicious tropical aroma. Please drink respectfully.',
      rating: 3.8,
      alcohol: 5.8,
      size: '12x330ml',
      note: 'The fiercely floral and fragrant hop, known as the earth wolf by the ancients, has been cunningly tamed with a soft, rich, maltiness.',
      foodMatch: 'Thai Green Curry, Chicken Jalfrezi.',
      image: 'maximus',
      color: Color.fromRGBO(121, 118, 114, 1.0)),
  Beer(
      id: 9,
      title: 'Hallertau Porter Noir',
      word: 'Brewing this draws on winemaking traditions for a finely composed arrangement of soft tannins, forest fruits and chocolate, all completed with an elegantly long, dry finish.',
      rating: 3.8,
      alcohol: 6.6,
      size: '12x330ml',
      note: 'Dusty chocolate with hints of cherry pie and sandalwood.',
      foodMatch: 'Confit of Duck, Game Casserole, Venison Burger, Blue Cheese.',
      image: 'porternoir',
      color: Color.fromRGBO(136, 91, 61, 1.0)),
  Beer(
      id: 10,
      title: 'Hallertau Stuntman IIPA',
      word: 'Best not attempted by the fainthearted.',
      rating: 3.8,
      alcohol: 8.8,
      size: '12x330ml',
      note: 'Tropical fruits and flowers, guava, mangoes and citrus are all in the mix.',
      foodMatch: 'Jalapeno Poppers, Red Jungle Curry.',
      image: 'stuntman',
      color: Color.fromRGBO(167, 163, 156, 1.0)),
];
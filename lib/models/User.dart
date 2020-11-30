class User {
  final String imageUrl;
  final String name;
  final String username;
  final bool isFollow;

  User({this.imageUrl, this.name, this.username, this.isFollow});
}

List suggestedUsers = [
  User(
    imageUrl: 'https://www.randomlists.com/img/people/tyler_perry.webp',
    name: 'Arthur Shelby',
    username: '@art.shelby',
    isFollow: false,
  ),
  User(
    imageUrl: 'https://pbs.twimg.com/media/D8dDZukXUAAXLdY.jpg',
    name: 'Sarah Tancredi',
    username: '@dr.sarah',
    isFollow: true,
  ),
  User(
    imageUrl:
        'https://i.pinimg.com/236x/18/6e/06/186e060acf35877a2a9e62c36b479696--tom-hardy-hot-beautiful-smile.jpg',
    name: 'Vin Diesel',
    username: '@vundiesel',
    isFollow: false,
  ),
];

List favUsers = [
  User(
    imageUrl: 'https://www.randomlists.com/img/people/tyler_perry.webp',
    name: 'Arthur',
  ),
  User(
    imageUrl: 'https://pbs.twimg.com/media/D8dDZukXUAAXLdY.jpg',
    name: 'Sarah',
  ),
  User(
    imageUrl:
        'https://i.pinimg.com/236x/18/6e/06/186e060acf35877a2a9e62c36b479696--tom-hardy-hot-beautiful-smile.jpg',
    name: 'Vin',
  ),
  User(
    imageUrl: 'https://www.randomlists.com/img/people/tyler_perry.webp',
    name: 'Arthur',
  ),
  User(
    imageUrl: 'https://pbs.twimg.com/media/D8dDZukXUAAXLdY.jpg',
    name: 'Sarah',
  ),
  User(
    imageUrl:
        'https://i.pinimg.com/236x/18/6e/06/186e060acf35877a2a9e62c36b479696--tom-hardy-hot-beautiful-smile.jpg',
    name: 'Vin',
  ),
  User(
    imageUrl: 'https://www.randomlists.com/img/people/tyler_perry.webp',
    name: 'Arthur',
  ),
  User(
    imageUrl: 'https://pbs.twimg.com/media/D8dDZukXUAAXLdY.jpg',
    name: 'Sarah',
  ),
  User(
    imageUrl:
        'https://i.pinimg.com/236x/18/6e/06/186e060acf35877a2a9e62c36b479696--tom-hardy-hot-beautiful-smile.jpg',
    name: 'Vin',
  ),
];

class User {
  String uid;

  User({this.uid, this.email, this.subscribe, this.username, this.interestMap});

  void populate() {}

  String email = 'Lorem ipsum dolor.';
  String username = 'anon';
  String title = 'pheasant';

  static String interestStock = 'stock';
  static String interestBonds = 'bond';
  static String interestForex = 'forex';

  bool subscribe = false;

  Map<String, bool> interestMap = {
    interestStock: false,
    interestBonds: false,
    interestForex: false,
  };

  void setUID(String newUID) {
    uid = newUID;
  }

  String printInfo() {
    print("email is " +
        email.toString() +
        " username is " +
        username.toString() +
        " interest in subscribing " +
        subscribe.toString());
  }

  create() {}

  void setSubscribe(bool value) {
    print("setsubscribed called and value passed in was " + value.toString());
    subscribe = value;
  }

  void setEmail(String addy) {
    email = addy;
  }

  void setUsername(String user) {
    username = user;
  }

  void setMap(String key, bool value) {
    interestMap[key] = value;
  }

  User update(User newInfo) {
    setSubscribe(newInfo.subscribe);
    setEmail(newInfo.email);
    setUsername(newInfo.username);
    title = newInfo.title;

    interestMap.forEach((key, value) {
      if (newInfo.interestMap[key] != null) {
        setMap(key, newInfo.interestMap[key]);
      }
    });
  }
}

class UserData {
  String uid;
  String username;
  String email = '';
  bool subscribe = true;
  String title = 'ima dummy';

  static String interestStock = 'stock';
  static String interestBonds = 'bond';
  static String interestForex = 'forex';

  Map<String, bool> interestMap = {
    interestStock: false,
    interestBonds: false,
    interestForex: false,
  };

  UserData(
      {this.email, this.subscribe, this.uid, this.username, this.interestMap});

  String printInfo() {
    print("email is " +
        email +
        " username is " +
        username +
        " interest in subscribing " +
        subscribe.toString() +
        " one interest is " +
        interestMap['interestStock'].toString());
  }

  create() {}

  void setSubscribe(bool value) {
    subscribe = value;
  }

  void setEmail(String addy) {
    email = addy;
  }

  void setUsername(String user) {
    username = user;
  }

  void setMap(String key, bool value) {
    interestMap[key] = value;
    print('now the value of ' + key + ' is ' + value.toString());
  }
}

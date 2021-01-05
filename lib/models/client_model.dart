import 'package:flutter/cupertino.dart';
import 'package:login/models/client.dart';

class ClientModel extends ChangeNotifier {
  List<Client> clients = [
    Client(
      id: "1",
      avatarUrl: "assets/avatar.jpg",
      fullBodyImageUrl: "assets/full-body.png",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
      password: "@123",
      userName: "@123",
      description:
          "The self-study lessons in this section are written and organised "
          "according one two three four five six seven eight nine tento the levels of the Common European Framework of Reference for languages (CEFR). There are different types of texts and interactive exercises that practise the reading skills you need to do well in your studies, to get ahead at work and to communicate in English in your free time.",
    ),
    Client(
      id: "3",
      avatarUrl: "assets/avatar.jpg",
      fullBodyImageUrl: "assets/full-body.png",
      description:
          "The self-study lessons in this section are written and organised "
          "according one two three four five six seven eight nine tento the levels of the Common European Framework of Reference for languages (CEFR). There are different types of texts and interactive exercises that practise the reading skills you need to do well in your studies, to get ahead at work and to communicate in English in your free time.",
      phone: "0936 572 310",
      name: "Le Tien Thinh",
      password: "@123",
      userName: "@123",
    ),
  ];

  void add(Client client) {
    clients.add(client);
    notifyListeners();
  }

  void updateInfo(
    Client client,
    Client newClient,
  ) {
    clients[clients.indexWhere((element) => element.id == client.id)] = newClient;
    print("in model: ${client.name}");
    notifyListeners();
  }
}

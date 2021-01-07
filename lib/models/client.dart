class Client {
  final String id;
  final String name;
  final String phone;
  final String avatarUrl;
  final String fullBodyImageUrl;
  final String description;

  const Client({
    this.id,
    this.name,
    this.phone,
    this.avatarUrl,
    this.description,
    this.fullBodyImageUrl,
  });

  Map<String, dynamic> toMap() {
    return{
      "id":id,
      "name": name,
      "phone": phone,
      "avatarUrl": avatarUrl,
      "fullBodyImageUrl": fullBodyImageUrl,
      "description": description,
    };
  }
}

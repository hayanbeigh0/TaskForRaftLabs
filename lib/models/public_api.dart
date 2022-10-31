class PublicApi {
  PublicApi({
    required this.count,
    required this.entries,
  });
  late final int count;
  late final List<Entries> entries;

  PublicApi.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    entries =
        List.from(json['entries']).map((e) => Entries.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['count'] = count;
    data['entries'] = entries.map((e) => e.toJson()).toList();
    return data;
  }
}

class Entries {
  Entries({
    required this.api,
    required this.description,
    required this.auth,
    required this.https,
    required this.cors,
    required this.link,
    required this.category,
  });
  late final String api;
  late final String description;
  late final String auth;
  late final bool https;
  late final String cors;
  late final String link;
  late final String category;

  Entries.fromJson(Map<String, dynamic> json) {
    api = json['API'];
    description = json['Description'];
    auth = json['Auth'];
    https = json['HTTPS'];
    cors = json['Cors'];
    link = json['Link'];
    category = json['Category'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['API'] = api;
    data['Description'] = description;
    data['Auth'] = auth;
    data['HTTPS'] = https;
    data['Cors'] = cors;
    data['Link'] = link;
    data['Category'] = category;
    return data;
  }
}

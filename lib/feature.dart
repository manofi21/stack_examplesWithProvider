import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;

String authen = "1c37b3ae1e6b21b0a63e50d9145c9af6d5b36153";
final url = "https://api.github.com/users/manofi21";

BaseOptions options = BaseOptions(
    baseUrl: "https://api.github.com/users/manofi21",
    connectTimeout: 5000,
    receiveTimeout: 3000,
    headers: {
      "Authorization": "token $authen",
    });

Future<List<GistData>> getPost() async {
  List<GistData> permanent = List();
  int i = 1;
  Dio _dio = Dio(options);
  while (i > 0) {
    Response re = await _dio.get("/gists", queryParameters: {"page": i});
    List<dynamic> data = re.data;
    if (data.length > 0) {
      for (int j = 0; j < data.length; j++) {
        permanent.add(GistData.fromJson(data[j], data[j]["files"]));
      }
      i++;
    } else {
      break;
    }
  }
  permanent.sort((a, b) {
    return a.files.keys.first
        .toLowerCase()
        .compareTo(b.files.keys.first.toLowerCase());
  });

  permanent = permanent.reversed.map((e) => e).toList();
  return permanent;
}

class GistData {
  String url;
  String forksUrl;
  String commitsUrl;
  String id;
  String nodeId;
  String gitPullUrl;
  String gitPushUrl;
  String htmlUrl;
  bool public;
  Map<String, dynamic> files;
  DateTime createdAt;
  DateTime updatedAt;
  String description;
  int comments;
  dynamic user;
  String commentsUrl;
  Owner owner;
  bool truncated;

  GistData({
    this.url,
    this.forksUrl,
    this.commitsUrl,
    this.id,
    this.nodeId,
    this.gitPullUrl,
    this.gitPushUrl,
    this.htmlUrl,
    this.public,
    this.files,
    this.createdAt,
    this.updatedAt,
    this.description,
    this.comments,
    this.user,
    this.commentsUrl,
    this.owner,
    this.truncated,
  });

  factory GistData.fromJson(
          Map<String, dynamic> json, Map<String, dynamic> files) =>
      GistData(
        url: json["url"],
        forksUrl: json["forks_url"],
        commitsUrl: json["commits_url"],
        id: json["id"],
        nodeId: json["node_id"],
        gitPullUrl: json["git_pull_url"],
        gitPushUrl: json["git_push_url"],
        htmlUrl: json["html_url"],
        public: json["public"],
        files: files,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        description: json["description"],
        comments: json["comments"],
        user: json["user"],
        commentsUrl: json["comments_url"],
        owner: Owner.fromJson(json["owner"]),
        truncated: json["truncated"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "forks_url": forksUrl,
        "commits_url": commitsUrl,
        "id": id,
        "node_id": nodeId,
        "git_pull_url": gitPullUrl,
        "git_push_url": gitPushUrl,
        "html_url": htmlUrl,
        "public": public,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "description": description,
        "comments": comments,
        "user": user,
        "comments_url": commentsUrl,
        "owner": owner.toJson(),
        "truncated": truncated,
      };
}

class Owner {
  String login;
  int id;
  String nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String eventsUrl;
  String receivedEventsUrl;
  String type;
  bool siteAdmin;

  Owner({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
        gravatarId: json["gravatar_id"],
        url: json["url"],
        htmlUrl: json["html_url"],
        followersUrl: json["followers_url"],
        followingUrl: json["following_url"],
        gistsUrl: json["gists_url"],
        starredUrl: json["starred_url"],
        subscriptionsUrl: json["subscriptions_url"],
        organizationsUrl: json["organizations_url"],
        reposUrl: json["repos_url"],
        eventsUrl: json["events_url"],
        receivedEventsUrl: json["received_events_url"],
        type: json["type"],
        siteAdmin: json["site_admin"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "avatar_url": avatarUrl,
        "gravatar_id": gravatarId,
        "url": url,
        "html_url": htmlUrl,
        "followers_url": followersUrl,
        "following_url": followingUrl,
        "gists_url": gistsUrl,
        "starred_url": starredUrl,
        "subscriptions_url": subscriptionsUrl,
        "organizations_url": organizationsUrl,
        "repos_url": reposUrl,
        "events_url": eventsUrl,
        "received_events_url": receivedEventsUrl,
        "type": type,
        "site_admin": siteAdmin,
      };
}

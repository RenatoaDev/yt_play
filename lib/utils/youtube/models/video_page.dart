
class VideoPage {
  
  String? videoId;

  String? title;

  String? date;

  String? description;

  String? channelName;

  String? viewCount;
  
  String? likeCount;

  String? unlikeCount;

  String? channelThumb;

  String? channelId;

  String? subscribeCount;

  VideoPage(
      {this.videoId,
      this.title,
      this.channelName,
      this.viewCount,
      this.subscribeCount,
      this.likeCount,
      this.unlikeCount,
      this.date,
      this.description,
      this.channelThumb,
      this.channelId});

  factory VideoPage.fromMap(Map<String, dynamic>? map, String videoId) {
    return VideoPage(
        videoId: videoId,
        title: map?['results']['results']['contents'][0]['videoPrimaryInfoRenderer']['title']['runs']
            .fold(
                '',
                (previousValue, element) =>
                    previousValue + element['text'].toString())
            .toString(),
        channelName: map?['results']['results']['contents'][1]['videoSecondaryInfoRenderer']
            ['owner']['videoOwnerRenderer']['title']['runs'][0]['text'],
        viewCount: map?['results']['results']['contents'][0]['videoPrimaryInfoRenderer']['viewCount']
            ['videoViewCountRenderer']['shortViewCount']['simpleText'],
            likeCount: map?['results']['results']['contents'][0]['videoPrimaryInfoRenderer']['videoActions']['menuRenderer']['topLevelButtons'][0]['segmentedLikeDislikeButtonRenderer']['likeButton']['toggleButtonRenderer']['defaultText']['simpleText'],
        subscribeCount: map?['results']?['results']?['contents']?[1]?['videoSecondaryInfoRenderer']?['owner']
            ?['videoOwnerRenderer']?['subscriberCountText']?['simpleText'],
        description: map?['results']?['results']?['contents']?[1]
            ?['videoSecondaryInfoRenderer']?['attributedDescription']?['content'],
        date: map?['results']['results']['contents'][0]['videoPrimaryInfoRenderer']['dateText']['simpleText'],
        channelThumb: map?['results']['results']['contents'][1]['videoSecondaryInfoRenderer']['owner']['videoOwnerRenderer']['thumbnail']['thumbnails'][1]['url'],
        channelId: map?['results']['results']['contents'][1]['videoSecondaryInfoRenderer']['owner']['videoOwnerRenderer']['navigationEndpoint']['browseEndpoint']['browseId']);
  }
}

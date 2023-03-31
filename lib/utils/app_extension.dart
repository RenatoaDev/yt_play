import 'package:yt_play/utils/youtube/models/video.dart' as data;
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:yt_play/utils/youtube/models/thumbnail.dart' as thumbnail;

extension ConvertBaseToVideo on Video {
  data.Video get toVideo {
    final Video video = this;

    data.Video convertedVideo = data.Video(
        videoId: video.id.toString(),
        thumbnails: [
          thumbnail.Thumbnail(url: video.thumbnails.highResUrl),
          thumbnail.Thumbnail(url: video.thumbnails.mediumResUrl)
        ],
        title: video.title,
        views: video.engagement.viewCount.toString(),
        channelName: video.author);
    return convertedVideo;
  }
}

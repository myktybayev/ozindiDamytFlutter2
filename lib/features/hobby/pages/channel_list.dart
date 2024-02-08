// import 'package:flutter/material.dart';
//
// class ChannelList extends StatefulWidget {
//   final Map<String, dynamic> hobby;
//   const ChannelList({super.key, required this.hobby});
//   @override
//   State<ChannelList> createState() => _ChannelListState();
// }
//
// class _ChannelListState extends State<ChannelList> {
//   bool loading = true;
//
//   void _toggleLoading(bool value) {
//     setState(() {
//       loading = value;
//     });
//   }
//
//   late Channel _channel;
//   bool _isloading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _initChannel();
//   }
//
//   _initChannel() async {
//     Channel channel =
//         await APIService.instance.fetchChannel(channelId: widget.hobby['url']);
//     setState(() {
//       _channel = channel;
//     });
//   }
//
//   _buildProfileInfo() {
//     return _channel != null
//         ? Container(
//             margin: EdgeInsets.all(20.0),
//             padding: EdgeInsets.all(20.0),
//             height: 100.0,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black12,
//                   offset: Offset(0, 1),
//                   blurRadius: 6.0,
//                 ),
//               ],
//             ),
//             child: Row(
//               children: <Widget>[
//                 CircleAvatar(
//                   backgroundColor: Colors.white,
//                   radius: 35.0,
//                   child: _channel.profilepicURL != null
//                       ? Image.network(
//                           _channel.profilepicURL,
//                           errorBuilder: (context, error, stackTrace) {
//                             return Text('Failed to load image');
//                           },
//                         )
//                       : Placeholder(),
//                 ),
//                 SizedBox(width: 12.0),
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         _channel.title,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.w600,
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       Text(
//                         '${_channel.subscriberCount} tirkelushi',
//                         style: TextStyle(
//                           color: Colors.grey[600],
//                           fontSize: 16.0,
//                           fontWeight: FontWeight.w600,
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           )
//         : Container();
//   }
//
//   _buildVideo(Video video) {
//     return GestureDetector(
//       onTap: () {
//         if (_channel != null) {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (_) => VideoScreen(id: video.id),
//             ),
//           );
//         }
//       },
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
//         padding: EdgeInsets.all(10.0),
//         height: 140.0,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black12,
//               offset: Offset(0, 1),
//               blurRadius: 6.0,
//             ),
//           ],
//         ),
//         child: Row(
//           children: <Widget>[
//             Image(
//               width: 150.0,
//               image: NetworkImage(video.thumbnailUrl),
//               fit: BoxFit.fitWidth,
//             ),
//             SizedBox(width: 10.0),
//             Expanded(
//               child: Text(
//                 video.title,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 18.0,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   _loadMoreVideos() async {
//     _isloading = true;
//     List<Video> moreVideos = await APIService.instance
//         .fetchVideosFromPlaylist(playlistId: _channel.uploadplaylistId);
//     List<Video> allVideos = List.from(_channel.videos as Iterable)
//       ..addAll(moreVideos);
//
//     setState(() {
//       _channel.videos = allVideos;
//     });
//     _isloading = false;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             onPressed: () => Navigator.pop(context),
//             icon: Container(
//               height: 30,
//               width: 30,
//               child: Icon(Icons.arrow_back),
//             ),
//           ),
//           title: Text(widget.hobby['name']),
//         ),
//         body: loading
//             ? LoadingPage(
//                 onStopLoading: () {
//                   _toggleLoading(false);
//                 },
//               )
//             : _channel != null
//                 ? NotificationListener<ScrollNotification>(
//                     onNotification: (ScrollNotification scrollDetails) {
//                       if (_isloading &&
//                           _channel.videos!.length !=
//                               int.tryParse(_channel.videoCount ?? '') &&
//                           scrollDetails.metrics.pixels ==
//                               scrollDetails.metrics.maxScrollExtent) {
//                         _loadMoreVideos();
//                       }
//                       return false;
//                     },
//                     child: ListView.builder(
//                       itemCount: 1 + _channel.videos!.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         if (index == 0) {
//                           return _buildProfileInfo();
//                         }
//                         Video? video = _channel.videos?.elementAt(index - 1);
//                         return _buildVideo(video!);
//                       },
//                     ),
//                   )
//                 : Center(
//                     child: CircularProgressIndicator(
//                       valueColor: AlwaysStoppedAnimation<Color>(
//                         Theme.of(context).primaryColor, // Red
//                       ),
//                     ),
//                   ),
//       ),
//     );
//   }
// }

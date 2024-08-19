// getLastMessage(String userId, List<dynamic> data) {
//     for (var chatData in data.reversed) {
//       var senderId = chatData.sender.id;
//       var receiverId = chatData.receiver.id;
//       if (senderId == userId || receiverId == userId) {
//         return LastMessageModel(lastMessage: chatData.message, lastmessageTime: chatData.createdAt);
//       }
//     }
//     return null; // Return null if no matching message is found
//   }

//   class LastMessageModel {
//   final String lastMessage;
//   final String lastmessageTime;

//   LastMessageModel({required this.lastMessage, required this.lastmessageTime});
// }
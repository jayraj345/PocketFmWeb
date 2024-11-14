class Event {
  final String id;
  final String userName;
  final String eventId;
  final String eventName;
  final String status;
  final String type;

  Event({
    required this.id,
    required this.userName,
    required this.eventId,
    required this.eventName,
    required this.status,
    required this.type,
  });

  // Factory constructor to create an instance of Event from JSON
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      userName: json['userName'],
      eventId: json['event_id'],
      eventName: json['event_name'],
      status: json['status'],
      type: json['type'],
    );
  }

  // Method to convert an instance of Event to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'event_id': eventId,
      'event_name': eventName,
      'status': status,
      'type': type,
    };
  }
}

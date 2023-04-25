class UserModel {
  String? uid;
  String? username;
  String? email;
  int? student_id;
  int? student_bal;

  UserModel({this.uid, this.username, this.email, this.student_id,this.student_bal});

  //Receive data from firebase

  factory UserModel.forMap(map) {
    return UserModel(
        uid: map['uid'],
        username: map['username'],
        email: map['email'],
        student_id: map['student_id'],
        student_bal: map['student_bal']
    );
  }

  //Sending data to firebase
  Map<String, dynamic> toMap() {
    return {'uid': uid, 'username': username, 'email': email, 'student_id': student_id,'student_bal':student_bal};
  }
}

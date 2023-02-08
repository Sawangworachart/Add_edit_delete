class PModel {
  int id = 0;
  String user_q = '';
  String lastname_q = '';
  String email_q = '';
  String school_q = '';
  PModel(int id, String user_q, String lastname_q, String email_q,
      String school_q) {
    this.id = id;
    this.user_q = user_q;
    this.lastname_q = lastname_q;
    this.email_q = email_q;
    this.school_q = school_q;
  }
  PModel.empty() {
    this.id = 0;
    this.user_q = '';
    this.lastname_q = '';
    this.email_q = '';
    this.school_q = '';
  }
}

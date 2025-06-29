import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _chatVisible = prefs.getInt('ff_chatVisible') ?? _chatVisible;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _filteredUsers = [];
  List<String> get filteredUsers => _filteredUsers;
  set filteredUsers(List<String> value) {
    _filteredUsers = value;
  }

  void addToFilteredUsers(String value) {
    filteredUsers.add(value);
  }

  void removeFromFilteredUsers(String value) {
    filteredUsers.remove(value);
  }

  void removeAtIndexFromFilteredUsers(int index) {
    filteredUsers.removeAt(index);
  }

  void updateFilteredUsersAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    filteredUsers[index] = updateFn(_filteredUsers[index]);
  }

  void insertAtIndexInFilteredUsers(int index, String value) {
    filteredUsers.insert(index, value);
  }

  List<AvailabilityStruct> _availability = [];
  List<AvailabilityStruct> get availability => _availability;
  set availability(List<AvailabilityStruct> value) {
    _availability = value;
  }

  void addToAvailability(AvailabilityStruct value) {
    availability.add(value);
  }

  void removeFromAvailability(AvailabilityStruct value) {
    availability.remove(value);
  }

  void removeAtIndexFromAvailability(int index) {
    availability.removeAt(index);
  }

  void updateAvailabilityAtIndex(
    int index,
    AvailabilityStruct Function(AvailabilityStruct) updateFn,
  ) {
    availability[index] = updateFn(_availability[index]);
  }

  void insertAtIndexInAvailability(int index, AvailabilityStruct value) {
    availability.insert(index, value);
  }

  List<String> _adminDept = [];
  List<String> get adminDept => _adminDept;
  set adminDept(List<String> value) {
    _adminDept = value;
  }

  void addToAdminDept(String value) {
    adminDept.add(value);
  }

  void removeFromAdminDept(String value) {
    adminDept.remove(value);
  }

  void removeAtIndexFromAdminDept(int index) {
    adminDept.removeAt(index);
  }

  void updateAdminDeptAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    adminDept[index] = updateFn(_adminDept[index]);
  }

  void insertAtIndexInAdminDept(int index, String value) {
    adminDept.insert(index, value);
  }

  bool _updateSchedule = true;
  bool get updateSchedule => _updateSchedule;
  set updateSchedule(bool value) {
    _updateSchedule = value;
  }

  DocumentReference? _getStudentRef;
  DocumentReference? get getStudentRef => _getStudentRef;
  set getStudentRef(DocumentReference? value) {
    _getStudentRef = value;
  }

  String _getStudentName = '';
  String get getStudentName => _getStudentName;
  set getStudentName(String value) {
    _getStudentName = value;
  }

  String _getUserDept = '';
  String get getUserDept => _getUserDept;
  set getUserDept(String value) {
    _getUserDept = value;
  }

  String _EditUser = '';
  String get EditUser => _EditUser;
  set EditUser(String value) {
    _EditUser = value;
  }

  String _copyEmail = '';
  String get copyEmail => _copyEmail;
  set copyEmail(String value) {
    _copyEmail = value;
  }

  bool _createCategory = false;
  bool get createCategory => _createCategory;
  set createCategory(bool value) {
    _createCategory = value;
  }

  DocumentReference? _mentalID;
  DocumentReference? get mentalID => _mentalID;
  set mentalID(DocumentReference? value) {
    _mentalID = value;
  }

  DocumentReference? _userMoodID;
  DocumentReference? get userMoodID => _userMoodID;
  set userMoodID(DocumentReference? value) {
    _userMoodID = value;
  }

  int _row = 5;
  int get row => _row;
  set row(int value) {
    _row = value;
  }

  String _emailEditID = '';
  String get emailEditID => _emailEditID;
  set emailEditID(String value) {
    _emailEditID = value;
  }

  String _moodStringID = '';
  String get moodStringID => _moodStringID;
  set moodStringID(String value) {
    _moodStringID = value;
  }

  DocumentReference? _chatReceive;
  DocumentReference? get chatReceive => _chatReceive;
  set chatReceive(DocumentReference? value) {
    _chatReceive = value;
  }

  bool _chatOn = false;
  bool get chatOn => _chatOn;
  set chatOn(bool value) {
    _chatOn = value;
  }

  String _searchMessage = '';
  String get searchMessage => _searchMessage;
  set searchMessage(String value) {
    _searchMessage = value;
  }

  String _searchEmail = '';
  String get searchEmail => _searchEmail;
  set searchEmail(String value) {
    _searchEmail = value;
  }

  String _filterDept = '';
  String get filterDept => _filterDept;
  set filterDept(String value) {
    _filterDept = value;
  }

  String _deleteUserByEmail = '';
  String get deleteUserByEmail => _deleteUserByEmail;
  set deleteUserByEmail(String value) {
    _deleteUserByEmail = value;
  }

  String _apiDeleteEmail = '';
  String get apiDeleteEmail => _apiDeleteEmail;
  set apiDeleteEmail(String value) {
    _apiDeleteEmail = value;
  }

  DocumentReference? _newClassRefCounselor;
  DocumentReference? get newClassRefCounselor => _newClassRefCounselor;
  set newClassRefCounselor(DocumentReference? value) {
    _newClassRefCounselor = value;
  }

  DateTime? _startTimePermanent =
      DateTime.fromMillisecondsSinceEpoch(1747353600000);
  DateTime? get startTimePermanent => _startTimePermanent;
  set startTimePermanent(DateTime? value) {
    _startTimePermanent = value;
  }

  DateTime? _endTimePermanent =
      DateTime.fromMillisecondsSinceEpoch(1746266400000);
  DateTime? get endTimePermanent => _endTimePermanent;
  set endTimePermanent(DateTime? value) {
    _endTimePermanent = value;
  }

  String _searchAppointment = '';
  String get searchAppointment => _searchAppointment;
  set searchAppointment(String value) {
    _searchAppointment = value;
  }

  String _getUser = '';
  String get getUser => _getUser;
  set getUser(String value) {
    _getUser = value;
  }

  String _txtSearchApp = '';
  String get txtSearchApp => _txtSearchApp;
  set txtSearchApp(String value) {
    _txtSearchApp = value;
  }

  String _txtSearchDone = '';
  String get txtSearchDone => _txtSearchDone;
  set txtSearchDone(String value) {
    _txtSearchDone = value;
  }

  String _txtSearchTrans = '';
  String get txtSearchTrans => _txtSearchTrans;
  set txtSearchTrans(String value) {
    _txtSearchTrans = value;
  }

  DateTime? _currentDate;
  DateTime? get currentDate => _currentDate;
  set currentDate(DateTime? value) {
    _currentDate = value;
  }

  List<String> _weeklyMoodLabels = [];
  List<String> get weeklyMoodLabels => _weeklyMoodLabels;
  set weeklyMoodLabels(List<String> value) {
    _weeklyMoodLabels = value;
  }

  void addToWeeklyMoodLabels(String value) {
    weeklyMoodLabels.add(value);
  }

  void removeFromWeeklyMoodLabels(String value) {
    weeklyMoodLabels.remove(value);
  }

  void removeAtIndexFromWeeklyMoodLabels(int index) {
    weeklyMoodLabels.removeAt(index);
  }

  void updateWeeklyMoodLabelsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    weeklyMoodLabels[index] = updateFn(_weeklyMoodLabels[index]);
  }

  void insertAtIndexInWeeklyMoodLabels(int index, String value) {
    weeklyMoodLabels.insert(index, value);
  }

  List<double> _weeklyMoodCounts = [];
  List<double> get weeklyMoodCounts => _weeklyMoodCounts;
  set weeklyMoodCounts(List<double> value) {
    _weeklyMoodCounts = value;
  }

  void addToWeeklyMoodCounts(double value) {
    weeklyMoodCounts.add(value);
  }

  void removeFromWeeklyMoodCounts(double value) {
    weeklyMoodCounts.remove(value);
  }

  void removeAtIndexFromWeeklyMoodCounts(int index) {
    weeklyMoodCounts.removeAt(index);
  }

  void updateWeeklyMoodCountsAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    weeklyMoodCounts[index] = updateFn(_weeklyMoodCounts[index]);
  }

  void insertAtIndexInWeeklyMoodCounts(int index, double value) {
    weeklyMoodCounts.insert(index, value);
  }

  String _newsImage = '';
  String get newsImage => _newsImage;
  set newsImage(String value) {
    _newsImage = value;
  }

  int _chatVisible = 0;
  int get chatVisible => _chatVisible;
  set chatVisible(int value) {
    _chatVisible = value;
    prefs.setInt('ff_chatVisible', value);
  }

  List<String> _weeklyTopActivities = [];
  List<String> get weeklyTopActivities => _weeklyTopActivities;
  set weeklyTopActivities(List<String> value) {
    _weeklyTopActivities = value;
  }

  void addToWeeklyTopActivities(String value) {
    weeklyTopActivities.add(value);
  }

  void removeFromWeeklyTopActivities(String value) {
    weeklyTopActivities.remove(value);
  }

  void removeAtIndexFromWeeklyTopActivities(int index) {
    weeklyTopActivities.removeAt(index);
  }

  void updateWeeklyTopActivitiesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    weeklyTopActivities[index] = updateFn(_weeklyTopActivities[index]);
  }

  void insertAtIndexInWeeklyTopActivities(int index, String value) {
    weeklyTopActivities.insert(index, value);
  }

  int _newsCount = 0;
  int get newsCount => _newsCount;
  set newsCount(int value) {
    _newsCount = value;
  }

  List<int> _newsCount1 = [];
  List<int> get newsCount1 => _newsCount1;
  set newsCount1(List<int> value) {
    _newsCount1 = value;
  }

  void addToNewsCount1(int value) {
    newsCount1.add(value);
  }

  void removeFromNewsCount1(int value) {
    newsCount1.remove(value);
  }

  void removeAtIndexFromNewsCount1(int index) {
    newsCount1.removeAt(index);
  }

  void updateNewsCount1AtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    newsCount1[index] = updateFn(_newsCount1[index]);
  }

  void insertAtIndexInNewsCount1(int index, int value) {
    newsCount1.insert(index, value);
  }

  bool _createFirstChat = false;
  bool get createFirstChat => _createFirstChat;
  set createFirstChat(bool value) {
    _createFirstChat = value;
  }

  String _searchNewMessage = '';
  String get searchNewMessage => _searchNewMessage;
  set searchNewMessage(String value) {
    _searchNewMessage = value;
  }

  String _txtSearchNewMessage = '';
  String get txtSearchNewMessage => _txtSearchNewMessage;
  set txtSearchNewMessage(String value) {
    _txtSearchNewMessage = value;
  }

  int _categoryId = 0;
  int get categoryId => _categoryId;
  set categoryId(int value) {
    _categoryId = value;
  }

  bool _sideNav = false;
  bool get sideNav => _sideNav;
  set sideNav(bool value) {
    _sideNav = value;
  }

  double _sideWidth = 0.0;
  double get sideWidth => _sideWidth;
  set sideWidth(double value) {
    _sideWidth = value;
  }

  List<String> _categoryList = [];
  List<String> get categoryList => _categoryList;
  set categoryList(List<String> value) {
    _categoryList = value;
  }

  void addToCategoryList(String value) {
    categoryList.add(value);
  }

  void removeFromCategoryList(String value) {
    categoryList.remove(value);
  }

  void removeAtIndexFromCategoryList(int index) {
    categoryList.removeAt(index);
  }

  void updateCategoryListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    categoryList[index] = updateFn(_categoryList[index]);
  }

  void insertAtIndexInCategoryList(int index, String value) {
    categoryList.insert(index, value);
  }

  int _resourcesId = 0;
  int get resourcesId => _resourcesId;
  set resourcesId(int value) {
    _resourcesId = value;
  }

  String _categoryImage = '';
  String get categoryImage => _categoryImage;
  set categoryImage(String value) {
    _categoryImage = value;
  }

  String _DboardPending = 'Pending';
  String get DboardPending => _DboardPending;
  set DboardPending(String value) {
    _DboardPending = value;
  }

  String _DboardApproved = 'Approved';
  String get DboardApproved => _DboardApproved;
  set DboardApproved(String value) {
    _DboardApproved = value;
  }

  String _DBoardUsers = 'Student';
  String get DBoardUsers => _DBoardUsers;
  set DBoardUsers(String value) {
    _DBoardUsers = value;
  }

  String _DboardDone = 'Done';
  String get DboardDone => _DboardDone;
  set DboardDone(String value) {
    _DboardDone = value;
  }

  DocumentReference? _send1;
  DocumentReference? get send1 => _send1;
  set send1(DocumentReference? value) {
    _send1 = value;
  }

  List<DocumentReference> _send2 = [];
  List<DocumentReference> get send2 => _send2;
  set send2(List<DocumentReference> value) {
    _send2 = value;
  }

  void addToSend2(DocumentReference value) {
    send2.add(value);
  }

  void removeFromSend2(DocumentReference value) {
    send2.remove(value);
  }

  void removeAtIndexFromSend2(int index) {
    send2.removeAt(index);
  }

  void updateSend2AtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    send2[index] = updateFn(_send2[index]);
  }

  void insertAtIndexInSend2(int index, DocumentReference value) {
    send2.insert(index, value);
  }

  String _sendImage = '';
  String get sendImage => _sendImage;
  set sendImage(String value) {
    _sendImage = value;
  }

  List<DocumentReference> _send3 = [];
  List<DocumentReference> get send3 => _send3;
  set send3(List<DocumentReference> value) {
    _send3 = value;
  }

  void addToSend3(DocumentReference value) {
    send3.add(value);
  }

  void removeFromSend3(DocumentReference value) {
    send3.remove(value);
  }

  void removeAtIndexFromSend3(int index) {
    send3.removeAt(index);
  }

  void updateSend3AtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    send3[index] = updateFn(_send3[index]);
  }

  void insertAtIndexInSend3(int index, DocumentReference value) {
    send3.insert(index, value);
  }

  String _dominantMood = '';
  String get dominantMood => _dominantMood;
  set dominantMood(String value) {
    _dominantMood = value;
  }

  List<int> _DboardTest = [];
  List<int> get DboardTest => _DboardTest;
  set DboardTest(List<int> value) {
    _DboardTest = value;
  }

  void addToDboardTest(int value) {
    DboardTest.add(value);
  }

  void removeFromDboardTest(int value) {
    DboardTest.remove(value);
  }

  void removeAtIndexFromDboardTest(int index) {
    DboardTest.removeAt(index);
  }

  void updateDboardTestAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    DboardTest[index] = updateFn(_DboardTest[index]);
  }

  void insertAtIndexInDboardTest(int index, int value) {
    DboardTest.insert(index, value);
  }

  List<String> _DboardTest2 = ['Online'];
  List<String> get DboardTest2 => _DboardTest2;
  set DboardTest2(List<String> value) {
    _DboardTest2 = value;
  }

  void addToDboardTest2(String value) {
    DboardTest2.add(value);
  }

  void removeFromDboardTest2(String value) {
    DboardTest2.remove(value);
  }

  void removeAtIndexFromDboardTest2(int index) {
    DboardTest2.removeAt(index);
  }

  void updateDboardTest2AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    DboardTest2[index] = updateFn(_DboardTest2[index]);
  }

  void insertAtIndexInDboardTest2(int index, String value) {
    DboardTest2.insert(index, value);
  }

  List<String> _DboardDept = [];
  List<String> get DboardDept => _DboardDept;
  set DboardDept(List<String> value) {
    _DboardDept = value;
  }

  void addToDboardDept(String value) {
    DboardDept.add(value);
  }

  void removeFromDboardDept(String value) {
    DboardDept.remove(value);
  }

  void removeAtIndexFromDboardDept(int index) {
    DboardDept.removeAt(index);
  }

  void updateDboardDeptAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    DboardDept[index] = updateFn(_DboardDept[index]);
  }

  void insertAtIndexInDboardDept(int index, String value) {
    DboardDept.insert(index, value);
  }

  DateTime? _initialTime;
  DateTime? get initialTime => _initialTime;
  set initialTime(DateTime? value) {
    _initialTime = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

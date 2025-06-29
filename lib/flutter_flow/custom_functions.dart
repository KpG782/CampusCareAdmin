import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<String> generateListOfNames(
  String authUserName,
  String otherUserName,
) {
  return [authUserName, otherUserName];
}

List<DocumentReference> generateNewListofUsers(
  DocumentReference authUser,
  DocumentReference otherUser,
) {
  return [authUser, otherUser];
}

List<double> countWeeklyMoods(List<MoodLogRecord> logs) {
  final labels = ['sadness', 'joy', 'love', 'anger', 'fear', 'surprise'];
  final counts = List<double>.filled(labels.length, 0.0);
  final cutoff = DateTime.now().subtract(Duration(days: 7));

  for (final rec in logs) {
    if (rec.date != null && rec.date!.isAfter(cutoff)) {
      final idx = labels.indexOf(rec.moodLabel ?? '');
      if (idx >= 0) {
        counts[idx] += 1;
      }
    }
  }
  return counts;
}

String getOtherUserName(
  List<String> listOfNames,
  String authUserName,
) {
  return authUserName == listOfNames.first
      ? listOfNames.last
      : listOfNames.first;
}

DocumentReference getOtherUserRef(
  List<DocumentReference> listOfUserRefs,
  DocumentReference authUserRef,
) {
  return authUserRef == listOfUserRefs.first
      ? listOfUserRefs.last
      : listOfUserRefs.first;
}

List<DateTime>? getAvailableSlots(
  List<DateTime> bookings,
  DateTime dateArg,
  List<AvailabilityStruct> availability,
) {
  final now = DateTime.now();
  final twoWeeksFromNow = now.add(Duration(days: 14));

  // Return empty list if the requested date is in the past or beyond two weeks
  if (dateArg.isBefore(now) || dateArg.isAfter(twoWeeksFromNow)) {
    return [];
  }

  List<DateTime> availableSlots = [];

  for (var avail in availability) {
    if (avail.dayofWeek == DateFormat('EEEE').format(dateArg)) {
      if (avail.hasStartTime() && avail.hasEndTime()) {
        DateTime startTime = DateTime(
          dateArg.year,
          dateArg.month,
          dateArg.day,
          avail.startTime!.hour,
          avail.startTime!.minute,
        );
        DateTime endTime = DateTime(
          dateArg.year,
          dateArg.month,
          dateArg.day,
          avail.endTime!.hour,
          avail.endTime!.minute,
        );

        while (startTime.isBefore(endTime)) {
          // Skip past slots and already booked slots
          if (startTime.isAfter(now) && !bookings.contains(startTime)) {
            availableSlots.add(startTime);
          }
          startTime = startTime.add(Duration(hours: 1));
        }
      }
    }
  }

  return availableSlots;
}

List<AvailabilityStruct>? initialAvailability() {
  // generate 7 random array for each day of the week
  final List<AvailabilityStruct> availability = [];

  final List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  for (final day in daysOfWeek) {
    // final startTime = DateTime(2023, 1, daysOfWeek.indexOf(day) + 2, 0, 0);
    // final endTime = DateTime(2023, 1, daysOfWeek.indexOf(day) + 2, 0, 0);
    availability.add(
        AvailabilityStruct(dayofWeek: day, startTime: null, endTime: null));
  }

  return availability;
}

DateTime? stringToTime(
  String? hourArg,
  DateTime? dateArg,
) {
  // output the combinatioon of date from dateArg and hourArg (HH:mm format)
  if (hourArg == null || dateArg == null) {
    return null;
  }

  final List<String> parts = hourArg.split(':');
  if (parts.length != 2) {
    return null;
  }

  final int hour = int.tryParse(parts[0]) ?? 0;
  final int minute = int.tryParse(parts[1]) ?? 0;

  return DateTime(dateArg.year, dateArg.month, dateArg.day, hour, minute);
}

String? convertToUid(DocumentReference? bookRef) {
  if (bookRef != null) {
    return bookRef.id;
  } else {
    return null;
  }
}

List<String>? countTopActivities(List<MoodLogRecord> logs) {
  // 1) Accumulate counts
  final Map<String, int> freq = {};
  final cutoff = DateTime.now().subtract(Duration(days: 7));

  for (final rec in logs) {
    // only include entries within cutoff
    if (rec.date != null && rec.date!.isAfter(cutoff)) {
      final acts = rec.activities ?? [];
      for (final a in acts) {
        if (a.trim().isEmpty) continue;
        freq[a] = (freq[a] ?? 0) + 1;
      }
    }
  }

  // 2) Sort by descending count and take top 3
  final sorted = freq.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));

  // 3) Format as “Activity (count)”
  return sorted.take(3).map((e) => '${e.key} (${e.value})').toList();
}

int findNextCategoryId(List<MentalResourcesRecord> listOfID) {
  // If no docs at all, start IDs at 1
  if (listOfID.isEmpty) {
    return 1;
  }

  // Fold over all non-null mentalID values to find the max (defaults to 0 if none)
  final maxId = listOfID
      .where((r) => r.mentalID != null) // use mentalID, not mental_ID
      .map((r) => r.mentalID!)
      .fold<int>(0, (prev, curr) => curr > prev ? curr : prev);

  // Next ID is one more than the highest found
  return maxId + 1;
}

int findNextNewsId(List<NewsRecord> listofID) {
  if (listofID.isEmpty) {
    return 1;
  }
  // Fold over all non-null IDs to find the max (defaults to 0 if none)
  final maxId = listofID
      .where((r) => r.id != null)
      .map((r) => r.id!)
      .fold<int>(0, (prev, curr) => curr > prev ? curr : prev);
  // Next ID is one more than the highest found
  return maxId + 1;
}

DateTime getDateDaysAgo(int days) {
  return DateTime.now().subtract(Duration(days: days));
}

int findNextResourcesId(List<MentalResources1Record> listOfID) {
  // If no records yet, start at 1
  if (listOfID.isEmpty) {
    return 1;
  }
  // Fold over all non-null postid values to find the max (defaults to 0 if none)
  final maxId = listOfID
      .where((r) => r.postId != null)
      .map((r) => r.postId!)
      .fold<int>(0, (prev, curr) => curr > prev ? curr : prev);
  // Next ID is one more than the highest found
  return maxId + 1;
}

DateTime? scheduledBook2(DateTime? time) {
  if (time == null) return null;

  // Subtract 4 hours from the booking time
  return time.subtract(const Duration(hours: 4));
}

List<int>? sessionTypeA(
  List<BookingsRecord>? sessionType,
  String? userDept,
) {
  if (sessionType == null || userDept == null || userDept.isEmpty) return null;

  int online = 0;

  for (var booking in sessionType) {
    if (booking.userDept == userDept && booking.sessionType == 'Online') {
      online++;
    }
  }

  return [online, 0];
}

DateTime? scheduledBook1(DateTime? time) {
  if (time == null) return null;

  // Subtract 1 day from the booking time
  return time.subtract(const Duration(days: 1));
}

String? getDominantMood(List<double>? weeklyMoodCounts) {
  if (weeklyMoodCounts == null || weeklyMoodCounts.isEmpty) return null;

  // Mood labels corresponding to chart positions
  final moodLabels = ['Sadness', 'Joy', 'Love', 'Anger', 'Fear', 'Surprise'];

  // Find the index of the max value
  int maxIndex = 0;
  for (int i = 1; i < weeklyMoodCounts.length; i++) {
    if (weeklyMoodCounts[i] > weeklyMoodCounts[maxIndex]) {
      maxIndex = i;
    }
  }

  return moodLabels[maxIndex];
}

DateTime addTwoHours(DateTime startTime) {
// Add two hours to the provided DateTime
  return DateTime(
    startTime.year,
    startTime.month,
    startTime.day,
    startTime.hour + 1,
    startTime.minute,
    startTime.second,
    startTime.millisecond,
    startTime.microsecond,
  );
}

List<int>? sessionTypeC(
  List<BookingsRecord>? sessionType,
  List<String>? userDept,
) {
  if (sessionType == null || userDept == null || userDept.isEmpty) return null;

  int online = 0;
  int faceToFace = 0;
  String dept = userDept[2]; // only count for the first department

  for (var booking in sessionType) {
    if (booking.userDept == dept) {
      if (booking.sessionType == 'Online') {
        online++;
      } else if (booking.sessionType == 'Face-to-Face') {
        faceToFace++;
      }
    }
  }

  return [online, faceToFace];
}

List<int>? sessionTypeB(
  List<BookingsRecord>? sessionType,
  String? userDept,
) {
  if (sessionType == null || userDept == null || userDept.isEmpty) return null;

  int f2f = 0;

  for (var booking in sessionType) {
    if (booking.userDept == userDept && booking.sessionType == 'Face-to-Face') {
      f2f++;
    }
  }

  return [f2f, 0];
}

String? userDeptAbbrev(String? userDept) {
  // create a custom function that checks the value of the user dept, if the same equates it to another value. example (userDept = College of Computing and Information Sciences, return value shall be "CCIS")
  if (userDept == null || userDept.isEmpty) return null;

  if (userDept == 'College of Computing and Information Sciences') {
    return 'CCIS';
  } else if (userDept == 'School of Law') {
    return 'SOL';
  } else if (userDept == 'Institute of Pharmacy ') {
    return 'IOP';
  } else if (userDept == 'Institute of Nursing') {
    return 'ION';
  } else if (userDept == 'Institute of Imaging Health Sciences') {
    return 'IIHS';
  } else if (userDept == 'Institute of Psychology') {
    return 'IOPSYCH';
  } else if (userDept == 'Institute of Arts and Design') {
    return 'IAD';
  } else if (userDept ==
      'Institute for Social Development and Nation Building') {
    return 'ISDNB';
  } else if (userDept == 'Institute of Accountancy') {
    return 'IOA';
  } else if (userDept == 'College of Human Kinetics') {
    return 'CHK';
  } else if (userDept == 'College of Business and Financial Sciences') {
    return 'CBFS';
  } else if (userDept == 'College of Technology Management') {
    return 'CTM';
  } else if (userDept == 'Higher School ng UMak') {
    return 'HSU';
  } else if (userDept ==
      'College of Continuing, Advanced and Professional Studies') {
    return 'CCAPS';
  } else if (userDept == 'College of Innovative Teacher Education') {
    return 'CITE';
  } else if (userDept == 'College of Construction Sciences and Engineering') {
    return 'CCSE';
  }

  // Return null if no match found
  return null;
}

String? initialQuote() {
  List<String> quotes = [
    '"There is no health without mental health."\n\n- David Satcher',
    '"You are more precious to this world than you\'ll ever know."\n\n- Lili Rhinehart',
    '"No matter what people tell you, words and ideas can change the world."\n\n- Robin Williams',
    '"The part can never be well unless the whole is well."\n\n- Plato',
    '"You can\'t teach if you\'re not addressing mental health."\n\n- Rene Myers',
  ];

  int randomIndex = math.Random().nextInt(quotes.length);
  return quotes[randomIndex];
}

DateTime? initialTime(DateTime? currentTime) {
  // create a custom function that adds 3 seconds to the value of the argument then returns that same value
  if (currentTime == null) return null; // Check for null
  return currentTime.add(Duration(seconds: 5)); // Add 3 seconds
}

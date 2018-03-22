import 'dart:async';
import 'package:flutter_sandbox/Models/Contact.dart';

abstract class ContactsRepository {
  Future<List<Contact>> fetchContacts();
}
import 'dart:async';
import 'package:flutter_sandbox/Model/Contact.dart';

abstract class ContactsRepository {
  Future<List<Contact>> fetchContacts();
}
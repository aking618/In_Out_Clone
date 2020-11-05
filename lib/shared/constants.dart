import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: deepSpaceSparkle, width: 2.0),
  ),
);

const Color lightPink = Color.fromRGBO(237, 175, 184, 1.0);
const Color champagnePink = Color.fromRGBO(247, 225, 215, 1.0);
const Color timberwolf = Color.fromRGBO(246, 246, 243, 1.0);
const Color cambridgeBlue = Color.fromRGBO(176, 196, 177, 1.0);
const Color deepSpaceSparkle = Color.fromRGBO(74, 87, 89, 1.0);

const buttonTextStyle = TextStyle(color: Colors.white, fontSize: 20.0);

const List<String> locations = [
  '4HYD',
  'Agriculture Hall(AGH)',
  'Alumni Center',
  'ANSI',
  'Architecture',
  'ATRC',
  'Bartlett',
  'Boone Pickens Stadium',
  'Botanical Gardens',
  'BUS',
  'Canvas',
  'CDL',
  'CLB',
  'CLBN',
  'Colvin',
  'CP-Central Plant',
  'CVM-College of Veterinary Medicine',
  'EN',
  'ENDV',
  'ES',
  'FAPC',
  'General Academic Building (GAB)',
  'Gunderson',
  'Hanner',
  'HBRC',
  'HSCI',
  'Human Sciences North (HSN)',
  'ITLE',
  'ITLE-Server',
  'JB',
  'Library',
  'LSE',
  'LSW',
  'Master Control',
  'McElroy Hall',
  'Morrill',
  'MSCS',
  'Murray',
  'NRC',
  'Old Central',
  'Other',
  'PIO',
  'PS',
  'Scott-Parker-Wentz',
  'SCPA',
  'Stout',
  'STOUT (Stout Hall)',
  'Student Union',
  'Thatcher',
  'VTH',
  'Wellness Center',
  'Wes Watkins Center',
  'Whitehurst',
  'Willard'
];

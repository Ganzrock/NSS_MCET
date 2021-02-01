import 'package:flutter/material.dart';

class OurTeamItem {
  final String name;
  final String position;
  final String dep;
  final String year;
  final String imageName;
  final Color color;

  OurTeamItem(
      {@required this.name,
      @required this.position,
      this.dep,
      this.year,
      @required this.imageName,
      this.color});
}

class OurTeam {
  static List<OurTeamItem> ourTeam2019 = [
    OurTeamItem(
      name: 'DR. N. PANKAJAM',
      position: 'Program Officer',
      dep: 'S&F',
      year: '',
      imageName: 'nss',
      color: Colors.white,
    ),
    OurTeamItem(
      name: 'DR R. RAMESH',
      position: 'Program Officer',
      dep: 'UNIT - I',
      year: '',
      imageName: 'nss',
      color: Colors.white,
    ),
    OurTeamItem(
      name: 'DR. N. MARIAPPAN',
      position: 'Program Officer',
      dep: 'UNIT - II',
      year: '',
      imageName: 'nss',
      color: Colors.white,
    ),
    OurTeamItem(
      name: 'SACHITANANDHAM',
      position: 'Senior Volunteer',
      dep: 'B.E - Mech',
      year: '2017 - 2021',
      imageName: 'sachi',
      color: Colors.indigo[300],
    ),
    OurTeamItem(
      name: 'JANANI',
      position: 'Senior Volunteer',
      dep: 'B.E - CIVIL',
      year: '2017 - 2021',
      imageName: 'janani',
      color: Colors.yellow[100],
    ),
    OurTeamItem(
      name: 'MUKESH',
      position: 'Senior Volunteer',
      dep: 'B.E - MCE',
      year: '2017 - 2021',
      imageName: 'mukesh',
      color: Colors.black54,
    ),
    OurTeamItem(
      name: 'NIVEDHEETHAA',
      position: 'Senior Volunteer',
      dep: 'B.E - ECE',
      year: '2017 - 2021',
      imageName: 'nivi',
      color: Colors.lightGreen[100],
    ),
    OurTeamItem(
      name: 'VIJAY SHIMAN',
      position: 'Senior Volunteer',
      dep: 'B.E - PROD',
      year: '2017 - 2021',
      imageName: 'vijay',
      color: Colors.black,
    ),
    OurTeamItem(
      name: 'GOMATHY',
      position: 'Senior Volunteer',
      dep: 'B.E - CSE',
      year: '2017 - 2021',
      imageName: 'gomathy',
      color: Colors.red[200],
    ),
    OurTeamItem(
      name: 'SHAFIUDEEN',
      position: 'Senior Volunteer',
      dep: 'B.E - ECE',
      year: '2017 - 2021',
      imageName: 'shafi',
      color: Colors.amber[100],
    ),
    OurTeamItem(
      name: 'MOGANA SUNDARI',
      position: 'Senior Volunteer',
      dep: 'B.E - EEE',
      year: '2017 - 2021',
      imageName: 'mogana',
      color: Colors.pink[100],
    ),
    OurTeamItem(
      name: 'GNANA GANESH',
      position: 'Senior Volunteer',
      dep: 'B.E - CSE',
      year: '2017 - 2021',
      imageName: 'ganesh',
      color: Colors.white,
    ),
    OurTeamItem(
      name: 'PRAGATI',
      position: 'Senior Volunteer',
      dep: 'B.E - E&I',
      year: '2017 - 2021',
      imageName: 'pragati',
      color: Colors.lightBlue[100],
    ),
  ];

  static List<OurTeamItem> ourTeam2018 = [
    OurTeamItem(
      name: 'DR. N. PANKAJAM',
      position: 'Program Officer',
      dep: 'S&F',
      year: '',
      imageName: 'nss',
      color: Colors.white,
    ),
    OurTeamItem(
      name: 'DR R. Magesh',
      position: 'Program Officer',
      dep: 'UNIT - I',
      year: '',
      imageName: 'nss',
      color: Colors.white,
    ),
    OurTeamItem(
      name: 'DR. SriRamChandran',
      position: 'Program Officer',
      dep: 'UNIT - II',
      year: '',
      imageName: 'nss',
      color: Colors.white,
    ),
    OurTeamItem(
      name: 'Devaraj',
      position: 'Senior Volunteer',
      dep: 'B.E - AUTO',
      year: '2016 - 2020',
      imageName: 'nss',
      color: Colors.pink[300],
    ),
    OurTeamItem(
      name: 'Sangeetha',
      position: 'Senior Volunteer',
      dep: 'B.E - IT',
      year: '2016 - 2020',
      imageName: 'nss',
      color: Colors.red[100],
    ),
    OurTeamItem(
      name: 'Sanjay',
      position: 'Senior Volunteer',
      dep: 'B.E - AUTO',
      year: '2016 - 2020',
      imageName: 'nss',
      color: Colors.grey,
    ),
    OurTeamItem(
      name: 'Gowsalya',
      position: 'Senior Volunteer',
      dep: 'B.E - ECE',
      year: '2016 - 2020',
      imageName: 'nss',
      color: Colors.blue[100],
    ),
    OurTeamItem(
      name: 'Ragu',
      position: 'Senior Volunteer',
      dep: 'B.E - EEE',
      year: '2016 - 2020',
      imageName: 'nss',
      color: Colors.orange[100],
    ),
    OurTeamItem(
      name: 'Yoga Shree',
      position: 'Senior Volunteer',
      dep: 'B.E - ECE',
      year: '2016 - 2020',
      imageName: 'nss',
      color: Colors.cyan[100],
    ),
    OurTeamItem(
      name: 'Bharath',
      position: 'Senior Volunteer',
      dep: 'B.E - ECE',
      year: '2016 - 2020',
      imageName: 'nss',
      color: Colors.amber[100],
    ),
    OurTeamItem(
      name: 'Rubika',
      position: 'Senior Volunteer',
      dep: 'B.E - E&I',
      year: '2016 - 2020',
      imageName: 'nss',
      color: Colors.lightGreenAccent[100],
    ),
    OurTeamItem(
      name: 'Anand',
      position: 'Senior Volunteer',
      dep: 'B.E - MECH',
      year: '2016 - 2020',
      imageName: 'nss',
      color: Colors.black54,
    ),
    OurTeamItem(
      name: 'Kaviya',
      position: 'Senior Volunteer',
      dep: 'B.E - EEE',
      year: '2016 - 2020',
      imageName: 'nss',
      color: Colors.lightBlueAccent[100],
    ),
  ];
  static List<OurTeamItem> ourTeam2017 = [
    OurTeamItem(
      name: 'DR. N. PANKAJAM',
      position: 'Program Officer',
      dep: 'S&F',
      year: '',
      imageName: 'nss',
      color: Colors.white,
    ),
    OurTeamItem(
      name: 'DR R. Magesh',
      position: 'Program Officer',
      dep: 'UNIT - I',
      year: '',
      imageName: 'nss',
      color: Colors.white,
    ),
    OurTeamItem(
      name: 'DR. SriRamChandran',
      position: 'Program Officer',
      dep: 'UNIT - II',
      year: '',
      imageName: 'nss',
      color: Colors.white,
    ),
  ];
  static List<OurTeamItem> ourTeam2016 = [
    OurTeamItem(
      name: 'DR. N. PANKAJAM',
      position: 'Program Officer',
      dep: 'S&F',
      year: '',
      imageName: 'nss',
      color: Colors.white,
    ),
    OurTeamItem(
      name: 'DR R. Magesh',
      position: 'Program Officer',
      dep: 'UNIT - I',
      year: '',
      imageName: 'nss',
      color: Colors.white,
    ),
    OurTeamItem(
      name: 'DR. SriRamChandran',
      position: 'Program Officer',
      dep: 'UNIT - II',
      year: '',
      imageName: 'nss',
      color: Colors.white,
    ),
  ];
  static List<OurTeamItem> ourTeam2015 = [];
  static List<OurTeamItem> ourTeam2014 = [];
  static List<OurTeamItem> ourTeam2013 = [];
  static List<OurTeamItem> ourTeam2012 = [];
  static List<OurTeamItem> ourTeam2011 = [];
  static List<OurTeamItem> ourTeam2010 = [];
  static List<OurTeamItem> ourTeam2009 = [];
  static List<OurTeamItem> ourTeam2008 = [];
  static List<OurTeamItem> ourTeam2007 = [];
}

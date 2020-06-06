import 'package:url_launcher/url_launcher.dart';
import 'package:hth/helper/phone_24h_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            child: Center(
              child: Text(
                'Useful Helplines',
                style: TextStyle(
                  color: Colors.blueGrey[700],
                  letterSpacing: 2.0,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'IndieFlower',
                ),
              ),
            ),
          ),
          Helpline(
            name: 'National Care Hotline',
            num: '1800 202 6868',
            opens24h: true,
          ),
          HelplineTitle(
              title: 'Mental-Wellbeing'
          ),
          Helpline(
            name: 'Institute of Mental Health’s Mental Health Helpline',
            num: '6389 2222',
            opens24h: true,
          ),
          Helpline(
            name: 'Samaritans of Singapore',
            num: '1800 221 4444',
            opens24h: true,
          ),
          Helpline(
            name: 'Silver Ribbon Singapore',
            num: '6385 3714',
            opens24h: false,
          ),
          HelplineTitle(
              title: 'Violence or Abuse'
          ),
          Helpline(
            name: 'Big Love Child Protection Specialist Centre',
            num: '6445 0400',
            opens24h: false,
          ),
          Helpline(
            name: 'HEART @ Fei Yue Child Protection Specialist Centre',
            num: '6819 9170',
            opens24h: false,
          ),
          Helpline(
            name: 'PAVE Integrated Services for Individual and Family Protection',
            num: '6555 0390',
            opens24h: false,
          ),
          Helpline(
            name: 'Care Corner Project StART',
            num: '6476 1482',
            opens24h: false,
          ),
          Helpline(
            name: 'TRANS SAFE Centre',
            num: '6449 9088',
            opens24h: false,
          ),
          HelplineTitle(
              title: 'Counselling'
          ),
          Helpline(
            name: 'TOUCHline (Counselling)',
            num: '1800 377 2252',
            opens24h: true,
          ),
          Helpline(
            name: 'WINGS Counselling Centre',
            num: '6383 5745',
            opens24h: false,
          ),
          HelplineTitle(
              title: 'For Caregivers'
          ),
          Helpline(
            name: 'Dementia Helpline (Alzheimer\'s Disease Association)',
            num: '6377 0700',
            opens24h: false,
          ),
          Helpline(
            name: 'AWWA Caregiver Service (Disability)',
            num: '1800 299 2992',
            opens24h: false,
          ),
          Helpline(
            name: 'Touch Care Line',
            num: '6804 6555',
            opens24h: false,
          ),
          HelplineTitle(
              title: 'Financial Help and Legal Aid'
          ),
          Helpline(
            name: 'ComCare',
            num: '1800 222 0000',
            opens24h: false,
          ),
          Helpline(
            name: 'Legal Aid Bureau',
            num: '1800 225 5529',
            opens24h: false,
          ),
          HelplineTitle(
              title: 'Health Hotlines'
          ),
          Helpline(
            name: 'Singapore Silver Line',
            num: '1800 650 6060',
            opens24h: false,
          ),
          Helpline(
            name: 'HPB HealthLine',
            num: '1800 223 1313',
            opens24h: false,
          ),
          Helpline(
            name: 'Babes Pregnancy Crisis Support Ltd',
            num: '8111 3535',
            opens24h: true,
          ),
          Helpline(
            name: 'QuitLine',
            num: '1800 438 2000',
            opens24h: false,
          ),
        ],
      ),
    );
  }
}

class HelplineTitle extends StatelessWidget {

  HelplineTitle({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.blueGrey[500],
                letterSpacing: 2.0,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'IndieFlower',
                backgroundColor: Colors.blueGrey[100]
            ),
          )
      ),
    );
  }
}

class Helpline extends StatelessWidget {
  Helpline({this.name, this.num, this.opens24h});

  final String name;
  final String num;
  final bool opens24h;

  _calling(String number) async {
    final url = 'tel:$number';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)
      ),
      child: InkWell(
        onTap: () => _calling(num),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(
                          fontFamily: 'Arapey',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
              Opens24h(
                  opens24h
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      num,
                      style: TextStyle(
                          fontFamily: 'Arapey',
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Opens24h(bool opens24h) {
    if (opens24h == true) {
      return Icon(Phone_24h.i24_hours_phone_service);
    }
    return SizedBox(width: 0.0);
  }
}

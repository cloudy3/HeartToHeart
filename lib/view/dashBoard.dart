import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

double content_padding_amount = 10.0; //The space between each rows

//Actual links
String link_Url1 = 'https://www.gov.sg/article/tips-for-battling-stress-and-anxiety-during-covid-19';
String link_Url2 = 'https://www.sera.sg/en/index.php/covid-19-mental-resilience-and-wellness-talk/';
String link_Url3 = 'https://www.singaporelawwatch.sg/Headlines/singapores-covid-19-circuit-breaker-ends-on-june-1-economy-to-reopen-in-three-phases';
String link_Url4 = 'https://www.imh.com.sg/wellness/page.aspx?id=356';
String link_Url5 = 'https://www.healthhub.sg/live-healthy/561/mentalillnessesfacedbyadults';
String link_Url6 = 'https://www.mentalhealth.org.uk/publications/supporting-someone-mental-health-problem';
String link_Url7 = 'https://athealth.com/mental-health-topics/';
String link_Url8 = 'https://www.mayoclinic.org/diseases-conditions/post-traumatic-stress-disorder/symptoms-causes/syc-20355967';
String link_Url9 = 'https://www.psychologytoday.com/sg/blog/women-s-mental-health-matters/201510/9-ways-you-can-improve-your-mental-health-today';
String link_Url10 = 'https://www.samhealth.org.sg/understanding-mental-health/what-is-mental-illness/';
String link_Url11 = 'https://medicalfuturist.com/improve-mental-health-with-technology/';

//Title of the links
String title_Url1 = 'Tips for Battling Stress and Anxiety during COVID-19';
String title_Url2 = 'About COVID-19 Mental Resilience And Wellness Talk';
String title_Url3 = 'Singapore\'s Covid-19 circuit breaker ends on June 1; economy to reopen in three phases';
String title_Url4 = 'Understanding your mental health';
String title_Url5 = 'Mental illnesses faced by adults';
String title_Url6 = 'How to support someone with a mental health problem';
String title_Url7 = 'Mental health topics';
String title_Url8 = 'Post-traumatic stress disorder (PTSD) - Symptoms and causes';
String title_Url9 = '9 Ways you can improve your mental health today';
String title_Url10 = 'What is mental illness';
String title_Url11 = 'How to improve your mental health with technology';

//Description of the links
String description_Url1 = '\"COVID-19 is turning our lives upside down, and some people may feel stressed and anxious. Here is some advice on how you can cope.\"';
String description_Url2 = '\"COVID-19 Mental Resilience and Wellness Talk by SERA and Singapore Counselling Centre\"';
String description_Url3 = '\"Phases could be rolled back should the outbreak flare up again.\"';
String description_Url4 = '\"Being mentally or emotionally healthy is much more than being free of depression, anxiety, or other psychological issues\"';
String description_Url5 = '\"Some commonly known mental illnesses affecting adults\"';
String description_Url6 = '\"Whether they are a friend, family member or colleague, there are many ways to support somebody you care about\"';
String description_Url7 = '\"A comprehensive list of mental health issues\"';
String description_Url8 = '\"After surviving a traumatic event, many people have PTSD-like symptoms at first, such as being unable to stop thinking about what\'s happened\"';
String description_Url9 = '\"Mental health is much more than a diagnosis. It\'s your overall psychological well-being—the way you feel about yourself and others\"';
String description_Url10 = '\"Do we truly understand mental illness?\"';
String description_Url11 = '\"Technology and mental well-being might seem like profoundly antagonistic terms. However, there are excellent digital tools to help you reach mindfulness and to practice meditation\"';

class DashBoard extends StatelessWidget {
  @override
  void _launchUrl(String Url) async{
    if(await canLaunch(Url)){
      await launch(Url);
    }
    else{
      throw 'Cannot not open Url';
    }
  }

  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text(title_Url1,
            style: TextStyle(
                color: Colors.blueGrey[700],
                letterSpacing: 2.0,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'IndieFlower'
            ),
          ),
          subtitle: Text(description_Url1),
          trailing: Icon(Icons.keyboard_arrow_right),
          contentPadding: EdgeInsets.all(content_padding_amount),
          onTap: () {
            _launchUrl(link_Url1);
          },
        ),
        SizedBox(
          height: 20,
          width: 150.0,
          child: Divider(
            thickness: 1.0,
            color: Colors.black,
          ),
        ),

        ListTile(
          title: Text(title_Url2,
            style: TextStyle(
                color: Colors.blueGrey[700],
                letterSpacing: 2.0,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'IndieFlower'
            ),
          ),
          subtitle: Text(description_Url2),
          trailing: Icon(Icons.keyboard_arrow_right),
          contentPadding: EdgeInsets.all(content_padding_amount),
          onTap: () {
            _launchUrl(link_Url2);
          },
        ),
        SizedBox(
          height: 20,
          width: 150.0,
          child: Divider(
            thickness: 1.0,
            color: Colors.black,
          ),
        ),

        ListTile(
          title: Text(title_Url3,
            style: TextStyle(
                color: Colors.blueGrey[700],
                letterSpacing: 2.0,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'IndieFlower'
            ),
          ),
          subtitle: Text(description_Url3),
          trailing: Icon(Icons.keyboard_arrow_right),
          contentPadding: EdgeInsets.all(content_padding_amount),
          onTap: () {
            _launchUrl(link_Url3);
          },
        ),
        SizedBox(
          height: 20,
          width: 150.0,
          child: Divider(
            thickness: 1.0,
            color: Colors.black,
          ),
        ),

        ListTile(
          title: Text(title_Url4,
            style: TextStyle(
                color: Colors.blueGrey[700],
                letterSpacing: 2.0,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'IndieFlower'
            ),
          ),
          subtitle: Text(description_Url4),
          trailing: Icon(Icons.keyboard_arrow_right),
          contentPadding: EdgeInsets.all(content_padding_amount),
          onTap: () {
            _launchUrl(link_Url4);
          },
        ),
        SizedBox(
          height: 20,
          width: 150.0,
          child: Divider(
            thickness: 1.0,
            color: Colors.black,
          ),
        ),

        ListTile(
          title: Text(title_Url5,
            style: TextStyle(
                color: Colors.blueGrey[700],
                letterSpacing: 2.0,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'IndieFlower'
            ),
          ),
          subtitle: Text(description_Url5),
          trailing: Icon(Icons.keyboard_arrow_right),
          contentPadding: EdgeInsets.all(content_padding_amount),
          onTap: () {
            _launchUrl(link_Url5);
          },
        ),
        SizedBox(
          height: 20,
          width: 150.0,
          child: Divider(
            thickness: 1.0,
            color: Colors.black,
          ),
        ),

        ListTile(
          title: Text(title_Url6,
            style: TextStyle(
                color: Colors.blueGrey[700],
                letterSpacing: 2.0,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'IndieFlower'
            ),
          ),
          subtitle: Text(description_Url6),
          trailing: Icon(Icons.keyboard_arrow_right),
          contentPadding: EdgeInsets.all(content_padding_amount),
          onTap: () {
            _launchUrl(link_Url6);
          },
        ),
        SizedBox(
          height: 20,
          width: 150.0,
          child: Divider(
            thickness: 1.0,
            color: Colors.black,
          ),
        ),

        ListTile(
          title: Text(title_Url7,
            style: TextStyle(
                color: Colors.blueGrey[700],
                letterSpacing: 2.0,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'IndieFlower'
            ),
          ),
          subtitle: Text(description_Url7),
          trailing: Icon(Icons.keyboard_arrow_right),
          contentPadding: EdgeInsets.all(content_padding_amount),
          onTap: () {
            _launchUrl(link_Url7);
          },
        ),
        SizedBox(
          height: 20,
          width: 150.0,
          child: Divider(
            thickness: 1.0,
            color: Colors.black,
          ),
        ),

        ListTile(
          title: Text(title_Url8,
            style: TextStyle(
                color: Colors.blueGrey[700],
                letterSpacing: 2.0,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'IndieFlower'
            ),
          ),
          subtitle: Text(description_Url8),
          trailing: Icon(Icons.keyboard_arrow_right),
          contentPadding: EdgeInsets.all(content_padding_amount),
          onTap: () {
            _launchUrl(link_Url8);
          },
        ),
        SizedBox(
          height: 20,
          width: 150.0,
          child: Divider(
            thickness: 1.0,
            color: Colors.black,
          ),
        ),

        ListTile(
          title: Text(title_Url9,
            style: TextStyle(
                color: Colors.blueGrey[700],
                letterSpacing: 2.0,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'IndieFlower'
            ),
          ),
          subtitle: Text(description_Url9),
          trailing: Icon(Icons.keyboard_arrow_right),
          contentPadding: EdgeInsets.all(content_padding_amount),
          onTap: () {
            _launchUrl(link_Url9);
          },
        ),
        SizedBox(
          height: 20,
          width: 150.0,
          child: Divider(
            thickness: 1.0,
            color: Colors.black,
          ),
        ),

        ListTile(
          title: Text(title_Url10,
            style: TextStyle(
                color: Colors.blueGrey[700],
                letterSpacing: 2.0,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'IndieFlower'
            ),
          ),
          subtitle: Text(description_Url10),
          trailing: Icon(Icons.keyboard_arrow_right),
          contentPadding: EdgeInsets.all(content_padding_amount),
          onTap: () {
            _launchUrl(link_Url10);
          },
        ),
        SizedBox(
          height: 20,
          width: 150.0,
          child: Divider(
            thickness: 1.0,
            color: Colors.black,
          ),
        ),

        ListTile(
          title: Text(title_Url11,
            style: TextStyle(
                color: Colors.blueGrey[700],
                letterSpacing: 2.0,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'IndieFlower'
            ),
          ),
          subtitle: Text(description_Url11),
          trailing: Icon(Icons.keyboard_arrow_right),
          contentPadding: EdgeInsets.all(content_padding_amount),
          onTap: () {
            _launchUrl(link_Url11);
          },
        ),
        SizedBox(
          height: 20,
          width: 150.0,
          child: Divider(
            thickness: 1.0,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

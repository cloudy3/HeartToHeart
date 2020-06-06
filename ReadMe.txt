--------
Summary:
--------

HeartToHeart(HtH) is an android application that provides the user with various venues related to mental wellness. Whether the user is seeking help or knowledge on mental wellness, it can be achieved through the use of this application. 

--------------------
Tech/Framework used:
--------------------

Built with
- Flutter

--------
Details:
--------

As mental health issues are more prevalent in the current society with little information about it, HeartToHeart(HtH) aims to raise awareness of mental health in Singapore. 

Additionally to raising awareness, the application allows the users to interact with professional counsellors/therapists anonymously. As some people are not able to seek counsellors/therapists in real life for various reasons (e.g. sessions are too pricey, afraid of face-to-face interaction etc) this application will be able to cater to such users. This is even more prevalent now due to the circuit breaker in Singapore. 

The HtH chatting function uses Firebase as a cloud storage for the peer-to-peer messaging. It also has security features that prevent the data from being read/written.

To use HtH:
- When the application is started, a login page will be displayed.
- An account is required to use the application and it can be created under the ‘Register Now’ button.
- To create an account, the user will need to enter a username, an email and a password (of at least 6 characters).
- As the real name is not required, the person can comfortably seek help from a professional using a makeshift name (username).
- Under the ‘Sign Up’ button, the user can click on the ‘Sign in now’ button to return to the login page, where the user can login with the email and password used to create the account.
- The person seeking help will be able to search for the professional’s name and start a chat.
- To test out the chatting with a dummy user, search for ‘WiseTulip’ or ‘SadTomato’ and then click on the search icon.
- The professional/counsellor’s name will appear together with the message icon, where you can start a chat session.
- A logout button is located on the top right hand corner of the screen.
- Chats with the counsellor will be saved and can be accessed after logging in again.
- Below is a run down of the 3 tabs shown after logging in:
- The first tab is a direct interaction via messaging a health professional/counsellor. 
- All chats will be saved here.
- The second tab consists of various links of news that are related to crisis and mental wellness, should the user prefer a less direct approach.
- When a particular headline is tapped on, it opens the browser of that particular article.
- The final tab displays a list of hotlines where users may find useful in times of need, such as counselling or any aid they require.
- When the hotline is tapped on, it immediately shows the number on the user’s phone dialer.

----------------------
Release (Version 1.0):
----------------------

Features that can be further deployed for the application but not added due to time constraints
- Presumably, the search function for the professional’s name should only allow users to find professionals registered with the application. However, the search function now only allows the users to find other users registered in the database. This only allows users to talk to each other like a normal messaging interface.
- For the articles listed in the second tab, the articles should be updated with the latest news related to mental health daily. However, the articles are not updated in real-time and manually added into the application.
- Initially, a feature that allows the user to stay signed-in, even after exiting the application, was implemented. However, there was a bug where the user sometimes automatically signs-in after signing-out and exiting the yulication. As a result, the feature was removed.

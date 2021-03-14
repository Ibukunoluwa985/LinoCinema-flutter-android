import 'dart:ui';

import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 56.0),
        child: Container(
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Row(
                  children: [
                    Icon(Icons.privacy_tip),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Privacy policy',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  "Linocinema's policy to respect your privacy regarding any information we may collect from you across our website, 'https://www.linocinema.com.' \n\n" +
                      "We only ask for personal information when we truly need it to provide a service to you such as login, registration, recommendation system and so on. We collect it by fair and lawful means, with your knowledge and consent. Due to our respectful policy to user privacy, we hide sensitive information such as user's password. \n\n" +
                      "We only retain collected information for as long as necessary to provide you with your requested service. What data we store, we’ll protect within commercially acceptable means to prevent loss and theft, as well as unauthorized access, disclosure, copying, use or modification. \n\n" +
                      "We don’t share any personally identifying information publicly or with third-parties, except when required to by law. \n\n" +
                      "Our website may link to external sites that are not operated by us. Please be aware that we have no control over the content and practices of these sites, and cannot accept responsibility or liability for their respective privacy policies. \n\n" +
                      "You are free to refuse our request for your personal information, with the understanding that we may be unable to provide you with some of your desired services. \n\n" +
                      "Your continued use of our website will be regarded as acceptance of our practices around privacy and personal information. If you have any questions about how we handle user data and personal information, feel free to contact us. \n\n" +
                      "Due to been an open source web application using the MIT license, our product are open and free to use. \n\n" +
                      "This policy is effective as of 7 January 2021. \n\n",
                  overflow: TextOverflow.clip,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(Icons.verified),
                    Text(
                      ' MIT License',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
                Text(
                  "Copyright (c) 2021 Linocinema' \n\n" +
                      'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: \n\n' +
                      "The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. \n\n" +
                      'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. \n\n',
                  overflow: TextOverflow.clip,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

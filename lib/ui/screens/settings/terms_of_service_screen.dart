import 'dart:ui';

import 'package:flutter/material.dart';

class TermsOfService extends StatefulWidget {
  @override
  _TermsOfServiceState createState() => _TermsOfServiceState();
}

class _TermsOfServiceState extends State<TermsOfService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    Icon(Icons.description),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Terms of service',
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
                  "1. Terms \n\n" +
                      "By accessing the website at https://www.linocinema.com, you are agreeing to be bound by these terms of service, all applicable laws and regulations, and agree that you are responsible for compliance with any applicable local laws. If you do not agree with any of these terms, you are prohibited from using or accessing this site. The materials contained in this website are protected by applicable copyright and trademark law. \n\n" +
                      "2. Use License \n\n" +
                      'a. Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: \n' +
                      "b. The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. \n\n" +
                      "3. Disclaimer \n\n" +
                      "a. The materials on Linocinema's website are provided on an 'as is' basis. Linocinema makes no warranties, expressed or implied, and hereby disclaims and negates all other warranties including, without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights. \n" +
                      "b. Further, Linocinema does not warrant or make any representations concerning the accuracy, likely results, or reliability of the use of the materials on its website or otherwise relating to such materials or on any sites linked to this site. \n\n" +
                      "4. Limitations \n\n" +
                      "In no event shall Linocinema or its suppliers be liable for any damages (including, without limitation, damages for loss of data or profit, or due to business interruption) arising out of the use or inability to use the materials on Linocinema's website, even if Linocinema or a Linocinema authorized representative has been notified orally or in writing of the possibility of such damage. Because some jurisdictions do not allow limitations on implied warranties, or limitations of liability for consequential or incidental damages, these limitations may not apply to you. \n\n" +
                      "5. Accuracy of materials \n\n" +
                      "The materials appearing on Linocinema's website could include technical, typographical, or photographic errors. Linocinema does not warrant that any of the materials on its website are accurate, complete or current. Linocinema may make changes to the materials contained on its website at any time without notice. However Linocinema does not make any commitment to update the materials. \n\n" +
                      "6. Links \n\n" +
                      "Linocinema has not reviewed all of the sites linked to its website and is not responsible for the contents of any such linked site. The inclusion of any link does not imply endorsement by Linocinema of the site. Use of any such linked website is at the user's own risk. \n\n" +
                      "7. Modifications \n\n" +
                      "Linocinema may revise these terms of service for its website at any time without notice. By using this website you are agreeing to be bound by the then current version of these terms of service. \n",
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

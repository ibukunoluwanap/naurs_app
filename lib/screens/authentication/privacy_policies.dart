import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:naurs/utils/colors.dart';

Future privacyPolicies(context, dHeight) {
  return showCupertinoModalBottomSheet(
    context: context,
    barrierColor: Colors.transparent,
    topRadius: const Radius.circular(20),
    builder: (context) => SizedBox(
      height: (dHeight / 100) * 80,
      child: Scaffold(
        backgroundColor: secondary,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Privacy Policy",
                  style: TextStyle(
                      color: primary,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              _privacyPolicy(),
              const SizedBox(height: 10.0),
              _consent(),
              const SizedBox(height: 10.0),
              _informationWeCollect(),
              const SizedBox(height: 10.0),
              _howWeUseYourInformation(),
              const SizedBox(height: 10.0),
              _logFiles(),
              const SizedBox(height: 10.0),
              _cookiesAndWebBeacons(),
              const SizedBox(height: 10.0),
              _advertisingPartnersPrivacyPolicies(),
              const SizedBox(height: 10.0),
              _thirdPartyPrivacyPolicies(),
              const SizedBox(height: 10.0),
              _gDPRDataProtectionRights(),
              const SizedBox(height: 10.0),
              _childrenInformation(),
              const SizedBox(height: 30.0),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Finance Policy",
                  style: TextStyle(
                      color: primary,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
              _financePolicy(),
              const SizedBox(height: 10.0),
              _cardsPolicy(),
              const SizedBox(height: 10.0),
              _services(),
              const SizedBox(height: 10.0),
              _refundPolicy(),
              const SizedBox(height: 10.0),
              _shippingPolicy(),
              const SizedBox(height: 10.0),
              _cancellationPolicy(),
              const SizedBox(height: 10.0),
              _governingLawPolicy(),
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _privacyPolicy() {
  return Column(children: const [
    Text(
      "At Naurs, accessible from https://www.naurs.me/, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by Naurs and how we use it.",
      style: TextStyle(color: primary, fontSize: 12),
    ),
    SizedBox(
      height: 10.0,
    ),
    Text(
      "If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.",
      style: TextStyle(color: primary, fontSize: 12),
    ),
    SizedBox(
      height: 10.0,
    ),
    Text(
      "This Privacy Policy applies only to our online activities and is valid for visitors to our website and mobile applications with regards to the information that they shared and/or collect in Naurs. This policy is not applicable to any information collected offline or via channels other than this website.",
      style: TextStyle(color: primary, fontSize: 12),
    ),
  ]);
}

Widget _consent() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
    Text(
      "Consent",
      style:
          TextStyle(color: primary, fontSize: 14, fontWeight: FontWeight.bold),
    ),
    SizedBox(
      height: 10.0,
    ),
    Text(
      "By using our website or mobile applications, you hereby consent to our Privacy Policy and agree to its terms.",
      style: TextStyle(color: primary, fontSize: 12),
    ),
  ]);
}

Widget _informationWeCollect() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
    Text(
      "Information we collect",
      style:
          TextStyle(color: primary, fontSize: 14, fontWeight: FontWeight.bold),
    ),
    SizedBox(
      height: 10.0,
    ),
    Text(
      "The personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information.",
      style: TextStyle(color: primary, fontSize: 12),
    ),
    SizedBox(
      height: 10.0,
    ),
    Text(
      "If you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and/or attachments you may send us, and any other information you may choose to provide.",
      style: TextStyle(color: primary, fontSize: 12),
    ),
    SizedBox(
      height: 10.0,
    ),
    Text(
      "When you register for an Account, we may ask for your contact information, including items such as name, address, email address, and telephone number.",
      style: TextStyle(color: primary, fontSize: 12),
    ),
  ]);
}

Widget _howWeUseYourInformation() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    const Text(
      "How we use your information",
      style:
          TextStyle(color: primary, fontSize: 14, fontWeight: FontWeight.bold),
    ),
    const SizedBox(
      height: 10.0,
    ),
    const Text(
      "We use the information we collect in various ways, including to:",
      style: TextStyle(color: primary, fontSize: 12),
    ),
    const SizedBox(
      height: 10.0,
    ),
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "• ",
        ),
        Expanded(
          child: Text(
            "Provide, operate, and maintain our website",
            style: TextStyle(color: primary, fontSize: 12),
          ),
        )
      ],
    ),
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "• ",
        ),
        Expanded(
          child: Text(
            "Improve, personalize, and expand our website",
            style: TextStyle(color: primary, fontSize: 12),
          ),
        )
      ],
    ),
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "• ",
        ),
        Expanded(
          child: Text(
            "Understand and analyze how you use our website",
            style: TextStyle(color: primary, fontSize: 12),
          ),
        )
      ],
    ),
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "• ",
        ),
        Expanded(
          child: Text(
            "Develop new products, services, features, and functionality",
            style: TextStyle(color: primary, fontSize: 12),
          ),
        )
      ],
    ),
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "• ",
        ),
        Expanded(
          child: Text(
            "Communicate with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the website, and for marketing and promotional purposes",
            style: TextStyle(color: primary, fontSize: 12),
          ),
        )
      ],
    ),
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "• ",
        ),
        Expanded(
          child: Text(
            "Send you emails",
            style: TextStyle(color: primary, fontSize: 12),
          ),
        )
      ],
    ),
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "• ",
        ),
        Expanded(
          child: Text(
            "Find and prevent fraud",
            style: TextStyle(color: primary, fontSize: 12),
          ),
        )
      ],
    ),
  ]);
}

Widget _logFiles() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
    Text(
      "Log Files",
      style:
          TextStyle(color: primary, fontSize: 14, fontWeight: FontWeight.bold),
    ),
    SizedBox(
      height: 10.0,
    ),
    Text(
      "Naurs follows a standard procedure of using log files. These files log visitors when they visit websites. All hosting companies do this and a part of hosting services' analytics. The information collected by log files include internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring/exit pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable. The purpose of the information is for analyzing trends, administering the site, tracking users' movement on the website, and gathering demographic information.",
      style: TextStyle(color: primary, fontSize: 12),
    ),
  ]);
}

Widget _cookiesAndWebBeacons() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
    Text(
      "Cookies and Web Beacons",
      style:
          TextStyle(color: primary, fontSize: 14, fontWeight: FontWeight.bold),
    ),
    SizedBox(
      height: 10.0,
    ),
    Text(
      "Like any other website, Naurs uses 'cookies'. These cookies are used to store information including visitors' preferences, and the pages on the website that the visitor accessed or visited. The information is used to optimize the users' experience by customizing our web page content based on visitors' browser type and/or other information.",
      style: TextStyle(color: primary, fontSize: 12),
    ),
  ]);
}

Widget _advertisingPartnersPrivacyPolicies() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
    Text(
      "Advertising Partners Privacy Policies",
      style:
          TextStyle(color: primary, fontSize: 14, fontWeight: FontWeight.bold),
    ),
    SizedBox(
      height: 10.0,
    ),
    Text(
      "You may consult this list to find the Privacy Policy for each of the advertising partners of Naurs.",
      style: TextStyle(color: primary, fontSize: 12),
    ),
    SizedBox(
      height: 10.0,
    ),
    Text(
      "Third-party ad servers or ad networks uses technologies like cookies, JavaScript, or Web Beacons that are used in their respective advertisements and links that appear on Naurs, which are sent directly to users' browser. They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and/or to personalize the advertising content that you see on websites that you visit.",
      style: TextStyle(color: primary, fontSize: 12),
    ),
    SizedBox(
      height: 10.0,
    ),
    Text(
      "Note that Naurs has no access to or control over these cookies that are used by third-party advertisers.",
      style: TextStyle(color: primary, fontSize: 12),
    ),
  ]);
}

Widget _thirdPartyPrivacyPolicies() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
    Text(
      "Third Party Privacy Policies",
      style:
          TextStyle(color: primary, fontSize: 14, fontWeight: FontWeight.bold),
    ),
    SizedBox(
      height: 10.0,
    ),
    Text(
      "Naurs's Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt-out of certain options.",
      style: TextStyle(color: primary, fontSize: 12),
    ),
    SizedBox(
      height: 10.0,
    ),
    Text(
      "You can choose to disable cookies through your individual browser options. To know more detailed information about cookie management with specific web browsers, it can be found at the browsers' respective websites.",
      style: TextStyle(color: primary, fontSize: 12),
    ),
  ]);
}

Widget _gDPRDataProtectionRights() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
    Text(
      "GDPR Data Protection Rights",
      style:
          TextStyle(color: primary, fontSize: 14, fontWeight: FontWeight.bold),
    ),
    SizedBox(
      height: 10.0,
    ),
    Text(
      "We would like to make sure you are fully aware of all of your data protection rights. Every user is entitled to the following:",
      style: TextStyle(color: primary, fontSize: 12),
    ),
    SizedBox(
      height: 10.0,
    ),
    Text(
      "The right to access – You have the right to request copies of your personal data. We may charge you a small fee for this service.",
      style: TextStyle(color: primary, fontSize: 12),
    ),
    SizedBox(
      height: 10.0,
    ),
    Text(
      "The right to rectification – You have the right to request that we correct any information you believe is inaccurate. You also have the right to request that we complete the information you believe is incomplete.",
      style: TextStyle(color: primary, fontSize: 12),
    ),
    SizedBox(
      height: 10.0,
    ),
    Text(
      "The right to erasure – You have the right to request that we erase your personal data, under certain conditions.",
      style: TextStyle(color: primary, fontSize: 12),
    ),
    SizedBox(
      height: 10.0,
    ),
    Text(
      "The right to restrict processing – You have the right to request that we restrict the processing of your personal data, under certain conditions.",
      style: TextStyle(color: primary, fontSize: 12),
    ),
    SizedBox(
      height: 10.0,
    ),
    Text(
      "The right to object to processing – You have the right to object to our processing of your personal data, under certain conditions.",
      style: TextStyle(color: primary, fontSize: 12),
    ),
    SizedBox(
      height: 10.0,
    ),
    Text(
      "The right to data portability – You have the right to request that we transfer the data that we have collected to another organization, or directly to you, under certain conditions.",
      style: TextStyle(color: primary, fontSize: 12),
    ),
    SizedBox(
      height: 10.0,
    ),
    Text(
      "If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.",
      style: TextStyle(color: primary, fontSize: 12),
    ),
  ]);
}

Widget _childrenInformation() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
    Text(
      "Children's Information",
      style:
          TextStyle(color: primary, fontSize: 14, fontWeight: FontWeight.bold),
    ),
    SizedBox(
      height: 10.0,
    ),
    Text(
      "Another part of our priority is adding protection for children while using the internet. We encourage parents and guardians to observe, participate in, and/or monitor and guide their online activity.",
      style: TextStyle(color: primary, fontSize: 12),
    ),
    SizedBox(
      height: 10.0,
    ),
    Text(
      "Naurs does not knowingly collect any Personal Identifiable Information from children under the age of 13. If you think that your child provided this kind of information on our website, we strongly encourage you to contact us immediately and we will do our best efforts to promptly remove such information from our records.",
      style: TextStyle(color: primary, fontSize: 12),
    ),
  ]);
}

Widget _financePolicy() {
  return Column(children: const [
    Text(
      "Naurs does not store or keep any user bank, card or financial account details on it's database. Our transaction are 100% transparent.",
      style: TextStyle(color: primary, fontSize: 12),
    ),
  ]);
}

Widget _cardsPolicy() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    const Text(
      "Cards & Policy",
      style:
          TextStyle(color: primary, fontSize: 14, fontWeight: FontWeight.bold),
    ),
    const SizedBox(
      height: 10.0,
    ),
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "• ",
        ),
        Expanded(
          child: Text(
            "All credit/debit cards details and personally identifiable information will NOT be stored, sold, shared, rented or leased to any third parties.",
            style: TextStyle(color: primary, fontSize: 12),
          ),
        )
      ],
    ),
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "• ",
        ),
        Expanded(
          child: Text(
            "The Website Policies and Terms & Conditions may be changed or updated occasionally to meet the requirements and standards. Therefore the Customers’ are encouraged to frequently visit these sections in order to be updated about the changes on the website. Modifications will be effective on the day they are posted.",
            style: TextStyle(color: primary, fontSize: 12),
          ),
        )
      ],
    ),
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "• ",
        ),
        Expanded(
          child: Text(
            "We accept payments online using Visa and MasterCard credit/debit card in AED.",
            style: TextStyle(color: primary, fontSize: 12),
          ),
        )
      ],
    ),
  ]);
}

Widget _services() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
    Text(
      "Services",
      style:
          TextStyle(color: primary, fontSize: 14, fontWeight: FontWeight.bold),
    ),
    SizedBox(
      height: 10.0,
    ),
    Text(
      "Services Pricing and complete description of the goods or services offered need to be available and accessible while the website is been reviewed by the Acquiring RISK & Fraud team.",
      style: TextStyle(color: primary, fontSize: 12),
    ),
  ]);
}

Widget _refundPolicy() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
    Text(
      "Refund/Return Policy",
      style:
          TextStyle(color: primary, fontSize: 14, fontWeight: FontWeight.bold),
    ),
    SizedBox(
      height: 10.0,
    ),
    Text(
      "Refunds are currently not available at naurs.",
      style: TextStyle(color: primary, fontSize: 12),
    ),
  ]);
}

Widget _shippingPolicy() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    const Text(
      "Delivery/Shipping/Services Policy",
      style:
          TextStyle(color: primary, fontSize: 14, fontWeight: FontWeight.bold),
    ),
    const SizedBox(
      height: 10.0,
    ),
    const Text(
      "Inclusion is mandatory and should have the below mentioned point (Applicable as per the website Products/Services).",
      style: TextStyle(color: primary, fontSize: 12),
    ),
    const SizedBox(
      height: 10.0,
    ),
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "• ",
        ),
        Expanded(
          child: Text(
            "Recommended statement is “(https://www.naurs.me/) will NOT deal or provide any services or products to any of OFAC (Office of Foreign Assets Control) sanctions countries in accordance with the law of UAE”.",
            style: TextStyle(color: primary, fontSize: 12),
          ),
        )
      ],
    ),
  ]);
}

Widget _cancellationPolicy() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
    Text(
      "Cancellation & Replacement Policy",
      style:
          TextStyle(color: primary, fontSize: 14, fontWeight: FontWeight.bold),
    ),
    SizedBox(
      height: 10.0,
    ),
    Text(
      "Inclusion is mandatory (Applicable as per the website Products/Services).",
      style: TextStyle(color: primary, fontSize: 12),
    ),
  ]);
}

Widget _governingLawPolicy() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    const Text(
      "Governing Law and Jurisdiction",
      style:
          TextStyle(color: primary, fontSize: 14, fontWeight: FontWeight.bold),
    ),
    const SizedBox(
      height: 10.0,
    ),
    const Text(
      "Inclusion is mandatory and should have any one of the below mentioned points",
      style: TextStyle(color: primary, fontSize: 12),
    ),
    const SizedBox(
      height: 10.0,
    ),
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "• ",
        ),
        Expanded(
          child: Text(
            "“Any purchase, dispute or claim arising out of or in connection with this website shall be governed and construed in accordance with the laws of UAE”.",
            style: TextStyle(color: primary, fontSize: 12),
          ),
        )
      ],
    ),
  ]);
}

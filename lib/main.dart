import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Economic Tips',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const TipsPage(),
    );
  }
}

class TipsPage extends StatefulWidget {
  const TipsPage({super.key});

  @override
  State<TipsPage> createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  final PageController _controller = PageController();
  
  // ১০টি উপদেশের লিস্ট
  final List<Map<String, String>> tips = [
    {
      "title": "১. জরুরি তহবিল গঠন",
      "desc": "আয়ের অন্তত ২০% সঞ্চয় করে একটি 'ইমার্জেন্সি ফান্ড' তৈরি করুন যা দিয়ে অন্তত ৬ মাস চলা যায়।",
      "color": "0xFF00796B"
    },
    {
      "title": "২. বাজেট পুনর্গঠন",
      "desc": "৫০/৩০/২০ নিয়ম মেনে চলুন। সংকটের সময় বিলাসিতা বা 'ইচ্ছা'র খরচ কমিয়ে শুধুমাত্র প্রয়োজনে ফোকাস করুন।",
      "color": "0xFF009688"
    },
    {
      "title": "৩. ঋণ নিয়ন্ত্রণ",
      "desc": "নতুন করে ঋণ নেয়া বন্ধ করুন। উচ্চ সুদের ঋণগুলো আগে শোধ করার পরিকল্পনা করুন।",
      "color": "0xFF4DB6AC"
    },
    {
      "title": "৪. বিকল্প আয়",
      "desc": "একক আয়ের ওপর নির্ভর না করে ফ্রিল্যান্সিং বা ছোট ব্যবসার মাধ্যমে আয়ের দ্বিতীয় উৎস তৈরি করুন।",
      "color": "0xFF26A69A"
    },
    {
      "title": "৫. দক্ষতা বৃদ্ধি",
      "desc": "এআই (AI) বা নতুন প্রযুক্তি শিখুন। সংকটের সময় নিজের দক্ষতা বাড়ালে ভবিষ্যতে আপনার বাজারমূল্য বাড়বে।",
      "color": "0xFF00897B"
    },
    {
      "title": "৬. বিলাসিতা বর্জন",
      "desc": "অপ্রয়োজনীয় সাবস্ক্রিপশন, রেস্তোরাঁয় খাওয়া বা শৌখিন কেনাকাটা সাময়িকভাবে বন্ধ রাখুন।",
      "color": "0xFF00695C"
    },
    {
      "title": "৭. সম্পদ লিকুইডেশন",
      "desc": "যদি খুব প্রয়োজন হয়, তবে অকেজো পড়ে থাকা পুরাতন জিনিস বিক্রি করে নগদ টাকা হাতে রাখুন।",
      "color": "0xFF004D40"
    },
    {
      "title": "৮. নেটওয়ার্কিং",
      "desc": "পেশাগত সম্পর্ক ঝালাই করুন। বিপদের সময় পরিচিত মানুষই নতুন কাজের সুযোগ দিতে পারে।",
      "color": "0xFF00796B"
    },
    {
      "title": "৯. স্বাস্থ্যই সম্পদ",
      "desc": "শারীরিক ও মানসিক স্বাস্থ্যের যত্ন নিন। অসুস্থতা বড় আর্থিক বিপর্যয় ডেকে আনতে পারে।",
      "color": "0xFF00897B"
    },
    {
      "title": "১০. ধৈর্য ও পরিকল্পনা",
      "desc": "আতঙ্কিত না হয়ে ঠান্ডা মাথায় দীর্ঘমেয়াদী পরিকল্পনা করুন। মনে রাখবেন, রাত যত গভীর হয়, প্রভাত তত নিকটে আসে।",
      "color": "0xFF004D40"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: tips.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(30),
            color: Color(int.parse(tips[index]['color']!)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tips[index]['title']!,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Text(
                  tips[index]['desc']!,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white70,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                Text(
                  "${index + 1} / ${tips.length}",
                  style: const TextStyle(color: Colors.white38),
                ),
                const SizedBox(height: 20),
                if (index < tips.length - 1)
                  const Icon(Icons.arrow_forward_ios, color: Colors.white54)
                else
                  ElevatedButton(
                    onPressed: () => _controller.animateToPage(0, duration: const Duration(seconds: 1), curve: Curves.easeInOut),
                    child: const Text("শুরুতে যান"),
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
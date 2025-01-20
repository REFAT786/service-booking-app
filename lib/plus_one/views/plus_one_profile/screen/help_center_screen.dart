import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_contact_us_list_tile.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/styles.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({Key? key}) : super(key: key);

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _categories = ['General', 'Account', 'Service', 'Video', 'All'];
  final List<Map<String, dynamic>> _faqs = [
    {
      'question': 'Lorem ipsum dolor sit amet?',
      'answer':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus.',
    },
    {
      'question': 'Sed dignissim metus nec fringilla accumsan?',
      'answer':
      'Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus.',
    },
    {
      'question': 'Maecenas eget condimentum velit?',
      'answer': 'Maecenas eget condimentum velit, sit amet feugiat lectus.',
    },
    {
      'question': 'Lorem ipsum dolor sit amet?',
      'answer': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "Help Center",
          style: styleExtraBold.copyWith(
            fontSize: Dimensions.fontSizeOverLarge,
            color: AppColors.textBlack,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.blue,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          tabs: const [
            Tab(text: "FAQ"),
            Tab(text: "Contact Us"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // FAQ Tab
          Column(
            children: [
              // Category Tabs
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _categories
                      .map(
                        (category) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ChoiceChip(
                        label: Text(
                          category,
                          style: TextStyle(color: Colors.black),
                        ),
                        selected: _categories.indexOf(category) == 0,
                        onSelected: (_) {},
                        selectedColor: Colors.blue,
                        labelStyle: const TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                      .toList(),
                ),
              ),
              const SizedBox(height: 10),
              // FAQ List
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: _faqs.length,
                  itemBuilder: (context, index) {
                    final faq = _faqs[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ExpansionTile(
                        title: Text(
                          faq['question'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(faq['answer']),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          // Contact Us Tab
          Center(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 6,
              itemBuilder: (context, index) {
                return CustomContactUsListTile();
              },
            ),
          ),
        ],
      ),
    );
  }
}

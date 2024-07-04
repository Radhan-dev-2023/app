import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final String value;
  final String count;

  const CustomContainer({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.count,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black54,
          width: 2.0,
        ),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            bottomRight: Radius.circular(25.0)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
              ),
              Text(
                subtitle,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "RS $value",
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Text(
                count,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


 Widget containerMedium(){
  return  Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.black54,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(Icons.info_outline, size: 28),
        Expanded(
          child: Text(
            "Your data will be securely auto-updated once every week",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
 }

 Widget balanceContainer(String text1,String text2){
  return Container(
    decoration: BoxDecoration(
      color: Colors.teal.shade700,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          bottomRight: Radius.circular(25.0)),
    ),
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          const Text(
            "Current Total Balance",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          const SizedBox(height: 5),
          Text(
            '₹ ${text1}',
            style:
            const TextStyle(fontSize: 26, color: Colors.white),
          ),
          const SizedBox(height: 5),
          const Text(
            "Your current OD-Limit for this month is",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          const SizedBox(height: 5),
          Text(
            '₹ ${text2}',
            style:
            const TextStyle(fontSize: 18, color: Colors.white),
          ),
          const SizedBox(height: 10),
        ],
      ),
    ),
  );
 }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: data['user_answer'] == data['correct_answer']
                            ? const Color.fromARGB(255, 129, 190, 240)
                            : const Color.fromARGB(255, 231, 145, 174),
                        borderRadius: BorderRadius.circular(100)),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: const Color.fromARGB(255, 229, 210, 233),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(data['user_answer'] as String,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: const Color.fromARGB(255, 197, 112, 212),
                            )),
                        Text(data['correct_answer'] as String,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: const Color.fromARGB(255, 129, 190, 240),
                            )),
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

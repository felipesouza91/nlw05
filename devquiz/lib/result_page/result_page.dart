import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
						mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Parabéns",
                style: AppTextStyles.heading40,
              ),
            ],
          ),
          Text(
            "Parabéns",
            style: AppTextStyles.heading40,
          ),
          Text(
            "Parabéns",
            style: AppTextStyles.heading40,
          ),
        ],
      ),
    );
  }
}

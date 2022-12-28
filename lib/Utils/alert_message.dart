import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertMessage {
	final String title;
	final String content;
	AlertMessage({ required this.title, required this.content});
	 
	void show(){
		   Get.defaultDialog(
              title: title,
              contentPadding: const EdgeInsets.all(10),
              titleStyle: Get.textTheme.titleMedium?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
             
              content: Text(
                content,
                textAlign: TextAlign.center,
                style: Get.textTheme.labelSmall?.copyWith(fontSize: 12, color: Colors.grey),
              ),
            );
	 }


}

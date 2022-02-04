// ignore_for_file: prefer_const_constructors, import_of_legacy_library_into_null_safe, unused_import, avoid_print

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_echart/flutter_echart.dart';

PieChatWidget buildPieChatWidget(
  int water, int electricity, int internet, int property) {
  List<EChartPieBean> _dataList = [
    EChartPieBean(title: "Water", number: water, color: Colors.deepOrangeAccent),
    EChartPieBean(title: "Electricity", number: electricity, color: Colors.green),
    EChartPieBean(title: "Internet", number: internet, color: Colors.amber),
    EChartPieBean(title: "Property", number: property, color: Colors.orange),
  ];
  return PieChatWidget(
    dataList: _dataList,
    //是否输出日志
    isLog: true,
    //是否需要背景
    isBackground: true,
    //是否画直线
    isLineText: true,
    //背景
    bgColor: Color(0xffFAFAFA),
    //是否显示最前面的内容
    isFrontgText: true,
    //默认选择放大的块
    initSelect: 1,
    //初次显示以动画方式展开
    openType: OpenType.ANI,
    //旋转类型
    loopType: LoopType.MOVE,
    //点击回调
    clickCallBack: (int value) {
      print("当前点击显示 $value");
    },
  );
}

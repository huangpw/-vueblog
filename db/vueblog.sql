/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库123456
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : vueblog

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 26/10/2024 19:50:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for m_blog
-- ----------------------------
DROP TABLE IF EXISTS `m_blog`;
CREATE TABLE `m_blog`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(0) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `created` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `status` tinyint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_blog
-- ----------------------------
INSERT INTO `m_blog` VALUES (1, 1, '生活就像海洋，只有意志坚强的人才能到达彼岸', '这里是摘要哈哈哈', '内容？？？', '2020-05-21 22:08:42', 0);
INSERT INTO `m_blog` VALUES (2, 1, '最值得学习的博客项目eblog', 'eblog是一个基于Springboot2.1.2开发的博客学习项目，为了让项目融合更多的知识点，达到学习目的，编写了详细的从0到1开发文档。主要学习包括：自定义Freemarker标签，使用shiro+redis完成了会话共享，redis的zset结构完成本周热议排行榜，t-io+websocket完成即时消息通知和群聊，rabbitmq+elasticsearch完成博客内容搜索引擎等。值得学习的地方很多！', '**推荐阅读：**\r\n\r\n[分享一套SpringBoot开发博客系统源码，以及完整开发文档！速度保存！](https://mp.weixin.qq.com/s/jz6e977xP-OyaAKNjNca8w)\r\n\r\n[Github上最值得学习的100个Java开源项目，涵盖各种技术栈！](https://mp.weixin.qq.com/s/N-U0TaEUXnBFfBsmt_OESQ)\r\n\r\n[2020年最新的常问企业面试题大全以及答案](https://mp.weixin.qq.com/s/lR5LC5GnD2Gs59ecV5R0XA)', '2020-05-28 09:36:38', 0);
INSERT INTO `m_blog` VALUES (3, 1, '公众号MarkerHub文章索引', '梳理Java知识，解析开源项目！ 公众号【MarkerHub】的文章分类索引，直联公众号文章链接！https://github.com/MarkerHub/JavaIndex', '**推荐阅读：**\r\n\r\n[分享一套SpringBoot开发博客系统源码，以及完整开发文档！速度保存！](https://mp.weixin.qq.com/s/jz6e977xP-OyaAKNjNca8w)\r\n\r\n[Github上最值得学习的100个Java开源项目，涵盖各种技术栈！](https://mp.weixin.qq.com/s/N-U0TaEUXnBFfBsmt_OESQ)\r\n\r\n[2020年最新的常问企业面试题大全以及答案](https://mp.weixin.qq.com/s/lR5LC5GnD2Gs59ecV5R0XA)', '2020-05-28 09:36:45', 0);
INSERT INTO `m_blog` VALUES (7, 1, '你真的会写单例模式吗?', '单例模式可能是代码最少的模式了，但是少不一定意味着简单，想要用好、用对单例模式，还真得费一番脑筋。本文对 Java 中常见的单例模式写法做了一个总结，如有错漏之处，恳请读者指正。', '> 作者：吃桔子的攻城狮 来源：http://www.tekbroaden.com/singleton-java.html\n\n\n单例模式可能是代码最少的模式了，但是少不一定意味着简单，想要用好、用对单例模式，还真得费一番脑筋。本文对 Java 中常见的单例模式写法做了一个总结，如有错漏之处，恳请读者指正。\n\n饿汉法\n===\n\n顾名思义，饿汉法就是在第一次引用该类的时候就创建对象实例，而不管实际是否需要创建。代码如下：\n\n```\npublic class Singleton {  \n    private static Singleton = new Singleton();\n    private Singleton() {}\n    public static getSignleton(){\n        return singleton;\n    }\n}\n\n```\n\n这样做的好处是编写简单，但是无法做到延迟创建对象。但是我们很多时候都希望对象可以尽可能地延迟加载，从而减小负载，所以就需要下面的懒汉法：\n', '2020-05-22 00:42:44', 0);
INSERT INTO `m_blog` VALUES (9, 1, '真正理解Mysql的四种隔离级别@', '事务是应用程序中一系列严密的操作，所有操作必须成功完成，否则在每个操作中所作的所有更改都会被撤消。也就是事务具有原子性，一个事务中的一系列的操作要么全部成功，要么一个都不做。\n\n事务的结束有两种，当事务中的所以步骤全部成功执行时，事务提交。如果其中一个步骤失败，将发生回滚操作，撤消撤消之前到事务开始时的所以操作。', '### 什么是事务  \n\n> 事务是应用程序中一系列严密的操作，所有操作必须成功完成，否则在每个操作中所作的所有更改都会被撤消。也就是事务具有原子性，一个事务中的一系列的操作要么全部成功，要么一个都不做。\n> \n> 事务的结束有两种，当事务中的所以步骤全部成功执行时，事务提交。如果其中一个步骤失败，将发生回滚操作，撤消撤消之前到事务开始时的所以操作。\n\n**事务的 ACID**\n\n事务具有四个特征：原子性（ Atomicity ）、一致性（ Consistency ）、隔离性（ Isolation ）和持续性（ Durability ）。这四个特性简称为 ACID 特性。\n\n> 1 、原子性。事务是数据库的逻辑工作单位，事务中包含的各操作要么都做，要么都不做\n> \n> 2 、一致性。事 务执行的结果必须是使数据库从一个一致性状态变到另一个一致性状态。因此当数据库只包含成功事务提交的结果时，就说数据库处于一致性状态。如果数据库系统 运行中发生故障，有些事务尚未完成就被迫中断，这些未完成事务对数据库所做的修改有一部分已写入物理数据库，这时数据库就处于一种不正确的状态，或者说是 不一致的状态。', '2020-05-22 22:04:46', 0);
INSERT INTO `m_blog` VALUES (10, 1, '博客项目eblog讲解视频上线啦，长达17个小时！！', '1. 慕课网免费资源好久都没更新了，新教程大都付费\n2. B站上的视频繁多，通过收藏和弹幕数量通常很容易判断出视频是否优质\n3. 讲真，B站的弹幕文化，让我觉得，我不是一个在学习，自古人才出评论。哈哈哈\n4. B站视频通常广告少，up主的用心录制，通常只为了你关注他', 'ok，再回到我们的eblog项目，源码、文档、视频我都开源出来了。来些基本操作：github上给个star，B站视频给个三连支持咧。\n\neblog源码：https://github.com/MarkerHub/eblog\n\n点击这里：[10+篇完整开发文档](https://mp.weixin.qq.com/mp/homepage?__biz=MzIwODkzOTc1MQ==&hid=1&sn=8e512316c3dfe140e636d0c996951166)\n\n![](//image-1300566513.cos.ap-guangzhou.myqcloud.com/upload/images/20200508/c290d945b7d24c79b172759bdb5b94e0.png)\n\n视频讲解：（记得关注我噢！）\n\nhttps://www.bilibili.com/video/BV1ri4y1x71A\n\n![](//image-1300566513.cos.ap-guangzhou.myqcloud.com/upload/images/20200508/983b5abc1c934360a1a1362347a275f7.png)\n\n项目其实还很多bug的，哈哈，我还需要进行二次迭代，到时候再发迭代文档出来。\n\n关注下我的B站，作为一个自媒体的自由职业者，没有什么比涨粉更让我开心的了，嘻嘻。\n\n近期即将推出的视频教程：\n\n1. 搭建脚手架，前后端分离首秀\n2. Shiro入门到精通教程\n3. SpringBoot2.2.6最新入门教程', '2020-05-22 22:05:49', 0);
INSERT INTO `m_blog` VALUES (15, 1, '哈哈', '哈哈', '哈哈', '2024-08-27 21:40:14', 0);
INSERT INTO `m_blog` VALUES (16, 1, '前端CSS 设置滚动条样式', '::-webkit-scrollbar CSS伪类选择器影响了一个元素的滚动条的样式', '::-webkit-scrollbar CSS伪类选择器影响了一个元素的滚动条的样式\n\n```\n::-webkit-scrollbar 仅仅在支持WebKit的浏览器 (例如, 谷歌Chrome, 苹果Safari)可以使用.\n```\n\n```\n你可以使用以下【伪元素】选择器，去修改各式webkit浏览器的滚动条样式:\n```\n\n```\n::-webkit-scrollbar — 整个滚动条.\n::-webkit-scrollbar-button — 滚动条上的按钮 (上下箭头).\n::-webkit-scrollbar-thumb — 滚动条上的滚动滑块.\n::-webkit-scrollbar-track — 滚动条轨道.\n::-webkit-scrollbar-track-piece — 滚动条没有滑块的轨道部分.\n::-webkit-scrollbar-corner — 当同时有垂直滚动条和水平滚动条时交汇的部分.\n::-webkit-resizer — 某些元素的corner部分的部分样式(例:textarea的可拖动按钮).\n```\n\n```css\n::-webkit-scrollbar {\n    width: 10px;\n    height: 10px;\n    border-radius: 10px;\n    background-color: #F5F5F5;\n}\n::-webkit-scrollbar-thumb {\n    border-radius: 10px;\n    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);\n    border-radius: 10px;\n    background-image: -webkit-gradient(linear,left bottom,left top,color-stop(0.44,rgb(60,186,146)),color-stop(0.72,rgb(253,187,45)),color-stop(0.86,rgb(253,187,45)));\n    transition: 0.3s ease-in-out;\n}\n::-webkit-scrollbar-track {\n    border-radius: 10px;\n    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);\n    background-color: #F5F5F5;\n}\n\n```\n\n```\n ::-webkit-scrollbar         滚动条整体部分\n ::-webkit-scrollbar-thumb             滚动条里面的小方块，能上下左右移动（取决于是垂直滚动条还是水平滚动条）\n ::-webkit-scrollbar-track      滚动条的轨道（里面装有thumb）\n ::-webkit-scrollbar-button      滚动条轨道两端的按钮，允许通过点击微调小方块的位置\n ::-webkit-scrollbar-track-piece    内层轨道，滚动条中间部分（除去）\n ::-webkit-scrollbar-corner     边角，及两个滚动条的交汇处\n ::-webkit-resizer       两个滚动条的交汇处上用于通过拖动调整元素大小的小控件\n```\n\n\n\n# css设置滚动条样式，解决ios修改滚动条样式无效问题\n\ncss部分\n\n```css\n/* 横向滚动容器 */\n.scroll-wrapper {\n    width: 100%;\n    overflow-x: auto;\n    height: 22px;\n    white-space: nowrap;\n    display: flex;\n    -webkit-overflow-scrolling: touch;\n}\n.scroll-wrapper span {\n    display: block;\n    padding: 0 4px;\n    margin: 0 10px;\n    height: 20px;\n    line-height: 20px;\n    font-size: 14px;\n    border: 1px solid #3884ff;\n    border-radius: 20px;\n    color: #3884ff;\n}\n/* 滚动条最外面轨道样式 :: 前面保留一个空格*/\n.scroll-wrapper ::-webkit-scrollbar {\n    width: 2px; /* 对纵向滚动条起作用*/\n    height: 2px; /* 对横向滚动条起作用*/\n    background: gray;\n    display: none; /* 不显示滚动条 */\n}\n\n/* 滚动条最外面滑块样式 :: 前面保留一个空格*/\n.scroll-wrapper ::-webkit-scrollbar-thumb {\n    background: pink;\n    border-radius: 2px;\n    width: 2px; /* 对纵向滚动条起作用*/\n    height: 2px; /* 对横向滚动条起作用*/\n}\n```\n\nhtml结构\n\n```html\n<div class=\"scroll-wrapper\">\n    <span>awesome</span>\n    <span>awesome</span>\n    <span>awesome</span>\n    <span>awesome</span>\n    <span>awesome</span>\n    ...\n</div>\n```\n\n```\n::-webkit-scrollbar 双冒号前记得保留一个空格，否则ios上隐藏滚动条在safari上无效重点内容\n```\n\n\n\n# css overflow overlay 的特性\n\n左边是overflow:auto\n\n 右边是overflow:overlay\n\n![img](https://s2.loli.net/2022/08/03/DV4PSbY853uqjQv.gif)\n\n![img](https://s2.loli.net/2022/08/03/t8O5H6WCfIjPT2Z.gif)\n\nauto时滚动条会占用宽度, 布局会发生变化。\n\noverlay时滚动条会覆盖在内容上, 会遮挡一部分内容。\n\n\n\n# 移动端H5 css3自定义滚动条样式\n\n主要是样式代码如下：\n\n```css\n::-webkit-scrollbar { /* 滚动条整体样式 */\n	width: 5px;     /*高宽分别对应横竖滚动条的尺寸*/\n	height: 5px;\n}\n::-webkit-scrollbar-thumb { /* 滚动条里面小方块 */\n	border-radius: 5px;\n	// -webkit-box-shadow: inset 0 0 5px #FF5E00;\n	background: #FF5E00;\n}\n::-webkit-scrollbar-track { /* 滚动条里面轨道 */\n	// -webkit-box-shadow: inset 0 0 5px #FFD6B1;\n	border-radius: 5px;\n	background: #FFD6B1;\n}\n.auto-scroll { overflow: overlay  } /* 需要滚动的地方加上这个class */\n.auto-scroll ::-webkit-scrollbar { /* 组件内滚动条不显示 */\n	display: none;\n}\n.auto-scroll:hover ::-webkit-scrollbar { /* 悬停时滚动条才显示 */ \n	display: block; \n}\n```\n\n在需要滚动的元素上，加入 auto-scroll 类名即可。\n\n', '2024-08-27 21:41:58', 0);
INSERT INTO `m_blog` VALUES (17, 1, 'html@media响应式布局', '测试数据哈哈', '/* Mobile first queries */\n\n/* Larger than mobile：比移动设备大 */\n@media (min-width: 400px) {}\n\n/* Larger than phablet：大于平板电脑 */\n@media (min-width: 550px) {}\n\n/* Larger than tablet：大于平板电脑 */\n@media (min-width: 750px) {}\n\n/* Larger than desktop： 大于桌面 */\n@media (min-width: 1000px) {}\n\n/* Larger than Desktop HD： 大于桌面 HD */\n@media (min-width: 1200px) {}', '2024-10-26 17:15:14', 0);

-- ----------------------------
-- Table structure for m_user
-- ----------------------------
DROP TABLE IF EXISTS `m_user`;
CREATE TABLE `m_user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `status` int(0) NOT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  `last_login` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `UK_USERNAME`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_user
-- ----------------------------
INSERT INTO `m_user` VALUES (1, 'huangpw', 'https://image-1300566513.cos.ap-guangzhou.myqcloud.com/upload/images/5a9f48118166308daba8b6da7e466aab.jpg', '111111@qq.com', '96e79218965eb72c92a549dd5a330112', 0, '2020-04-20 10:44:01', NULL);

SET FOREIGN_KEY_CHECKS = 1;

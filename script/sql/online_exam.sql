/*
 Navicat Premium Data Transfer

 Source Server         : local_mysql
 Source Server Type    : MySQL
 Source Server Version : 80042 (8.0.42)
 Source Host           : localhost:3306
 Source Schema         : ruoyi_vue_plus_online_exam

 Target Server Type    : MySQL
 Target Server Version : 80042 (8.0.42)
 File Encoding         : 65001

 Date: 04/10/2025 14:15:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for edu_exam_category
-- ----------------------------
DROP TABLE IF EXISTS `edu_exam_category`;
CREATE TABLE `edu_exam_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '考试分类ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '租户编号',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父级分类ID,根节点为0',
  `category_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `sort_order` int NULL DEFAULT 0 COMMENT '排序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1974356718604976130 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '考试分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_exam_category
-- ----------------------------
INSERT INTO `edu_exam_category` VALUES (1974355791953199106, '000000', 0, '21级', 0, '0', NULL, 103, '2025-10-04 14:07:57', 1, '2025-10-04 14:07:57', 1);
INSERT INTO `edu_exam_category` VALUES (1974355816364048386, '000000', 0, '20级', 0, '0', NULL, 103, '2025-10-04 14:08:03', 1, '2025-10-04 14:09:40', 1);
INSERT INTO `edu_exam_category` VALUES (1974356296016265218, '000000', 1974355791953199106, '初一阶段', 0, '0', NULL, 103, '2025-10-04 14:09:57', 1, '2025-10-04 14:09:57', 1);
INSERT INTO `edu_exam_category` VALUES (1974356503714004993, '000000', 1974355791953199106, '初二阶段', 0, '0', NULL, 103, '2025-10-04 14:10:47', 1, '2025-10-04 14:10:47', 1);
INSERT INTO `edu_exam_category` VALUES (1974356691484606465, '000000', 1974356296016265218, '2021年10月考试', 0, '0', NULL, 103, '2025-10-04 14:11:32', 1, '2025-10-04 14:12:00', 1);
INSERT INTO `edu_exam_category` VALUES (1974356718604976129, '000000', 1974356296016265218, '2021年12月考试', 0, '0', NULL, 103, '2025-10-04 14:11:38', 1, '2025-10-04 14:12:06', 1);

-- ----------------------------
-- Table structure for edu_question
-- ----------------------------
DROP TABLE IF EXISTS `edu_question`;
CREATE TABLE `edu_question`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '试题ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '租户编号',
  `bank_id` bigint NOT NULL COMMENT '题库ID',
  `question_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '题目类型（1-单选 2-多选 3-判断）',
  `question_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '题目',
  `options` json NULL COMMENT '选项内容（JSON格式，判断题可为空）',
  `correct_answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '正确答案',
  `answer_analysis` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '答案解析',
  `difficulty` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '2' COMMENT '难度等级（1-简单 2-中等 3-困难）',
  `score` decimal(5, 2) NULL DEFAULT 1.00 COMMENT '题目分值',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1974001927466979361 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '试题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_question
-- ----------------------------
INSERT INTO `edu_question` VALUES (1, '000000', 1973944395251740674, '1', '下列词语中加点字的读音，完全正确的一项是？', '{\"A\": \"惩(chéng)罚\", \"B\": \"应(yīng)届\", \"C\": \"参(cēn)差不齐\", \"D\": \"提(dī)防\"}', 'A', 'B项应读yìng；C项应读cī；D项应读tí。', '1', 2.00, '0', NULL, NULL, '2025-10-03 14:41:22', NULL, '2025-10-03 14:41:22', NULL);
INSERT INTO `edu_question` VALUES (2, '000000', 1973944395251740674, '3', '《朝花夕拾》是鲁迅先生唯一的一本散文集。', '{\"A\": \"正确\", \"B\": \"错误\"}', 'A', '《朝花夕拾》确实是鲁迅先生创作的唯一一部回忆性散文集，收录了鲁迅先生记叙他童年和青年时代生活的10篇文章。', '1', 2.00, '0', NULL, NULL, '2025-10-03 14:41:22', NULL, '2025-10-03 14:41:22', NULL);
INSERT INTO `edu_question` VALUES (3, '000000', 1973944395251740674, '1', '下列句子中没有使用修辞手法的一项是？', '{\"A\": \"太阳的脸红起来了。\", \"B\": \"危楼高百尺，手可摘星辰。\", \"C\": \"春天像刚落地的娃娃。\", \"D\": \"今天天气真好。\"}', 'D', 'A项是拟人，B项是夸张，C项是比喻。D项是陈述句，没有使用修辞手法。', '1', 2.00, '0', NULL, NULL, '2025-10-03 14:41:22', NULL, '2025-10-03 14:41:22', NULL);
INSERT INTO `edu_question` VALUES (4, '000000', 1973944395251740674, '2', '下列作家中，属于“唐宋八大家”的有？', '{\"A\": \"李白\", \"B\": \"韩愈\", \"C\": \"苏轼\", \"D\": \"杜甫\", \"E\": \"欧阳修\"}', 'B,C,E', '唐宋八大家指的是唐代的韩愈、柳宗元和宋代的欧阳修、苏洵、苏轼、苏辙、王安石、曾巩。李白和杜甫是唐代伟大的诗人，但不属于“唐宋八大家”。', '2', 3.00, '0', NULL, NULL, '2025-10-03 14:41:22', NULL, '2025-10-03 14:41:22', NULL);
INSERT INTO `edu_question` VALUES (5, '000000', 1973944395251740674, '3', '“山”是一个会意字。', '{\"A\": \"正确\", \"B\": \"错误\"}', 'B', '“山”是根据山的形状描画出来的，属于象形字。会意字是由两个或两个以上的独体字组合而成的，例如“休”字。', '2', 2.00, '0', NULL, NULL, '2025-10-03 14:41:22', NULL, '2025-10-03 14:41:22', NULL);
INSERT INTO `edu_question` VALUES (6, '000000', 1973944395251740674, '1', '《论语》中“学而不思则罔”的下一句是？', '{\"A\": \"思而不学则殆\", \"B\": \"温故而知新\", \"C\": \"三人行，必有我师焉\", \"D\": \"学而时习之\"}', 'A', '这句话出自《论语·为政》，意思是“只学习却不思考，就会感到迷茫而无所适从；只空想却不学习，就会弄得精神疲惫而无所得。”', '1', 2.00, '0', NULL, NULL, '2025-10-03 14:41:22', NULL, '2025-10-03 14:41:22', NULL);
INSERT INTO `edu_question` VALUES (7, '000000', 1973944395251740674, '2', '下列课文中，出自《朝花夕拾》的有？', '{\"A\": \"《从百草园到三味书屋》\", \"B\": \"《春》\", \"C\": \"《藤野先生》\", \"D\": \"《风筝》\", \"E\": \"《济南的冬天》\"}', 'A,C,D', '《春》是朱自清的作品，《济南的冬天》是老舍的作品。其余三篇均出自鲁迅的散文集《朝花夕拾》。', '2', 3.00, '0', NULL, NULL, '2025-10-03 14:41:22', NULL, '2025-10-03 14:41:22', NULL);
INSERT INTO `edu_question` VALUES (8, '000000', 1973944395251740674, '1', '下列句子中加点的成语使用不恰当的一项是？', '{\"A\": \"他设计的这座建筑真是别出心裁，令人赞叹。\", \"B\": \"考试前夕，他还在滔滔不绝地玩游戏，一点也不紧张。\", \"C\": \"看到那壮丽的山河，我们不禁心旷神怡。\", \"D\": \"这位老科学家的事迹感人肺腑，催人奋进。\"}', 'B', '“滔滔不绝”形容说话连续而不间断，不能用来形容玩游戏。', '2', 2.00, '0', NULL, NULL, '2025-10-03 14:41:22', NULL, '2025-10-03 14:41:22', NULL);
INSERT INTO `edu_question` VALUES (9, '000000', 1973944395251740674, '3', '冰心的原名叫谢婉莹。', '{\"A\": \"正确\", \"B\": \"错误\"}', 'A', '冰心是中国现代著名女作家，原名谢婉莹，福建长乐人。', '1', 2.00, '0', NULL, NULL, '2025-10-03 14:41:22', NULL, '2025-10-03 14:41:22', NULL);
INSERT INTO `edu_question` VALUES (10, '000000', 1973944395251740674, '1', '“海内存知己，天涯若比邻”出自哪位诗人之手？', '{\"A\": \"李白\", \"B\": \"杜甫\", \"C\": \"王勃\", \"D\": \"王维\"}', 'C', '该句出自初唐诗人王勃的《送杜少府之任蜀州》，是千古传诵的名句。', '2', 2.00, '0', NULL, NULL, '2025-10-03 14:41:22', NULL, '2025-10-03 14:41:22', NULL);
INSERT INTO `edu_question` VALUES (11, '000000', 1973944395251740674, '1', '下列词语中没有错别字的一项是？', '{\"A\": \"再接再励\", \"B\": \"变本加利\", \"C\": \"迫不及待\", \"D\": \"天翻地复\"}', 'C', 'A项应为“再接再厉”，B项应为“变本加厉”，D项应为“天翻地覆”。', '1', 2.00, '0', NULL, NULL, '2025-10-03 14:41:22', NULL, '2025-10-03 14:41:22', NULL);
INSERT INTO `edu_question` VALUES (12, '000000', 1973944395251740674, '3', '《皇帝的新装》的作者是德国的安徒生。', '{\"A\": \"正确\", \"B\": \"错误\"}', 'B', '安徒生是丹麦著名童话作家，不是德国人。', '2', 2.00, '0', NULL, NULL, '2025-10-03 14:41:22', NULL, '2025-10-03 14:41:22', NULL);
INSERT INTO `edu_question` VALUES (13, '000000', 1973944395251740674, '2', '下列句子中，属于病句的有？', '{\"A\": \"通过这次活动，使我们受到了深刻的教育。\", \"B\": \"我们要不断改进学习方法，以提高学习效率。\", \"C\": \"是否能够保护环境，是衡量一个国家文明程度的标准。\", \"D\": \"操场上到处是同学们的欢声笑语。\"}', 'A,C', 'A项缺少主语，应去掉“使”。C项两面对一面，应去掉“是否能够”。', '3', 4.00, '0', NULL, NULL, '2025-10-03 14:41:22', NULL, '2025-10-03 14:41:22', NULL);
INSERT INTO `edu_question` VALUES (14, '000000', 1973944395251740674, '1', '《木兰诗》选自？', '{\"A\": \"《诗经》\", \"B\": \"《乐府诗集》\", \"C\": \"《楚辞》\", \"D\": \"《古诗十九首》\"}', 'B', '《木兰诗》又名《木兰辞》，是北朝民歌，选自宋代郭茂倩编的《乐府诗集》。', '2', 2.00, '0', NULL, NULL, '2025-10-03 14:41:22', NULL, '2025-10-03 14:41:22', NULL);
INSERT INTO `edu_question` VALUES (15, '000000', 1973944395251740674, '3', '成语“差强人意”的意思是“不太令人满意”。', '{\"A\": \"正确\", \"B\": \"错误\"}', 'B', '“差强人意”的“差”是“稍微、尚且”的意思，整个成语指大体上还能使人满意，是一个褒义词。', '3', 2.00, '0', NULL, NULL, '2025-10-03 14:41:22', NULL, '2025-10-03 14:41:22', NULL);
INSERT INTO `edu_question` VALUES (16, '000000', 1973944395251740674, '1', '“人固有一死，或重于泰山，或轻于鸿毛”这句话是谁说的？', '{\"A\": \"孔子\", \"B\": \"孟子\", \"C\": \"司马迁\", \"D\": \"屈原\"}', 'C', '这句话出自司马迁的《报任安书》，用以表达作者对生死价值观的看法。', '2', 2.00, '0', NULL, NULL, '2025-10-03 14:41:22', NULL, '2025-10-03 14:41:22', NULL);
INSERT INTO `edu_question` VALUES (17, '000000', 1973944395251740674, '3', '“不知细叶谁裁出，二月春风似剪刀”运用了拟人的修辞手法。', '{\"A\": \"正确\", \"B\": \"错误\"}', 'B', '这句诗将“春风”比作“剪刀”，属于比喻修辞手法中的明喻。', '2', 2.00, '0', NULL, NULL, '2025-10-03 14:41:22', NULL, '2025-10-03 14:41:22', NULL);
INSERT INTO `edu_question` VALUES (18, '000000', 1973944395251740674, '1', '“居”在“居高临下”中的意思是？', '{\"A\": \"居住\", \"B\": \"占据，处于\", \"C\": \"储存\", \"D\": \"居然\"}', 'B', '“居高临下”意思是占据高处，俯视下方，形容处于有利的位置。所以“居”是“处于”的意思。', '1', 2.00, '0', NULL, NULL, '2025-10-03 14:41:22', NULL, '2025-10-03 14:41:22', NULL);
INSERT INTO `edu_question` VALUES (19, '000000', 1973944395251740674, '2', '下列诗句中，描写春天的有？', '{\"A\": \"春色满园关不住，一枝红杏出墙来。\", \"B\": \"停车坐爱枫林晚，霜叶红于二月花。\", \"C\": \"等闲识得东风面，万紫千红总是春。\", \"D\": \"月落乌啼霜满天，江枫渔火对愁眠。\"}', 'A,C', 'B项描写的是秋景，D项描写的也是秋夜的景色。A和C明确描绘了春天的景象。', '1', 3.00, '0', NULL, NULL, '2025-10-03 14:41:22', NULL, '2025-10-03 14:41:22', NULL);
INSERT INTO `edu_question` VALUES (20, '000000', 1973944395251740674, '1', '《世说新语》是一部主要记载什么时期人物言谈轶事的笔记小说？', '{\"A\": \"春秋战国\", \"B\": \"秦汉\", \"C\": \"汉末到东晋\", \"D\": \"唐宋\"}', 'C', '《世说新语》是南朝宋临川王刘义庆组织一批文人编写的，主要记述了从汉末到东晋时期文人名士的言行风貌和趣闻轶事。', '3', 2.00, '0', NULL, NULL, '2025-10-03 14:41:22', NULL, '2025-10-03 14:41:22', NULL);
INSERT INTO `edu_question` VALUES (21, '000000', 1973944395251740674, '3', '“亡羊补牢”这个成语告诉我们，事情失败后弥补已经太晚了。', '{\"A\": \"正确\", \"B\": \"错误\"}', 'B', '“亡羊补牢”的意思是羊丢失了再去修补羊圈，还不算晚。比喻出了问题以后想办法补救，可以防止继续受损失。', '1', 2.00, '0', NULL, NULL, '2025-10-03 14:41:22', NULL, '2025-10-03 14:41:22', NULL);
INSERT INTO `edu_question` VALUES (22, '000000', 1973944395251740674, '1', '在《天上的街市》一诗中，作者把天上的街灯想象成了什么？', '{\"A\": \"人间的灯火\", \"B\": \"点亮的明星\", \"C\": \"天上的珍宝\", \"D\": \"仙人的眼睛\"}', 'A', '诗歌原文是“我想那缥缈的空中，定然有美丽的街市。街市上陈列的一些物品，定然是世上没有的珍奇。你看，那浅浅的天河，定然是不甚宽广。那隔着河的牛郎织女，定能够骑着牛儿来往。我想他们此刻，定然在天街闲游。不信，请看那朵流星，是他们提着灯笼在走。”，诗人由地上的街灯联想到天上的街市。', '1', 2.00, '0', NULL, NULL, '2025-10-03 14:41:22', NULL, '2025-10-03 14:41:22', NULL);
INSERT INTO `edu_question` VALUES (23, '000000', 1973944395251740674, '2', '下列关于说明文的说法，正确的有？', '{\"A\": \"说明文以说明为主要表达方式。\", \"B\": \"列数字、举例子、打比方是常见的说明方法。\", \"C\": \"说明文必须是客观的，不能带有任何感情色彩。\", \"D\": \"说明文的语言要求准确、平实、简洁。\"}', 'A,B,D', 'C项说法过于绝对，有些事物说明文（如《中国石拱桥》）在说明事物的同时，也会融入作者的情感，即“平实说明”和“生动说明”的区别。', '2', 3.00, '0', NULL, NULL, '2025-10-03 14:41:22', NULL, '2025-10-03 14:41:22', NULL);
INSERT INTO `edu_question` VALUES (24, '000000', 1973944395251740674, '1', '《伤仲永》一文揭示的道理是？', '{\"A\": \"人的天资是决定成才的唯一因素。\", \"B\": \"后天教育和努力学习对成才至关重要。\", \"C\": \"家庭环境对人的成长没有影响。\", \"D\": \"神童最终都会变得平庸。\"}', 'B', '文章通过方仲永从天资过人到“泯然众人”的变化，说明了后天教育和勤奋学习对于一个人成才的重要性。', '2', 2.00, '0', NULL, NULL, '2025-10-03 14:41:22', NULL, '2025-10-03 14:41:22', NULL);
INSERT INTO `edu_question` VALUES (25, '000000', 1973944395251740674, '3', '“白发三千丈，缘愁似个长”这句诗运用了比喻的修辞手法。', '{\"A\": \"正确\", \"B\": \"错误\"}', 'B', '这句诗将愁绪的长度比作三千丈的白发，属于夸张的修辞手法，而非比喻。', '2', 2.00, '0', NULL, NULL, '2025-10-03 14:41:22', NULL, '2025-10-03 14:41:22', NULL);
INSERT INTO `edu_question` VALUES (26, '000000', 1973944395251740674, '1', '下列标点符号使用正确的一项是？', '{\"A\": \"春天来了，百花盛开，例如：桃花、梨花、杏花等。\", \"B\": \"他说：“我今天一定要完成这个任务”。\", \"C\": \"你明天到底去不去？请尽快答复我。\", \"D\": \"我们应该学习他的大公无私，舍己为人的精神。\"}', 'C', 'A项“例如”后应用逗号。B项句号应在引号内。D项“大公无私”和“舍己为人”之间应用顿号。', '2', 2.00, '0', NULL, NULL, '2025-10-03 14:41:22', NULL, '2025-10-03 14:41:22', NULL);
INSERT INTO `edu_question` VALUES (27, '000000', 1973944395251740674, '2', '下列加点词的古今意义相同的有？', '{\"A\": \"阡陌交通，鸡犬相闻。（交通）\", \"B\": \"率妻子邑人来此绝境。（妻子）\", \"C\": \"此人一一为具言所闻。（一一）\", \"D\": \"学而时习之。（学习）\"}', 'C,D', 'A项“交通”古义是“交错相通”，今义是运输和邮电事业的总称。B项“妻子”古义是“妻子和儿女”，今义专指男子的配偶。C项“一一”古今意义都是“一个一个地”。D项“学习”古今意义基本相同。', '3', 3.00, '0', NULL, NULL, '2025-10-03 14:41:22', NULL, '2025-10-03 14:41:22', NULL);
INSERT INTO `edu_question` VALUES (28, '000000', 1973944395251740674, '1', '被称为“诗仙”的唐代诗人是？', '{\"A\": \"杜甫\", \"B\": \"李白\", \"C\": \"白居易\", \"D\": \"王维\"}', 'B', '李白因其诗歌雄奇奔放，飘逸不群，被后人誉为“诗仙”。杜甫被称为“诗圣”，白居易被称为“诗魔”，王维被称为“诗佛”。', '1', 2.00, '0', NULL, NULL, '2025-10-03 14:41:22', NULL, '2025-10-03 14:41:22', NULL);
INSERT INTO `edu_question` VALUES (29, '000000', 1973944395251740674, '3', '小说的三要素是人物、情节和环境。', '{\"A\": \"正确\", \"B\": \"错误\"}', 'A', '人物形象、故事情节和典型环境是构成小说的三个基本要素。', '1', 2.00, '0', NULL, NULL, '2025-10-03 14:41:22', NULL, '2025-10-03 14:41:22', NULL);
INSERT INTO `edu_question` VALUES (30, '000000', 1973944395251740674, '1', '《春》的作者是？', '{\"A\": \"鲁迅\", \"B\": \"老舍\", \"C\": \"朱自清\", \"D\": \"茅盾\"}', 'C', '《春》是中国现代散文家朱自清的代表作之一，描绘了春天生机勃勃的景象。', '1', 2.00, '0', NULL, NULL, '2025-10-03 14:41:22', NULL, '2025-10-03 14:41:22', NULL);
INSERT INTO `edu_question` VALUES (1974001927466979331, '000000', 1974008748755849218, '1', '-5的绝对值是？', '{\"A\": \"5\", \"B\": \"-5\", \"C\": \"1/5\", \"D\": \"±5\"}', 'A', '一个负数的绝对值是它的相反数，所以|-5|=5。', '1', 2.00, '0', '有理数-绝对值', NULL, '2025-10-03 15:15:14', NULL, '2025-10-03 15:15:14', NULL);
INSERT INTO `edu_question` VALUES (1974001927466979332, '000000', 1974008748755849218, '3', '0是最小的有理数。', '{\"A\": \"正确\", \"B\": \"错误\"}', 'B', '有理数包括正数、0和负数。负数比0小，且负数没有最小值，所以该说法错误。', '1', 2.00, '0', '有理数-概念', NULL, '2025-10-03 15:15:14', NULL, '2025-10-03 15:15:14', NULL);
INSERT INTO `edu_question` VALUES (1974001927466979333, '000000', 1974008748755849218, '1', '合并同类项 3a + 2a 的结果是？', '{\"A\": \"5a²\", \"B\": \"6a\", \"C\": \"5a\", \"D\": \"6a²\"}', 'C', '同类项合并，系数相加，字母和字母的指数不变。所以 3a + 2a = (3+2)a = 5a。', '1', 2.00, '0', '整式加减-同类项', NULL, '2025-10-03 15:15:14', NULL, '2025-10-03 15:15:14', NULL);
INSERT INTO `edu_question` VALUES (1974001927466979334, '000000', 1974008748755849218, '2', '下列图形中，属于立体图形的有？', '{\"A\": \"三角形\", \"B\": \"圆柱体\", \"C\": \"正方形\", \"D\": \"球体\", \"E\": \"长方形\"}', 'B,D', '三角形、正方形、长方形都属于平面图形。圆柱体和球体是立体图形，占据一定的空间。', '1', 3.00, '0', '几何图形初步', NULL, '2025-10-03 15:15:14', NULL, '2025-10-03 15:15:14', NULL);
INSERT INTO `edu_question` VALUES (1974001927466979335, '000000', 1974008748755849218, '1', '方程 2x - 1 = 5 的解是？', '{\"A\": \"x = 1\", \"B\": \"x = 2\", \"C\": \"x = 3\", \"D\": \"x = 4\"}', 'C', '移项得 2x = 5 + 1，即 2x = 6。两边同时除以2，得 x = 3。', '1', 2.00, '0', '一元一次方程-求解', NULL, '2025-10-03 15:15:14', NULL, '2025-10-03 15:15:14', NULL);
INSERT INTO `edu_question` VALUES (1974001927466979336, '000000', 1974008748755849218, '3', '两点之间，线段最短。', '{\"A\": \"正确\", \"B\": \"错误\"}', 'A', '这是公理，即两点之间所有连线中，线段的长度最短。', '1', 2.00, '0', '几何图形初步-公理', NULL, '2025-10-03 15:15:14', NULL, '2025-10-03 15:15:14', NULL);
INSERT INTO `edu_question` VALUES (1974001927466979337, '000000', 1974008748755849218, '1', '用科学记数法表示数 360000，正确的是？', '{\"A\": \"3.6 × 10⁶\", \"B\": \"3.6 × 10⁵\", \"C\": \"36 × 10⁴\", \"D\": \"0.36 × 10⁶\"}', 'B', '科学记数法的形式是 a × 10ⁿ，其中 1 ≤ |a| < 10，n为整数。将360000的小数点向左移动5位得到3.6，所以n=5。', '2', 2.00, '0', '有理数-科学记数法', NULL, '2025-10-03 15:15:14', NULL, '2025-10-03 15:15:14', NULL);
INSERT INTO `edu_question` VALUES (1974001927466979338, '000000', 1974008748755849218, '2', '如果两条直线平行，那么下列结论正确的有？', '{\"A\": \"同位角相等\", \"B\": \"内错角相等\", \"C\": \"同旁内角相等\", \"D\": \"同旁内角互补\"}', 'A,B,D', '平行线的性质：两直线平行，同位角相等；两直线平行，内错角相等；两直线平行，同旁内角互补。C项错误。', '2', 3.00, '0', '平行线性质', NULL, '2025-10-03 15:15:14', NULL, '2025-10-03 15:15:14', NULL);
INSERT INTO `edu_question` VALUES (1974001927466979339, '000000', 1974008748755849218, '1', '单项式 -2xy² 的系数和次数分别是？', '{\"A\": \"-2, 2\", \"B\": \"-2, 3\", \"C\": \"2, 2\", \"D\": \"2, 3\"}', 'B', '系数是数字因数，即-2。次数是所有字母的指数之和，即x的1次与y的2次之和，为1+2=3。', '2', 2.00, '0', '整式加减-概念', NULL, '2025-10-03 15:15:14', NULL, '2025-10-03 15:15:14', NULL);
INSERT INTO `edu_question` VALUES (1974001927466979340, '000000', 1974008748755849218, '3', '相等的角是对顶角。', '{\"A\": \"正确\", \"B\": \"错误\"}', 'B', '对顶角一定相等，但相等的角不一定是对顶角。例如，两个45°的角并排放置，它们相等但不是对顶角。', '2', 2.00, '0', '相交线-对顶角', NULL, '2025-10-03 15:15:14', NULL, '2025-10-03 15:15:14', NULL);
INSERT INTO `edu_question` VALUES (1974001927466979341, '000000', 1974008748755849218, '1', '若一个角的补角是130°，则这个角的余角是？', '{\"A\": \"40°\", \"B\": \"50°\", \"C\": \"60°\", \"D\": \"140°\"}', 'A', '这个角 = 180° - 130° = 50°。这个角的余角 = 90° - 50° = 40°。', '2', 2.00, '0', '几何-余角和补角', NULL, '2025-10-03 15:15:14', NULL, '2025-10-03 15:15:14', NULL);
INSERT INTO `edu_question` VALUES (1974001927466979342, '000000', 1974008748755849218, '1', '下列运算中，正确的是？', '{\"A\": \"3x + 2y = 5xy\", \"B\": \"x² + x² = x⁴\", \"C\": \"5a² - 2a² = 3a²\", \"D\": \"(a-b)² = a²-b²\"}', 'C', 'A项不是同类项，不能合并。B项 x²+x²=2x²。C项正确，合并同类项。D项是完全平方公式，(a-b)² = a²-2ab+b²。', '2', 2.00, '0', '整式运算', NULL, '2025-10-03 15:15:14', NULL, '2025-10-03 15:15:14', NULL);
INSERT INTO `edu_question` VALUES (1974001927466979343, '000000', 1974008748755849218, '3', '方程 3x = 3y 是一个一元一次方程。', '{\"A\": \"正确\", \"B\": \"错误\"}', 'B', '该方程含有x和y两个未知数，属于二元一次方程。一元一次方程只含有一个未知数，并且未知数的次数是1。', '1', 2.00, '0', '方程概念', NULL, '2025-10-03 15:15:14', NULL, '2025-10-03 15:15:14', NULL);
INSERT INTO `edu_question` VALUES (1974001927466979344, '000000', 1974008748755849218, '1', '点 P(-2, 3) 位于哪个象限？', '{\"A\": \"第一象限\", \"B\": \"第二象限\", \"C\": \"第三象限\", \"D\": \"第四象限\"}', 'B', '横坐标为负，纵坐标为正的点位于第二象限。', '1', 2.00, '0', '平面直角坐标系', NULL, '2025-10-03 15:15:14', NULL, '2025-10-03 15:15:14', NULL);
INSERT INTO `edu_question` VALUES (1974001927466979345, '000000', 1974008748755849218, '2', '下列说法中，正确的有？', '{\"A\": \"-a 一定是负数\", \"B\": \"倒数等于本身的数是1和-1\", \"C\": \"绝对值最小的数是0\", \"D\": \"任何有理数的平方都是正数\"}', 'B,C', 'A项错误，当a是负数时，-a是正数。B项正确，1的倒数是1，-1的倒数是-1。C项正确，|x|≥0，所以最小值为0。D项错误，0的平方是0，不是正数。', '3', 3.00, '0', '有理数综合', NULL, '2025-10-03 15:15:14', NULL, '2025-10-03 15:15:14', NULL);
INSERT INTO `edu_question` VALUES (1974001927466979346, '000000', 1974008748755849218, '1', '一个正方体的表面展开图不可能是下列哪个图形？', '{\"A\": \"一四一型\", \"B\": \"二三一型\", \"C\": \"三三型\", \"D\": \"田字型\"}', 'D', '正方体展开图有“一四一”、“二三一”、“三三”、“二二二”等11种基本类型。“田字型”折叠后会有两个面重叠，无法构成正方体。', '2', 2.00, '0', '几何体展开图', NULL, '2025-10-03 15:15:14', NULL, '2025-10-03 15:15:14', NULL);
INSERT INTO `edu_question` VALUES (1974001927466979347, '000000', 1974008748755849218, '3', '过一点有且只有一条直线与已知直线平行。', '{\"A\": \"正确\", \"B\": \"错误\"}', 'B', '这个是平行公理，但它的前提是“在同一平面内，过直线外一点”。题目中没有“直线外”这个前提，如果该点在直线上，则没有直线与已知直线平行。所以描述不严谨，是错误的。', '3', 2.00, '0', '平行公理', NULL, '2025-10-03 15:15:14', NULL, '2025-10-03 15:15:14', NULL);
INSERT INTO `edu_question` VALUES (1974001927466979348, '000000', 1974008748755849218, '1', '去括号：a - (b - c) = ?', '{\"A\": \"a - b - c\", \"B\": \"a - b + c\", \"C\": \"a + b - c\", \"D\": \"a + b + c\"}', 'B', '括号前是减号，去括号时，括号内的各项都要变号。所以 a - (b - c) = a - b + c。', '1', 2.00, '0', '整式加减-去括号', NULL, '2025-10-03 15:15:14', NULL, '2025-10-03 15:15:14', NULL);
INSERT INTO `edu_question` VALUES (1974001927466979349, '000000', 1974008748755849218, '1', '一件商品打八折后的价格是80元，则这件商品的原价是？', '{\"A\": \"64元\", \"B\": \"96元\", \"C\": \"100元\", \"D\": \"120元\"}', 'C', '设原价为x元，则 0.8x = 80。解得 x = 80 / 0.8 = 100。', '2', 3.00, '0', '方程应用题', NULL, '2025-10-03 15:15:14', NULL, '2025-10-03 15:15:14', NULL);
INSERT INTO `edu_question` VALUES (1974001927466979350, '000000', 1974008748755849218, '2', '下列方程中，解为 x = 2 的有？', '{\"A\": \"x + 2 = 0\", \"B\": \"3x - 6 = 0\", \"C\": \"x/2 = 1\", \"D\": \"5 - x = 3\"}', 'B,C,D', 'A: x = -2。 B: 3x = 6, x = 2。 C: x = 1 * 2, x = 2。 D: 5 - 3 = x, x = 2。所以B, C, D正确。', '2', 3.00, '0', '方程的解', NULL, '2025-10-03 15:15:14', NULL, '2025-10-03 15:15:14', NULL);
INSERT INTO `edu_question` VALUES (1974001927466979351, '000000', 1974008748755849218, '3', '垂线段最短。', '{\"A\": \"正确\", \"B\": \"错误\"}', 'A', '这是垂线性质：直线外一点与直线上各点连接的所有线段中，垂线段最短。', '1', 2.00, '0', '垂线性质', NULL, '2025-10-03 15:15:14', NULL, '2025-10-03 15:15:14', NULL);
INSERT INTO `edu_question` VALUES (1974001927466979352, '000000', 1974008748755849218, '1', '(-2)³ 的计算结果是？', '{\"A\": \"-8\", \"B\": \"8\", \"C\": \"-6\", \"D\": \"6\"}', 'A', '(-2)³ = (-2) × (-2) × (-2) = 4 × (-2) = -8。', '1', 2.00, '0', '有理数乘方', NULL, '2025-10-03 15:15:14', NULL, '2025-10-03 15:15:14', NULL);
INSERT INTO `edu_question` VALUES (1974001927466979353, '000000', 1974008748755849218, '1', '若 x = 1 是关于 x 的方程 2x + m = 4 的解，则 m 的值是？', '{\"A\": \"1\", \"B\": \"2\", \"C\": \"3\", \"D\": \"-2\"}', 'B', '将 x = 1 代入方程得 2(1) + m = 4，即 2 + m = 4，解得 m = 2。', '2', 2.00, '0', '方程-求待定系数', NULL, '2025-10-03 15:15:14', NULL, '2025-10-03 15:15:14', NULL);
INSERT INTO `edu_question` VALUES (1974001927466979354, '000000', 1974008748755849218, '2', '下列调查方式中，适合采用普查的是？', '{\"A\": \"了解全国中学生的身高情况\", \"B\": \"检查一批灯泡的使用寿命\", \"C\": \"对某航班的乘客进行安检\", \"D\": \"了解某班级学生的数学成绩\"}', 'C,D', '普查是对全体对象进行调查。A和B的调查范围太大或具有破坏性，适合抽样调查。C和D的对象数量有限且需要对每一个体进行调查，适合普查。', '2', 3.00, '0', '数据调查', NULL, '2025-10-03 15:15:14', NULL, '2025-10-03 15:15:14', NULL);
INSERT INTO `edu_question` VALUES (1974001927466979355, '000000', 1974008748755849218, '3', '多项式 x² - 3x + 2 的常数项是 2。', '{\"A\": \"正确\", \"B\": \"错误\"}', 'A', '多项式中不含字母的项叫做常数项。在这个多项式中，x²是二次项，-3x是一次项，+2是常数项。', '1', 2.00, '0', '多项式概念', NULL, '2025-10-03 15:15:14', NULL, '2025-10-03 15:15:14', NULL);
INSERT INTO `edu_question` VALUES (1974001927466979356, '000000', 1974008748755849218, '1', '如图，直线a, b被直线c所截，若a∥b，∠1=60°，则∠2的度数是？', '{\"A\": \"30°\", \"B\": \"60°\", \"C\": \"120°\", \"D\": \"150°\"}', 'B', '（需要配图）分析：因为a∥b，所以∠1与∠2的对顶角是同位角，所以相等。又因为对顶角相等，所以∠2=∠1=60°。或者，∠1与∠2是内错角，根据“两直线平行，内错角相等”可得∠2=60°。', '2', 2.00, '0', '平行线性质-计算', NULL, '2025-10-03 15:15:14', NULL, '2025-10-03 15:15:14', NULL);
INSERT INTO `edu_question` VALUES (1974001927466979357, '000000', 1974008748755849218, '1', '在数轴上，表示-4的点与表示2的点的距离是？', '{\"A\": \"-2\", \"B\": \"2\", \"C\": \"-6\", \"D\": \"6\"}', 'D', '数轴上两点间的距离等于两点所表示的数的差的绝对值。|(-4) - 2| = |-6| = 6。', '2', 2.00, '0', '数轴-距离', NULL, '2025-10-03 15:15:14', NULL, '2025-10-03 15:15:14', NULL);
INSERT INTO `edu_question` VALUES (1974001927466979358, '000000', 1974008748755849218, '3', '代数式 5/x 是一个单项式。', '{\"A\": \"正确\", \"B\": \"错误\"}', 'B', '单项式的分母中不能含有字母。5/x 是分式，不是单项式，也不是多项式，因此不是整式。', '2', 2.00, '0', '整式概念', NULL, '2025-10-03 15:15:14', NULL, '2025-10-03 15:15:14', NULL);
INSERT INTO `edu_question` VALUES (1974001927466979359, '000000', 1974008748755849218, '1', '将方程 (x-1)/2 - x/3 = 1 去分母，正确的是？', '{\"A\": \"3(x-1) - 2x = 1\", \"B\": \"3x-1 - 2x = 6\", \"C\": \"3(x-1) - 2x = 6\", \"D\": \"3x-3 - 2x = 1\"}', 'C', '方程两边同时乘以分母的最小公倍数6。 (x-1)/2 * 6 = 3(x-1)；x/3 * 6 = 2x；1 * 6 = 6。所以原方程变为 3(x-1) - 2x = 6。', '3', 3.00, '0', '解方程-去分母', NULL, '2025-10-03 15:15:14', NULL, '2025-10-03 15:15:14', NULL);
INSERT INTO `edu_question` VALUES (1974001927466979360, '000000', 1974008748755849218, '1', '一个角的度数是35°30′，则它的余角的度数是？', '{\"A\": \"54°30′\", \"B\": \"54°70′\", \"C\": \"55°30′\", \"D\": \"144°30′\"}', 'A', '余角之和为90°。计算 90° - 35°30′。 90°可以写成 89°60′。所以 89°60′ - 35°30′ = (89-35)°(60-30)′ = 54°30′。', '2', 2.00, '0', '角度计算', NULL, '2025-10-03 15:15:14', NULL, '2025-10-03 15:15:14', NULL);

-- ----------------------------
-- Table structure for edu_question_bank
-- ----------------------------
DROP TABLE IF EXISTS `edu_question_bank`;
CREATE TABLE `edu_question_bank`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '题库ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '租户编号',
  `bank_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '题库名称',
  `bank_desc` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '题库描述',
  `category_id` bigint NOT NULL COMMENT '分类ID',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1974008748755849219 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '题库表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_question_bank
-- ----------------------------
INSERT INTO `edu_question_bank` VALUES (1972218357127794689, '000000', '测试题库', '123', 1, '0', NULL, 103, '2025-09-28 16:34:33', 1, '2025-09-29 21:04:39', 1);
INSERT INTO `edu_question_bank` VALUES (1973944395251740674, '000000', '初一语文', NULL, 1972292862084866050, '0', NULL, 103, '2025-10-03 10:53:13', 1, '2025-10-04 14:07:34', 1);
INSERT INTO `edu_question_bank` VALUES (1974008748755849218, '000000', '初一数学', NULL, 1972292880988594177, '0', NULL, 103, '2025-10-03 15:08:56', 1, '2025-10-04 14:07:38', 1);

-- ----------------------------
-- Table structure for edu_question_bank_category
-- ----------------------------
DROP TABLE IF EXISTS `edu_question_bank_category`;
CREATE TABLE `edu_question_bank_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '租户编号',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父级分类ID，根节点为0',
  `category_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `category_desc` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类描述',
  `sort_order` int NULL DEFAULT 0 COMMENT '排序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1972551817025511426 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '题库分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_question_bank_category
-- ----------------------------
INSERT INTO `edu_question_bank_category` VALUES (1, '000000', 0, '题库分类', NULL, 0, '0', NULL, 103, '2025-09-28 16:09:40', 1, '2025-09-28 16:09:40', 1);
INSERT INTO `edu_question_bank_category` VALUES (1972292834104664065, '000000', 0, '初一', NULL, 1, '0', NULL, 103, '2025-09-28 21:30:30', 1, '2025-09-28 21:46:02', 1);
INSERT INTO `edu_question_bank_category` VALUES (1972292862084866050, '000000', 1972292834104664065, '语文', NULL, 1, '0', NULL, 103, '2025-09-28 21:30:36', 1, '2025-09-28 21:49:49', 1);
INSERT INTO `edu_question_bank_category` VALUES (1972292880988594177, '000000', 1972292834104664065, '数学', NULL, 2, '0', NULL, 103, '2025-09-28 21:30:41', 1, '2025-09-28 21:49:38', 1);

-- ----------------------------
-- Table structure for flow_category
-- ----------------------------
DROP TABLE IF EXISTS `flow_category`;
CREATE TABLE `flow_category`  (
  `category_id` bigint NOT NULL COMMENT '流程分类ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父流程分类id',
  `ancestors` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `category_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '流程分类名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '流程分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_category
-- ----------------------------
INSERT INTO `flow_category` VALUES (100, '000000', 0, '0', 'OA审批', 0, '0', 103, 1, '2025-10-04 11:01:24', NULL, NULL);
INSERT INTO `flow_category` VALUES (101, '000000', 100, '0,100', '假勤管理', 0, '0', 103, 1, '2025-10-04 11:01:24', NULL, NULL);
INSERT INTO `flow_category` VALUES (102, '000000', 100, '0,100', '人事管理', 1, '0', 103, 1, '2025-10-04 11:01:24', NULL, NULL);
INSERT INTO `flow_category` VALUES (103, '000000', 101, '0,100,101', '请假', 0, '0', 103, 1, '2025-10-04 11:01:24', NULL, NULL);
INSERT INTO `flow_category` VALUES (104, '000000', 101, '0,100,101', '出差', 1, '0', 103, 1, '2025-10-04 11:01:24', NULL, NULL);
INSERT INTO `flow_category` VALUES (105, '000000', 101, '0,100,101', '加班', 2, '0', 103, 1, '2025-10-04 11:01:24', NULL, NULL);
INSERT INTO `flow_category` VALUES (106, '000000', 101, '0,100,101', '换班', 3, '0', 103, 1, '2025-10-04 11:01:24', NULL, NULL);
INSERT INTO `flow_category` VALUES (107, '000000', 101, '0,100,101', '外出', 4, '0', 103, 1, '2025-10-04 11:01:24', NULL, NULL);
INSERT INTO `flow_category` VALUES (108, '000000', 102, '0,100,102', '转正', 1, '0', 103, 1, '2025-10-04 11:01:24', NULL, NULL);
INSERT INTO `flow_category` VALUES (109, '000000', 102, '0,100,102', '离职', 2, '0', 103, 1, '2025-10-04 11:01:24', NULL, NULL);

-- ----------------------------
-- Table structure for flow_definition
-- ----------------------------
DROP TABLE IF EXISTS `flow_definition`;
CREATE TABLE `flow_definition`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `flow_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '流程编码',
  `flow_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '流程名称',
  `model_value` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'CLASSICS' COMMENT '设计器模型（CLASSICS经典模型 MIMIC仿钉钉模型）',
  `category` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '流程类别',
  `version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '流程版本',
  `is_publish` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否发布（0未发布 1已发布 9失效）',
  `form_custom` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '审批表单是否自定义（Y是 N否）',
  `form_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批表单路径',
  `activity_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '流程激活状态（0挂起 1激活）',
  `listener_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '监听器类型',
  `listener_path` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '监听器路径',
  `ext` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务详情 存业务表对象json字符串',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志',
  `tenant_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '流程定义表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_definition
-- ----------------------------

-- ----------------------------
-- Table structure for flow_his_task
-- ----------------------------
DROP TABLE IF EXISTS `flow_his_task`;
CREATE TABLE `flow_his_task`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `definition_id` bigint NOT NULL COMMENT '对应flow_definition表的id',
  `instance_id` bigint NOT NULL COMMENT '对应flow_instance表的id',
  `task_id` bigint NOT NULL COMMENT '对应flow_task表的id',
  `node_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开始节点编码',
  `node_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开始节点名称',
  `node_type` tinyint(1) NULL DEFAULT NULL COMMENT '开始节点类型（0开始节点 1中间节点 2结束节点 3互斥网关 4并行网关）',
  `target_node_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '目标节点编码',
  `target_node_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结束节点名称',
  `approver` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批者',
  `cooperate_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '协作方式(1审批 2转办 3委派 4会签 5票签 6加签 7减签)',
  `collaborator` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '协作人',
  `skip_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '流转类型（PASS通过 REJECT退回 NONE无动作）',
  `flow_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '流程状态（0待提交 1审批中 2审批通过 4终止 5作废 6撤销 8已完成 9已退回 10失效 11拿回）',
  `form_custom` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '审批表单是否自定义（Y是 N否）',
  `form_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批表单路径',
  `message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批意见',
  `variable` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '任务变量',
  `ext` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '业务详情 存业务表对象json字符串',
  `create_time` datetime NULL DEFAULT NULL COMMENT '任务开始时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '审批完成时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志',
  `tenant_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '历史任务记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_his_task
-- ----------------------------

-- ----------------------------
-- Table structure for flow_instance
-- ----------------------------
DROP TABLE IF EXISTS `flow_instance`;
CREATE TABLE `flow_instance`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `definition_id` bigint NOT NULL COMMENT '对应flow_definition表的id',
  `business_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '业务id',
  `node_type` tinyint(1) NOT NULL COMMENT '节点类型（0开始节点 1中间节点 2结束节点 3互斥网关 4并行网关）',
  `node_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '流程节点编码',
  `node_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '流程节点名称',
  `variable` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '任务变量',
  `flow_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '流程状态（0待提交 1审批中 2审批通过 4终止 5作废 6撤销 8已完成 9已退回 10失效 11拿回）',
  `activity_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '流程激活状态（0挂起 1激活）',
  `def_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '流程定义json',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `ext` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扩展字段，预留给业务系统使用',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志',
  `tenant_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '流程实例表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_instance
-- ----------------------------

-- ----------------------------
-- Table structure for flow_instance_biz_ext
-- ----------------------------
DROP TABLE IF EXISTS `flow_instance_biz_ext`;
CREATE TABLE `flow_instance_biz_ext`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `business_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务编码',
  `business_title` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务标题',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `instance_id` bigint NULL DEFAULT NULL COMMENT '流程实例Id',
  `business_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务Id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '流程实例业务扩展表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_instance_biz_ext
-- ----------------------------

-- ----------------------------
-- Table structure for flow_node
-- ----------------------------
DROP TABLE IF EXISTS `flow_node`;
CREATE TABLE `flow_node`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `node_type` tinyint(1) NOT NULL COMMENT '节点类型（0开始节点 1中间节点 2结束节点 3互斥网关 4并行网关）',
  `definition_id` bigint NOT NULL COMMENT '流程定义id',
  `node_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '流程节点编码',
  `node_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '流程节点名称',
  `permission_flag` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识（权限类型:权限标识，可以多个，用@@隔开)',
  `node_ratio` decimal(6, 3) NULL DEFAULT NULL COMMENT '流程签署比例值',
  `coordinate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '坐标',
  `any_node_skip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任意结点跳转',
  `listener_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '监听器类型',
  `listener_path` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '监听器路径',
  `handler_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理器类型',
  `handler_path` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理器路径',
  `form_custom` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '审批表单是否自定义（Y是 N否）',
  `form_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批表单路径',
  `version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '版本',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `ext` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '节点扩展属性',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志',
  `tenant_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '流程节点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_node
-- ----------------------------

-- ----------------------------
-- Table structure for flow_skip
-- ----------------------------
DROP TABLE IF EXISTS `flow_skip`;
CREATE TABLE `flow_skip`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `definition_id` bigint NOT NULL COMMENT '流程定义id',
  `now_node_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '当前流程节点的编码',
  `now_node_type` tinyint(1) NULL DEFAULT NULL COMMENT '当前节点类型（0开始节点 1中间节点 2结束节点 3互斥网关 4并行网关）',
  `next_node_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '下一个流程节点的编码',
  `next_node_type` tinyint(1) NULL DEFAULT NULL COMMENT '下一个节点类型（0开始节点 1中间节点 2结束节点 3互斥网关 4并行网关）',
  `skip_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '跳转名称',
  `skip_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '跳转类型（PASS审批通过 REJECT退回）',
  `skip_condition` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '跳转条件',
  `coordinate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '坐标',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志',
  `tenant_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '节点跳转关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_skip
-- ----------------------------

-- ----------------------------
-- Table structure for flow_spel
-- ----------------------------
DROP TABLE IF EXISTS `flow_spel`;
CREATE TABLE `flow_spel`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `component_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件名称',
  `method_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方法名',
  `method_params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数',
  `view_spel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预览spel表达式',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '流程spel表达式定义表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_spel
-- ----------------------------
INSERT INTO `flow_spel` VALUES (1, 'spelRuleComponent', 'selectDeptLeaderById', 'initiatorDeptId', '#{@spelRuleComponent.selectDeptLeaderById(#initiatorDeptId)}', '根据部门id获取部门负责人', '0', '0', 103, 1, '2025-10-04 11:01:24', 1, '2025-10-04 11:01:24');
INSERT INTO `flow_spel` VALUES (2, NULL, NULL, 'initiator', '${initiator}', '流程发起人', '0', '0', 103, 1, '2025-10-04 11:01:24', 1, '2025-10-04 11:01:24');

-- ----------------------------
-- Table structure for flow_task
-- ----------------------------
DROP TABLE IF EXISTS `flow_task`;
CREATE TABLE `flow_task`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `definition_id` bigint NOT NULL COMMENT '对应flow_definition表的id',
  `instance_id` bigint NOT NULL COMMENT '对应flow_instance表的id',
  `node_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '节点编码',
  `node_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '节点名称',
  `node_type` tinyint(1) NOT NULL COMMENT '节点类型（0开始节点 1中间节点 2结束节点 3互斥网关 4并行网关）',
  `flow_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '流程状态（0待提交 1审批中 2审批通过 4终止 5作废 6撤销 8已完成 9已退回 10失效 11拿回）',
  `form_custom` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '审批表单是否自定义（Y是 N否）',
  `form_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批表单路径',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志',
  `tenant_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '待办任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_task
-- ----------------------------

-- ----------------------------
-- Table structure for flow_user
-- ----------------------------
DROP TABLE IF EXISTS `flow_user`;
CREATE TABLE `flow_user`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人员类型（1待办任务的审批人权限 2待办任务的转办人权限 3待办任务的委托人权限）',
  `processed_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限人',
  `associated` bigint NOT NULL COMMENT '任务表id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志',
  `tenant_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_processed_type`(`processed_by` ASC, `type` ASC) USING BTREE,
  INDEX `user_associated`(`associated` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '流程用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_user
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL COMMENT '编号',
  `data_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '数据源名称',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1972192031301898242, 'master', 'edu_question_bank', '题库表', NULL, NULL, 'EduQuestionBank', 'crud', 'org.dromara.edu', 'edu', 'questionBank', '题库', 'eezd', '0', '/', '{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1972195018522955778\"}', 103, 1, '2025-09-28 14:49:56', 1, '2025-09-29 21:17:29', NULL);
INSERT INTO `gen_table` VALUES (1972192031821991938, 'master', 'edu_question_bank_category', '题库分类表', '', '', 'EduQuestionBankCategory', 'tree', 'org.dromara.edu', 'edu', 'questionBankCategory', '题库分类', 'eezd', '0', '/', '{\"treeCode\":\"id\",\"treeName\":\"category_name\",\"treeParentCode\":\"parent_id\",\"parentMenuId\":\"1972195018522955778\"}', 103, 1, '2025-09-28 14:49:57', 1, '2025-09-29 21:17:23', NULL);
INSERT INTO `gen_table` VALUES (1973926227707899906, 'master', 'edu_question', '试题表', NULL, NULL, 'EduQuestion', 'crud', 'org.dromara.edu', 'edu', 'question', '试题', 'eezd', '0', '/', '{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1972195018522955778\"}', 103, 1, '2025-10-03 09:41:01', 1, '2025-10-03 14:32:42', NULL);
INSERT INTO `gen_table` VALUES (1974352410014609409, 'master', 'edu_exam_category', '考试分类表', '', '', 'EduExamCategory', 'tree', 'org.dromara.edu', 'edu', 'examCategory', '考试分类', 'eezd', '0', '/', '{\"treeCode\":\"id\",\"treeName\":\"category_name\",\"treeParentCode\":\"parent_id\",\"parentMenuId\":\"1972195018522955778\"}', 103, 1, '2025-10-04 13:54:31', 1, '2025-10-04 14:03:16', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1972192031712940034, 1972192031301898242, 'id', '题库ID', 'bigint', 'Long', 'id', '1', '1', '1', NULL, '1', '1', NULL, 'EQ', 'input', '', 1, 103, 1, '2025-09-28 14:49:57', 1, '2025-09-29 21:17:29');
INSERT INTO `gen_table_column` VALUES (1972192031712940035, 1972192031301898242, 'tenant_id', '租户编号', 'varchar(20)', 'String', 'tenantId', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 2, 103, 1, '2025-09-28 14:49:57', 1, '2025-09-29 21:17:29');
INSERT INTO `gen_table_column` VALUES (1972192031712940036, 1972192031301898242, 'bank_name', '题库名称', 'varchar(200)', 'String', 'bankName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 103, 1, '2025-09-28 14:49:57', 1, '2025-09-29 21:17:29');
INSERT INTO `gen_table_column` VALUES (1972192031712940037, 1972192031301898242, 'bank_desc', '题库描述', 'varchar(1000)', 'String', 'bankDesc', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 4, 103, 1, '2025-09-28 14:49:57', 1, '2025-09-29 21:17:29');
INSERT INTO `gen_table_column` VALUES (1972192031712940038, 1972192031301898242, 'category_id', '分类ID', 'bigint', 'Long', 'categoryId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 103, 1, '2025-09-28 14:49:57', 1, '2025-09-29 21:17:29');
INSERT INTO `gen_table_column` VALUES (1972192031763271681, 1972192031301898242, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'edu_question_bank_status', 6, 103, 1, '2025-09-28 14:49:57', 1, '2025-09-29 21:17:29');
INSERT INTO `gen_table_column` VALUES (1972192031767465985, 1972192031301898242, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 7, 103, 1, '2025-09-28 14:49:57', 1, '2025-09-29 21:17:29');
INSERT INTO `gen_table_column` VALUES (1972192031775854593, 1972192031301898242, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 8, 103, 1, '2025-09-28 14:49:57', 1, '2025-09-29 21:17:29');
INSERT INTO `gen_table_column` VALUES (1972192031775854594, 1972192031301898242, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 103, 1, '2025-09-28 14:49:57', 1, '2025-09-29 21:17:29');
INSERT INTO `gen_table_column` VALUES (1972192031775854595, 1972192031301898242, 'create_by', '创建人', 'bigint', 'Long', 'createBy', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 10, 103, 1, '2025-09-28 14:49:57', 1, '2025-09-29 21:17:29');
INSERT INTO `gen_table_column` VALUES (1972192031775854596, 1972192031301898242, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 11, 103, 1, '2025-09-28 14:49:57', 1, '2025-09-29 21:17:29');
INSERT INTO `gen_table_column` VALUES (1972192031775854597, 1972192031301898242, 'update_by', '更新人', 'bigint', 'Long', 'updateBy', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 12, 103, 1, '2025-09-28 14:49:57', 1, '2025-09-29 21:17:29');
INSERT INTO `gen_table_column` VALUES (1972192032044290049, 1972192031821991938, 'id', '分类ID', 'bigint', 'Long', 'id', '1', '1', '0', NULL, '1', '1', NULL, 'EQ', 'input', '', 1, 103, 1, '2025-09-28 14:49:57', 1, '2025-09-29 21:17:23');
INSERT INTO `gen_table_column` VALUES (1972192032052678658, 1972192031821991938, 'tenant_id', '租户编号', 'varchar(20)', 'String', 'tenantId', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 2, 103, 1, '2025-09-28 14:49:57', 1, '2025-09-29 21:17:23');
INSERT INTO `gen_table_column` VALUES (1972192032061067265, 1972192031821991938, 'parent_id', '父级分类ID，根节点为0', 'bigint', 'Long', 'parentId', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 3, 103, 1, '2025-09-28 14:49:57', 1, '2025-09-29 21:17:23');
INSERT INTO `gen_table_column` VALUES (1972192032061067266, 1972192031821991938, 'category_name', '分类名称', 'varchar(100)', 'String', 'categoryName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 103, 1, '2025-09-28 14:49:57', 1, '2025-09-29 21:17:23');
INSERT INTO `gen_table_column` VALUES (1972192032061067267, 1972192031821991938, 'category_desc', '分类描述', 'varchar(500)', 'String', 'categoryDesc', '0', '0', '0', '1', '1', '0', '0', 'EQ', 'textarea', '', 5, 103, 1, '2025-09-28 14:49:57', 1, '2025-09-29 21:17:23');
INSERT INTO `gen_table_column` VALUES (1972192032061067268, 1972192031821991938, 'sort_order', '排序', 'int', 'Long', 'sortOrder', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 6, 103, 1, '2025-09-28 14:49:57', 1, '2025-09-29 21:17:23');
INSERT INTO `gen_table_column` VALUES (1972192032061067269, 1972192031821991938, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'radio', 'edu_question_bank_category_status', 7, 103, 1, '2025-09-28 14:49:57', 1, '2025-09-29 21:17:23');
INSERT INTO `gen_table_column` VALUES (1972192032061067270, 1972192031821991938, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '0', NULL, 'EQ', 'textarea', '', 8, 103, 1, '2025-09-28 14:49:57', 1, '2025-09-29 21:17:23');
INSERT INTO `gen_table_column` VALUES (1972192032061067271, 1972192031821991938, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 9, 103, 1, '2025-09-28 14:49:57', 1, '2025-09-29 21:17:23');
INSERT INTO `gen_table_column` VALUES (1972192032086233090, 1972192031821991938, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 103, 1, '2025-09-28 14:49:57', 1, '2025-09-29 21:17:23');
INSERT INTO `gen_table_column` VALUES (1972192032086233091, 1972192031821991938, 'create_by', '创建人', 'bigint', 'Long', 'createBy', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 11, 103, 1, '2025-09-28 14:49:57', 1, '2025-09-29 21:17:23');
INSERT INTO `gen_table_column` VALUES (1972192032086233092, 1972192031821991938, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 103, 1, '2025-09-28 14:49:57', 1, '2025-09-29 21:17:23');
INSERT INTO `gen_table_column` VALUES (1972192032086233093, 1972192031821991938, 'update_by', '更新人', 'bigint', 'Long', 'updateBy', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 13, 103, 1, '2025-09-28 14:49:57', 1, '2025-09-29 21:17:23');
INSERT INTO `gen_table_column` VALUES (1973926227972141057, 1973926227707899906, 'id', '试题ID', 'bigint', 'Long', 'id', '1', '1', '1', NULL, '1', '1', NULL, 'EQ', 'input', '', 1, 103, 1, '2025-10-03 09:41:01', 1, '2025-10-03 14:32:42');
INSERT INTO `gen_table_column` VALUES (1973926227980529666, 1973926227707899906, 'tenant_id', '租户编号', 'varchar(20)', 'String', 'tenantId', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 2, 103, 1, '2025-10-03 09:41:01', 1, '2025-10-03 14:32:42');
INSERT INTO `gen_table_column` VALUES (1973926227988918274, 1973926227707899906, 'question_type', '题目类型（1-单选 2-多选 3-判断）', 'char(1)', 'String', 'questionType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'edu_question_type', 4, 103, 1, '2025-10-03 09:41:01', 1, '2025-10-03 14:32:42');
INSERT INTO `gen_table_column` VALUES (1973926227988918275, 1973926227707899906, 'question_title', '题目', 'text', 'String', 'questionTitle', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'textarea', '', 5, 103, 1, '2025-10-03 09:41:01', 1, '2025-10-03 14:32:42');
INSERT INTO `gen_table_column` VALUES (1973926227988918277, 1973926227707899906, 'options', '选项内容（JSON格式，判断题可为空）', 'json', 'String', 'options', '0', '0', '1', '1', '1', '1', '0', 'EQ', NULL, '', 6, 103, 1, '2025-10-03 09:41:01', 1, '2025-10-03 14:32:42');
INSERT INTO `gen_table_column` VALUES (1973926227988918278, 1973926227707899906, 'correct_answer', '正确答案', 'varchar(255)', 'String', 'correctAnswer', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 7, 103, 1, '2025-10-03 09:41:01', 1, '2025-10-03 14:32:42');
INSERT INTO `gen_table_column` VALUES (1973926227988918279, 1973926227707899906, 'answer_analysis', '答案解析', 'text', 'String', 'answerAnalysis', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 8, 103, 1, '2025-10-03 09:41:01', 1, '2025-10-03 14:32:42');
INSERT INTO `gen_table_column` VALUES (1973926227988918280, 1973926227707899906, 'difficulty', '难度等级（1-简单 2-中等 3-困难）', 'char(1)', 'String', 'difficulty', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 103, 1, '2025-10-03 09:41:01', 1, '2025-10-03 14:32:42');
INSERT INTO `gen_table_column` VALUES (1973926227988918281, 1973926227707899906, 'score', '题目分值', 'decimal(5,2)', 'Long', 'score', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 10, 103, 1, '2025-10-03 09:41:01', 1, '2025-10-03 14:32:42');
INSERT INTO `gen_table_column` VALUES (1973926227988918282, 1973926227707899906, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'edu_question_status', 11, 103, 1, '2025-10-03 09:41:01', 1, '2025-10-03 14:32:42');
INSERT INTO `gen_table_column` VALUES (1973926227988918283, 1973926227707899906, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 12, 103, 1, '2025-10-03 09:41:01', 1, '2025-10-03 14:32:42');
INSERT INTO `gen_table_column` VALUES (1973926227988918284, 1973926227707899906, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 13, 103, 1, '2025-10-03 09:41:01', 1, '2025-10-03 14:32:42');
INSERT INTO `gen_table_column` VALUES (1973926228035055617, 1973926227707899906, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 103, 1, '2025-10-03 09:41:01', 1, '2025-10-03 14:32:42');
INSERT INTO `gen_table_column` VALUES (1973926228035055618, 1973926227707899906, 'create_by', '创建人', 'bigint', 'Long', 'createBy', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 15, 103, 1, '2025-10-03 09:41:01', 1, '2025-10-03 14:32:42');
INSERT INTO `gen_table_column` VALUES (1973926228035055619, 1973926227707899906, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 103, 1, '2025-10-03 09:41:01', 1, '2025-10-03 14:32:42');
INSERT INTO `gen_table_column` VALUES (1973926228039249921, 1973926227707899906, 'update_by', '更新人', 'bigint', 'Long', 'updateBy', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 17, 103, 1, '2025-10-03 09:41:01', 1, '2025-10-03 14:32:42');
INSERT INTO `gen_table_column` VALUES (1973999152871997442, 1973926227707899906, 'bank_id', '题库ID', 'bigint', 'Long', 'bankId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 103, 1, '2025-10-03 14:30:48', 1, '2025-10-03 14:32:42');
INSERT INTO `gen_table_column` VALUES (1974352410333376514, 1974352410014609409, 'id', '考试分类ID', 'bigint', 'Long', 'id', '1', '1', '1', NULL, '1', '1', NULL, 'EQ', 'input', '', 1, 103, 1, '2025-10-04 13:54:31', 1, '2025-10-04 14:03:16');
INSERT INTO `gen_table_column` VALUES (1974352410333376515, 1974352410014609409, 'tenant_id', '租户编号', 'varchar(20)', 'String', 'tenantId', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 2, 103, 1, '2025-10-04 13:54:31', 1, '2025-10-04 14:03:16');
INSERT INTO `gen_table_column` VALUES (1974352410333376516, 1974352410014609409, 'parent_id', '父级分类ID,根节点为0', 'bigint', 'Long', 'parentId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 103, 1, '2025-10-04 13:54:31', 1, '2025-10-04 14:03:16');
INSERT INTO `gen_table_column` VALUES (1974352410333376517, 1974352410014609409, 'category_name', '分类名称', 'varchar(100)', 'String', 'categoryName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 103, 1, '2025-10-04 13:54:31', 1, '2025-10-04 14:03:16');
INSERT INTO `gen_table_column` VALUES (1974352410333376518, 1974352410014609409, 'sort_order', '排序', 'int', 'Long', 'sortOrder', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 5, 103, 1, '2025-10-04 13:54:31', 1, '2025-10-04 14:03:16');
INSERT INTO `gen_table_column` VALUES (1974352410333376519, 1974352410014609409, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'edu_exam_category_status', 6, 103, 1, '2025-10-04 13:54:31', 1, '2025-10-04 14:03:16');
INSERT INTO `gen_table_column` VALUES (1974352410333376520, 1974352410014609409, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 7, 103, 1, '2025-10-04 13:54:31', 1, '2025-10-04 14:03:16');
INSERT INTO `gen_table_column` VALUES (1974352410333376521, 1974352410014609409, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 8, 103, 1, '2025-10-04 13:54:31', 1, '2025-10-04 14:03:16');
INSERT INTO `gen_table_column` VALUES (1974352410333376522, 1974352410014609409, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 103, 1, '2025-10-04 13:54:31', 1, '2025-10-04 14:03:16');
INSERT INTO `gen_table_column` VALUES (1974352410333376523, 1974352410014609409, 'create_by', '创建人', 'bigint', 'Long', 'createBy', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 10, 103, 1, '2025-10-04 13:54:31', 1, '2025-10-04 14:03:16');
INSERT INTO `gen_table_column` VALUES (1974352410333376524, 1974352410014609409, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 11, 103, 1, '2025-10-04 13:54:31', 1, '2025-10-04 14:03:16');
INSERT INTO `gen_table_column` VALUES (1974352410333376525, 1974352410014609409, 'update_by', '更新人', 'bigint', 'Long', 'updateBy', '0', '0', '0', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 12, 103, 1, '2025-10-04 13:54:31', 1, '2025-10-04 14:03:16');

-- ----------------------------
-- Table structure for sj_distributed_lock
-- ----------------------------
DROP TABLE IF EXISTS `sj_distributed_lock`;
CREATE TABLE `sj_distributed_lock`  (
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '锁名称',
  `lock_until` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '锁定时长',
  `locked_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '锁定时间',
  `locked_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '锁定者',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '锁定表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_distributed_lock
-- ----------------------------

-- ----------------------------
-- Table structure for sj_group_config
-- ----------------------------
DROP TABLE IF EXISTS `sj_group_config`;
CREATE TABLE `sj_group_config`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '组名称',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '组描述',
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'SJ_cKqBTPzCsWA3VyuCfFoccmuIEGXjr5KT' COMMENT 'token',
  `group_status` tinyint NOT NULL DEFAULT 0 COMMENT '组状态 0、未启用 1、启用',
  `version` int NOT NULL COMMENT '版本号',
  `group_partition` int NOT NULL COMMENT '分区',
  `id_generator_mode` tinyint NOT NULL DEFAULT 1 COMMENT '唯一id生成模式 默认号段模式',
  `init_scene` tinyint NOT NULL DEFAULT 0 COMMENT '是否初始化场景 0:否 1:是',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_namespace_id_group_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '组配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_group_config
-- ----------------------------
INSERT INTO `sj_group_config` VALUES (1, 'dev', 'ruoyi_group', '', 'SJ_cKqBTPzCsWA3VyuCfFoccmuIEGXjr5KT', 1, 1, 0, 1, 1, '2025-10-04 11:01:35', '2025-10-04 11:01:35');
INSERT INTO `sj_group_config` VALUES (2, 'prod', 'ruoyi_group', '', 'SJ_cKqBTPzCsWA3VyuCfFoccmuIEGXjr5KT', 1, 1, 0, 1, 1, '2025-10-04 11:01:35', '2025-10-04 11:01:35');

-- ----------------------------
-- Table structure for sj_job
-- ----------------------------
DROP TABLE IF EXISTS `sj_job`;
CREATE TABLE `sj_job`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `args_str` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '执行方法参数',
  `args_type` tinyint NOT NULL DEFAULT 1 COMMENT '参数类型 ',
  `next_trigger_at` bigint NOT NULL COMMENT '下次触发时间',
  `job_status` tinyint NOT NULL DEFAULT 1 COMMENT '任务状态 0、关闭、1、开启',
  `task_type` tinyint NOT NULL DEFAULT 1 COMMENT '任务类型 1、集群 2、广播 3、切片',
  `route_key` tinyint NOT NULL DEFAULT 4 COMMENT '路由策略',
  `executor_type` tinyint NOT NULL DEFAULT 1 COMMENT '执行器类型',
  `executor_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器名称',
  `trigger_type` tinyint NOT NULL COMMENT '触发类型 1.CRON 表达式 2. 固定时间',
  `trigger_interval` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '间隔时长',
  `block_strategy` tinyint NOT NULL DEFAULT 1 COMMENT '阻塞策略 1、丢弃 2、覆盖 3、并行 4、恢复',
  `executor_timeout` int NOT NULL DEFAULT 0 COMMENT '任务执行超时时间，单位秒',
  `max_retry_times` int NOT NULL DEFAULT 0 COMMENT '最大重试次数',
  `parallel_num` int NOT NULL DEFAULT 1 COMMENT '并行数',
  `retry_interval` int NOT NULL DEFAULT 0 COMMENT '重试间隔(s)',
  `bucket_index` int NOT NULL DEFAULT 0 COMMENT 'bucket',
  `resident` tinyint NOT NULL DEFAULT 0 COMMENT '是否是常驻任务',
  `notify_ids` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '通知告警场景配置id列表',
  `owner_id` bigint NULL DEFAULT NULL COMMENT '负责人id',
  `labels` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '标签',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '描述',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '扩展字段',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除 1、删除',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_namespace_id_group_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE,
  INDEX `idx_job_status_bucket_index`(`job_status` ASC, `bucket_index` ASC) USING BTREE,
  INDEX `idx_create_dt`(`create_dt` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_job
-- ----------------------------
INSERT INTO `sj_job` VALUES (1, 'dev', 'ruoyi_group', 'demo-job', NULL, 1, 1710344035622, 1, 1, 4, 1, 'testJobExecutor', 2, '60', 1, 60, 3, 1, 1, 116, 0, '', 1, '', '', '', 0, '2025-10-04 11:01:36', '2025-10-04 11:01:36');

-- ----------------------------
-- Table structure for sj_job_executor
-- ----------------------------
DROP TABLE IF EXISTS `sj_job_executor`;
CREATE TABLE `sj_job_executor`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `executor_info` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务执行器名称',
  `executor_type` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '1:java 2:python 3:go',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_namespace_id_group_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE,
  INDEX `idx_create_dt`(`create_dt` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务执行器信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_job_executor
-- ----------------------------

-- ----------------------------
-- Table structure for sj_job_log_message
-- ----------------------------
DROP TABLE IF EXISTS `sj_job_log_message`;
CREATE TABLE `sj_job_log_message`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `job_id` bigint NOT NULL COMMENT '任务信息id',
  `task_batch_id` bigint NOT NULL COMMENT '任务批次id',
  `task_id` bigint NOT NULL COMMENT '调度任务id',
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度信息',
  `log_num` int NOT NULL DEFAULT 1 COMMENT '日志数量',
  `real_time` bigint NOT NULL DEFAULT 0 COMMENT '上报时间',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '扩展字段',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_task_batch_id_task_id`(`task_batch_id` ASC, `task_id` ASC) USING BTREE,
  INDEX `idx_create_dt`(`create_dt` ASC) USING BTREE,
  INDEX `idx_namespace_id_group_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_job_log_message
-- ----------------------------

-- ----------------------------
-- Table structure for sj_job_summary
-- ----------------------------
DROP TABLE IF EXISTS `sj_job_summary`;
CREATE TABLE `sj_job_summary`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '组名称',
  `business_id` bigint NOT NULL COMMENT '业务id (job_id或workflow_id)',
  `system_task_type` tinyint NOT NULL DEFAULT 3 COMMENT '任务类型 3、JOB任务 4、WORKFLOW任务',
  `trigger_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '统计时间',
  `success_num` int NOT NULL DEFAULT 0 COMMENT '执行成功-日志数量',
  `fail_num` int NOT NULL DEFAULT 0 COMMENT '执行失败-日志数量',
  `fail_reason` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '失败原因',
  `stop_num` int NOT NULL DEFAULT 0 COMMENT '执行失败-日志数量',
  `stop_reason` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '失败原因',
  `cancel_num` int NOT NULL DEFAULT 0 COMMENT '执行失败-日志数量',
  `cancel_reason` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '失败原因',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_trigger_at_system_task_type_business_id`(`trigger_at` ASC, `system_task_type` ASC, `business_id` ASC) USING BTREE,
  INDEX `idx_namespace_id_group_name_business_id`(`namespace_id` ASC, `group_name` ASC, `business_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'DashBoard_Job' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_job_summary
-- ----------------------------

-- ----------------------------
-- Table structure for sj_job_task
-- ----------------------------
DROP TABLE IF EXISTS `sj_job_task`;
CREATE TABLE `sj_job_task`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `job_id` bigint NOT NULL COMMENT '任务信息id',
  `task_batch_id` bigint NOT NULL COMMENT '调度任务id',
  `parent_id` bigint NOT NULL DEFAULT 0 COMMENT '父执行器id',
  `task_status` tinyint NOT NULL DEFAULT 0 COMMENT '执行的状态 0、失败 1、成功',
  `retry_count` int NOT NULL DEFAULT 0 COMMENT '重试次数',
  `mr_stage` tinyint NULL DEFAULT NULL COMMENT '动态分片所处阶段 1:map 2:reduce 3:mergeReduce',
  `leaf` tinyint NOT NULL DEFAULT 1 COMMENT '叶子节点',
  `task_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `client_info` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户端地址 clientId#ip:port',
  `wf_context` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '工作流全局上下文',
  `result_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行结果',
  `args_str` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '执行方法参数',
  `args_type` tinyint NOT NULL DEFAULT 1 COMMENT '参数类型 ',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '扩展字段',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_task_batch_id_task_status`(`task_batch_id` ASC, `task_status` ASC) USING BTREE,
  INDEX `idx_create_dt`(`create_dt` ASC) USING BTREE,
  INDEX `idx_namespace_id_group_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务实例' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_job_task
-- ----------------------------

-- ----------------------------
-- Table structure for sj_job_task_batch
-- ----------------------------
DROP TABLE IF EXISTS `sj_job_task_batch`;
CREATE TABLE `sj_job_task_batch`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `job_id` bigint NOT NULL COMMENT '任务id',
  `workflow_node_id` bigint NOT NULL DEFAULT 0 COMMENT '工作流节点id',
  `parent_workflow_node_id` bigint NOT NULL DEFAULT 0 COMMENT '工作流任务父批次id',
  `workflow_task_batch_id` bigint NOT NULL DEFAULT 0 COMMENT '工作流任务批次id',
  `task_batch_status` tinyint NOT NULL DEFAULT 0 COMMENT '任务批次状态 0、失败 1、成功',
  `operation_reason` tinyint NOT NULL DEFAULT 0 COMMENT '操作原因',
  `execution_at` bigint NOT NULL DEFAULT 0 COMMENT '任务执行时间',
  `system_task_type` tinyint NOT NULL DEFAULT 3 COMMENT '任务类型 3、JOB任务 4、WORKFLOW任务',
  `parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '父节点',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '扩展字段',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除 1、删除',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_job_id_task_batch_status`(`job_id` ASC, `task_batch_status` ASC) USING BTREE,
  INDEX `idx_create_dt`(`create_dt` ASC) USING BTREE,
  INDEX `idx_namespace_id_group_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE,
  INDEX `idx_workflow_task_batch_id_workflow_node_id`(`workflow_task_batch_id` ASC, `workflow_node_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务批次' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_job_task_batch
-- ----------------------------

-- ----------------------------
-- Table structure for sj_namespace
-- ----------------------------
DROP TABLE IF EXISTS `sj_namespace`;
CREATE TABLE `sj_namespace`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `unique_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '唯一id',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '描述',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除 1、删除',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_unique_id`(`unique_id` ASC) USING BTREE,
  INDEX `idx_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '命名空间' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_namespace
-- ----------------------------
INSERT INTO `sj_namespace` VALUES (1, 'Development', 'dev', '', 0, '2025-10-04 11:01:35', '2025-10-04 11:01:35');
INSERT INTO `sj_namespace` VALUES (2, 'Production', 'prod', '', 0, '2025-10-04 11:01:35', '2025-10-04 11:01:35');

-- ----------------------------
-- Table structure for sj_notify_config
-- ----------------------------
DROP TABLE IF EXISTS `sj_notify_config`;
CREATE TABLE `sj_notify_config`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `notify_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '通知名称',
  `system_task_type` tinyint NOT NULL DEFAULT 3 COMMENT '任务类型 1. 重试任务 2. 重试回调 3、JOB任务 4、WORKFLOW任务',
  `notify_status` tinyint NOT NULL DEFAULT 0 COMMENT '通知状态 0、未启用 1、启用',
  `recipient_ids` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '接收人id列表',
  `notify_threshold` int NOT NULL DEFAULT 0 COMMENT '通知阈值',
  `notify_scene` tinyint NOT NULL DEFAULT 0 COMMENT '通知场景',
  `rate_limiter_status` tinyint NOT NULL DEFAULT 0 COMMENT '限流状态 0、未启用 1、启用',
  `rate_limiter_threshold` int NOT NULL DEFAULT 0 COMMENT '每秒限流阈值',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '描述',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_namespace_id_group_name_scene_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_notify_config
-- ----------------------------

-- ----------------------------
-- Table structure for sj_notify_recipient
-- ----------------------------
DROP TABLE IF EXISTS `sj_notify_recipient`;
CREATE TABLE `sj_notify_recipient`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `recipient_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '接收人名称',
  `notify_type` tinyint NOT NULL DEFAULT 0 COMMENT '通知类型 1、钉钉 2、邮件 3、企业微信 4 飞书 5 webhook',
  `notify_attribute` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '配置属性',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '描述',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_namespace_id`(`namespace_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '告警通知接收人' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_notify_recipient
-- ----------------------------

-- ----------------------------
-- Table structure for sj_retry
-- ----------------------------
DROP TABLE IF EXISTS `sj_retry`;
CREATE TABLE `sj_retry`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `group_id` bigint NOT NULL COMMENT '组Id',
  `scene_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '场景名称',
  `scene_id` bigint NOT NULL COMMENT '场景ID',
  `idempotent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '幂等id',
  `biz_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '业务编号',
  `executor_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '执行器名称',
  `args_str` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行方法参数',
  `ext_attrs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '扩展字段',
  `serializer_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'jackson' COMMENT '执行方法参数序列化器名称',
  `next_trigger_at` bigint NOT NULL COMMENT '下次触发时间',
  `retry_count` int NOT NULL DEFAULT 0 COMMENT '重试次数',
  `retry_status` tinyint NOT NULL DEFAULT 0 COMMENT '重试状态 0、重试中 1、成功 2、最大重试次数',
  `task_type` tinyint NOT NULL DEFAULT 1 COMMENT '任务类型 1、重试数据 2、回调数据',
  `bucket_index` int NOT NULL DEFAULT 0 COMMENT 'bucket',
  `parent_id` bigint NOT NULL DEFAULT 0 COMMENT '父节点id',
  `deleted` bigint NOT NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_scene_tasktype_idempotentid_deleted`(`scene_id` ASC, `task_type` ASC, `idempotent_id` ASC, `deleted` ASC) USING BTREE,
  INDEX `idx_biz_no`(`biz_no` ASC) USING BTREE,
  INDEX `idx_idempotent_id`(`idempotent_id` ASC) USING BTREE,
  INDEX `idx_retry_status_bucket_index`(`retry_status` ASC, `bucket_index` ASC) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE,
  INDEX `idx_create_dt`(`create_dt` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '重试信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_retry
-- ----------------------------

-- ----------------------------
-- Table structure for sj_retry_dead_letter
-- ----------------------------
DROP TABLE IF EXISTS `sj_retry_dead_letter`;
CREATE TABLE `sj_retry_dead_letter`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `group_id` bigint NOT NULL COMMENT '组Id',
  `scene_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '场景名称',
  `scene_id` bigint NOT NULL COMMENT '场景ID',
  `idempotent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '幂等id',
  `biz_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '业务编号',
  `executor_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '执行器名称',
  `serializer_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'jackson' COMMENT '执行方法参数序列化器名称',
  `args_str` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行方法参数',
  `ext_attrs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '扩展字段',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_namespace_id_group_name_scene_name`(`namespace_id` ASC, `group_name` ASC, `scene_name` ASC) USING BTREE,
  INDEX `idx_idempotent_id`(`idempotent_id` ASC) USING BTREE,
  INDEX `idx_biz_no`(`biz_no` ASC) USING BTREE,
  INDEX `idx_create_dt`(`create_dt` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '死信队列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_retry_dead_letter
-- ----------------------------

-- ----------------------------
-- Table structure for sj_retry_scene_config
-- ----------------------------
DROP TABLE IF EXISTS `sj_retry_scene_config`;
CREATE TABLE `sj_retry_scene_config`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `scene_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '场景名称',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `scene_status` tinyint NOT NULL DEFAULT 0 COMMENT '组状态 0、未启用 1、启用',
  `max_retry_count` int NOT NULL DEFAULT 5 COMMENT '最大重试次数',
  `back_off` tinyint NOT NULL DEFAULT 1 COMMENT '1、默认等级 2、固定间隔时间 3、CRON 表达式',
  `trigger_interval` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '间隔时长',
  `notify_ids` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '通知告警场景配置id列表',
  `deadline_request` bigint UNSIGNED NOT NULL DEFAULT 60000 COMMENT 'Deadline Request 调用链超时 单位毫秒',
  `executor_timeout` int UNSIGNED NOT NULL DEFAULT 5 COMMENT '任务执行超时时间，单位秒',
  `route_key` tinyint NOT NULL DEFAULT 4 COMMENT '路由策略',
  `block_strategy` tinyint NOT NULL DEFAULT 1 COMMENT '阻塞策略 1、丢弃 2、覆盖 3、并行',
  `cb_status` tinyint NOT NULL DEFAULT 0 COMMENT '回调状态 0、不开启 1、开启',
  `cb_trigger_type` tinyint NOT NULL DEFAULT 1 COMMENT '1、默认等级 2、固定间隔时间 3、CRON 表达式',
  `cb_max_count` int NOT NULL DEFAULT 16 COMMENT '回调的最大执行次数',
  `cb_trigger_interval` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '回调的最大执行次数',
  `owner_id` bigint NULL DEFAULT NULL COMMENT '负责人id',
  `labels` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '标签',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '描述',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_namespace_id_group_name_scene_name`(`namespace_id` ASC, `group_name` ASC, `scene_name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '场景配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_retry_scene_config
-- ----------------------------

-- ----------------------------
-- Table structure for sj_retry_summary
-- ----------------------------
DROP TABLE IF EXISTS `sj_retry_summary`;
CREATE TABLE `sj_retry_summary`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '组名称',
  `scene_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '场景名称',
  `trigger_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '统计时间',
  `running_num` int NOT NULL DEFAULT 0 COMMENT '重试中-日志数量',
  `finish_num` int NOT NULL DEFAULT 0 COMMENT '重试完成-日志数量',
  `max_count_num` int NOT NULL DEFAULT 0 COMMENT '重试到达最大次数-日志数量',
  `suspend_num` int NOT NULL DEFAULT 0 COMMENT '暂停重试-日志数量',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_scene_name_trigger_at`(`namespace_id` ASC, `group_name` ASC, `scene_name` ASC, `trigger_at` ASC) USING BTREE,
  INDEX `idx_trigger_at`(`trigger_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'DashBoard_Retry' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_retry_summary
-- ----------------------------

-- ----------------------------
-- Table structure for sj_retry_task
-- ----------------------------
DROP TABLE IF EXISTS `sj_retry_task`;
CREATE TABLE `sj_retry_task`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `scene_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '场景名称',
  `retry_id` bigint NOT NULL COMMENT '重试信息Id',
  `ext_attrs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '扩展字段',
  `task_status` tinyint NOT NULL DEFAULT 1 COMMENT '重试状态',
  `task_type` tinyint NOT NULL DEFAULT 1 COMMENT '任务类型 1、重试数据 2、回调数据',
  `operation_reason` tinyint NOT NULL DEFAULT 0 COMMENT '操作原因',
  `client_info` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户端地址 clientId#ip:port',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_group_name_scene_name`(`namespace_id` ASC, `group_name` ASC, `scene_name` ASC) USING BTREE,
  INDEX `task_status`(`task_status` ASC) USING BTREE,
  INDEX `idx_create_dt`(`create_dt` ASC) USING BTREE,
  INDEX `idx_retry_id`(`retry_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '重试任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_retry_task
-- ----------------------------

-- ----------------------------
-- Table structure for sj_retry_task_log_message
-- ----------------------------
DROP TABLE IF EXISTS `sj_retry_task_log_message`;
CREATE TABLE `sj_retry_task_log_message`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `retry_id` bigint NOT NULL COMMENT '重试信息Id',
  `retry_task_id` bigint NOT NULL COMMENT '重试任务Id',
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '异常信息',
  `log_num` int NOT NULL DEFAULT 1 COMMENT '日志数量',
  `real_time` bigint NOT NULL DEFAULT 0 COMMENT '上报时间',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_namespace_id_group_name_retry_task_id`(`namespace_id` ASC, `group_name` ASC, `retry_task_id` ASC) USING BTREE,
  INDEX `idx_create_dt`(`create_dt` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务调度日志信息记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_retry_task_log_message
-- ----------------------------

-- ----------------------------
-- Table structure for sj_server_node
-- ----------------------------
DROP TABLE IF EXISTS `sj_server_node`;
CREATE TABLE `sj_server_node`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `host_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主机id',
  `host_ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '机器ip',
  `host_port` int NOT NULL COMMENT '机器端口',
  `expire_at` datetime NOT NULL COMMENT '过期时间',
  `node_type` tinyint NOT NULL COMMENT '节点类型 1、客户端 2、是服务端',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '扩展字段',
  `labels` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '标签',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_host_id_host_ip`(`host_id` ASC, `host_ip` ASC) USING BTREE,
  INDEX `idx_namespace_id_group_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE,
  INDEX `idx_expire_at_node_type`(`expire_at` ASC, `node_type` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '服务器节点' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_server_node
-- ----------------------------

-- ----------------------------
-- Table structure for sj_system_user
-- ----------------------------
DROP TABLE IF EXISTS `sj_system_user`;
CREATE TABLE `sj_system_user`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `role` tinyint NOT NULL DEFAULT 0 COMMENT '角色：1-普通用户、2-管理员',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_system_user
-- ----------------------------
INSERT INTO `sj_system_user` VALUES (1, 'admin', '465c194afb65670f38322df087f0a9bb225cc257e43eb4ac5a0c98ef5b3173ac', 2, '2025-10-04 11:01:36', '2025-10-04 11:01:36');

-- ----------------------------
-- Table structure for sj_system_user_permission
-- ----------------------------
DROP TABLE IF EXISTS `sj_system_user_permission`;
CREATE TABLE `sj_system_user_permission`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `system_user_id` bigint NOT NULL COMMENT '系统用户id',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_namespace_id_group_name_system_user_id`(`namespace_id` ASC, `group_name` ASC, `system_user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统用户权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_system_user_permission
-- ----------------------------

-- ----------------------------
-- Table structure for sj_workflow
-- ----------------------------
DROP TABLE IF EXISTS `sj_workflow`;
CREATE TABLE `sj_workflow`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `workflow_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工作流名称',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `workflow_status` tinyint NOT NULL DEFAULT 1 COMMENT '工作流状态 0、关闭、1、开启',
  `trigger_type` tinyint NOT NULL COMMENT '触发类型 1.CRON 表达式 2. 固定时间',
  `trigger_interval` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '间隔时长',
  `next_trigger_at` bigint NOT NULL COMMENT '下次触发时间',
  `block_strategy` tinyint NOT NULL DEFAULT 1 COMMENT '阻塞策略 1、丢弃 2、覆盖 3、并行',
  `executor_timeout` int NOT NULL DEFAULT 0 COMMENT '任务执行超时时间，单位秒',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '描述',
  `flow_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '流程信息',
  `wf_context` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '上下文',
  `notify_ids` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '通知告警场景配置id列表',
  `bucket_index` int NOT NULL DEFAULT 0 COMMENT 'bucket',
  `version` int NOT NULL COMMENT '版本号',
  `owner_id` bigint NULL DEFAULT NULL COMMENT '负责人id',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '扩展字段',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除 1、删除',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create_dt`(`create_dt` ASC) USING BTREE,
  INDEX `idx_namespace_id_group_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '工作流' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_workflow
-- ----------------------------

-- ----------------------------
-- Table structure for sj_workflow_node
-- ----------------------------
DROP TABLE IF EXISTS `sj_workflow_node`;
CREATE TABLE `sj_workflow_node`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `node_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '节点名称',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `job_id` bigint NOT NULL COMMENT '任务信息id',
  `workflow_id` bigint NOT NULL COMMENT '工作流ID',
  `node_type` tinyint NOT NULL DEFAULT 1 COMMENT '1、任务节点 2、条件节点',
  `expression_type` tinyint NOT NULL DEFAULT 0 COMMENT '1、SpEl、2、Aviator 3、QL',
  `fail_strategy` tinyint NOT NULL DEFAULT 1 COMMENT '失败策略 1、跳过 2、阻塞',
  `workflow_node_status` tinyint NOT NULL DEFAULT 1 COMMENT '工作流节点状态 0、关闭、1、开启',
  `priority_level` int NOT NULL DEFAULT 1 COMMENT '优先级',
  `node_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '节点信息 ',
  `version` int NOT NULL COMMENT '版本号',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '扩展字段',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除 1、删除',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create_dt`(`create_dt` ASC) USING BTREE,
  INDEX `idx_namespace_id_group_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '工作流节点' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_workflow_node
-- ----------------------------

-- ----------------------------
-- Table structure for sj_workflow_task_batch
-- ----------------------------
DROP TABLE IF EXISTS `sj_workflow_task_batch`;
CREATE TABLE `sj_workflow_task_batch`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `workflow_id` bigint NOT NULL COMMENT '工作流任务id',
  `task_batch_status` tinyint NOT NULL DEFAULT 0 COMMENT '任务批次状态 0、失败 1、成功',
  `operation_reason` tinyint NOT NULL DEFAULT 0 COMMENT '操作原因',
  `flow_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '流程信息',
  `wf_context` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '全局上下文',
  `execution_at` bigint NOT NULL DEFAULT 0 COMMENT '任务执行时间',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '扩展字段',
  `version` int NOT NULL DEFAULT 1 COMMENT '版本号',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除 1、删除',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_job_id_task_batch_status`(`workflow_id` ASC, `task_batch_status` ASC) USING BTREE,
  INDEX `idx_create_dt`(`create_dt` ASC) USING BTREE,
  INDEX `idx_namespace_id_group_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '工作流批次' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_workflow_task_batch
-- ----------------------------

-- ----------------------------
-- Table structure for sys_client
-- ----------------------------
DROP TABLE IF EXISTS `sys_client`;
CREATE TABLE `sys_client`  (
  `id` bigint NOT NULL COMMENT 'id',
  `client_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户端id',
  `client_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户端key',
  `client_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户端秘钥',
  `grant_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授权类型',
  `device_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备类型',
  `active_timeout` int NULL DEFAULT 1800 COMMENT 'token活跃超时时间',
  `timeout` int NULL DEFAULT 604800 COMMENT 'token固定超时',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统授权表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_client
-- ----------------------------
INSERT INTO `sys_client` VALUES (1, 'e5cd7e4891bf95d1d19206ce24a7b32e', 'pc', 'pc123', 'password,social', 'pc', 180000, 604800, '0', '0', 103, 1, '2025-09-28 14:31:57', 1, '2025-10-04 13:44:12');
INSERT INTO `sys_client` VALUES (2, '428a8310cd442757ae699df5d894f051', 'app', 'app123', 'password,sms,social', 'android', 180000, 604800, '0', '0', 103, 1, '2025-09-28 14:31:57', 1, '2025-10-04 13:44:09');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` bigint NOT NULL COMMENT '参数主键',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '000000', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '000000', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '000000', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (5, '000000', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (11, '000000', 'OSS预览列表资源开关', 'sys.oss.previewListResource', 'true', 'Y', 103, 1, '2025-09-28 14:31:56', NULL, NULL, 'true:开启, false:关闭');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL COMMENT '部门id',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `dept_category` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门类别编码',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` bigint NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, '000000', 0, '0', '在线考试系统', NULL, 0, NULL, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2025-09-26 10:34:42', 1, '2025-10-04 11:02:38');
INSERT INTO `sys_dept` VALUES (101, '000000', 100, '0,100', '管理', NULL, 1, NULL, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2025-09-28 14:31:55', 1, '2025-10-04 11:12:54');
INSERT INTO `sys_dept` VALUES (103, '000000', 101, '0,100,101', '研发部门', NULL, 1, 1, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2025-09-28 14:31:55', NULL, NULL);
INSERT INTO `sys_dept` VALUES (1974312060503945217, '000000', 100, '0,100', '教职工', NULL, 0, NULL, NULL, NULL, '0', '1', 103, 1, '2025-10-04 11:14:11', 1, '2025-10-04 11:19:51');
INSERT INTO `sys_dept` VALUES (1974312139650461697, '000000', 100, '0,100', '学生', NULL, 0, NULL, NULL, NULL, '0', '0', 103, 1, '2025-10-04 11:14:30', 1, '2025-10-04 11:14:30');
INSERT INTO `sys_dept` VALUES (1974312557780627457, '000000', 1974312139650461697, '0,100,1974312139650461697', '20级', NULL, 0, NULL, NULL, NULL, '0', '0', 103, 1, '2025-10-04 11:16:09', 1, '2025-10-04 14:08:51');
INSERT INTO `sys_dept` VALUES (1974312589770584066, '000000', 1974312139650461697, '0,100,1974312139650461697', '21级', NULL, 0, NULL, NULL, NULL, '0', '0', 103, 1, '2025-10-04 11:16:17', 1, '2025-10-04 11:16:17');
INSERT INTO `sys_dept` VALUES (1974312656841699330, '000000', 1974312589770584066, '0,100,1974312139650461697,1974312589770584066', '21级一班', NULL, 0, NULL, NULL, NULL, '0', '0', 103, 1, '2025-10-04 11:16:33', 1, '2025-10-04 11:16:33');
INSERT INTO `sys_dept` VALUES (1974312677473480706, '000000', 1974312589770584066, '0,100,1974312139650461697,1974312589770584066', '21级二班', NULL, 0, NULL, NULL, NULL, '0', '0', 103, 1, '2025-10-04 11:16:38', 1, '2025-10-04 11:16:38');
INSERT INTO `sys_dept` VALUES (1974312697312538625, '000000', 1974312589770584066, '0,100,1974312139650461697,1974312589770584066', '21级三班', NULL, 0, NULL, NULL, NULL, '0', '0', 103, 1, '2025-10-04 11:16:43', 1, '2025-10-04 11:16:43');
INSERT INTO `sys_dept` VALUES (1974312721278791682, '000000', 1974312557780627457, '0,100,1974312139650461697,1974312557780627457', '20级一班', NULL, 0, NULL, NULL, NULL, '0', '0', 103, 1, '2025-10-04 11:16:48', 1, '2025-10-04 14:08:56');
INSERT INTO `sys_dept` VALUES (1974312750253043714, '000000', 1974312557780627457, '0,100,1974312139650461697,1974312557780627457', '20级二班', NULL, 0, NULL, NULL, NULL, '0', '0', 103, 1, '2025-10-04 11:16:55', 1, '2025-10-04 14:09:00');
INSERT INTO `sys_dept` VALUES (1974312817101860866, '000000', 1974312060503945217, '0,100,1974312060503945217', '语文', NULL, 0, NULL, NULL, NULL, '0', '1', 103, 1, '2025-10-04 11:17:11', 1, '2025-10-04 11:19:44');
INSERT INTO `sys_dept` VALUES (1974312844259979266, '000000', 1974312060503945217, '0,100,1974312060503945217', '数学', NULL, 0, NULL, NULL, NULL, '0', '1', 103, 1, '2025-10-04 11:17:18', 1, '2025-10-04 11:19:46');
INSERT INTO `sys_dept` VALUES (1974312866741448706, '000000', 1974312060503945217, '0,100,1974312060503945217', '英语', NULL, 0, NULL, NULL, NULL, '0', '1', 103, 1, '2025-10-04 11:17:23', 1, '2025-10-04 11:19:48');
INSERT INTO `sys_dept` VALUES (1974313609552687105, '000000', 1974312589770584066, '0,100,1974312139650461697,1974312589770584066', '21级教职工', NULL, 0, NULL, NULL, NULL, '0', '1', 103, 1, '2025-10-04 11:20:20', 1, '2025-10-04 11:27:20');
INSERT INTO `sys_dept` VALUES (1974313631371456513, '000000', 1974312557780627457, '0,100,1974312139650461697,1974312557780627457', '22级教职工', NULL, 0, NULL, NULL, NULL, '0', '1', 103, 1, '2025-10-04 11:20:25', 1, '2025-10-04 11:27:22');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL COMMENT '字典编码',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, '000000', 1, '男', '0', 'sys_user_sex', '', '', 'Y', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, '000000', 2, '女', '1', 'sys_user_sex', '', '', 'N', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, '000000', 3, '未知', '2', 'sys_user_sex', '', '', 'N', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, '000000', 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, '000000', 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, '000000', 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, '000000', 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (12, '000000', 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, '000000', 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, '000000', 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, '000000', 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, '000000', 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, '000000', 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, '000000', 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, '000000', 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, '000000', 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, '000000', 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, '000000', 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, '000000', 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, '000000', 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, '000000', 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, '000000', 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, '000000', 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, '000000', 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (29, '000000', 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (30, '000000', 0, '密码认证', 'password', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '密码认证');
INSERT INTO `sys_dict_data` VALUES (31, '000000', 0, '短信认证', 'sms', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '短信认证');
INSERT INTO `sys_dict_data` VALUES (32, '000000', 0, '邮件认证', 'email', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '邮件认证');
INSERT INTO `sys_dict_data` VALUES (33, '000000', 0, '小程序认证', 'xcx', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '小程序认证');
INSERT INTO `sys_dict_data` VALUES (34, '000000', 0, '三方登录认证', 'social', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '三方登录认证');
INSERT INTO `sys_dict_data` VALUES (35, '000000', 0, 'PC', 'pc', 'sys_device_type', '', 'default', 'N', 103, 1, '2025-09-28 14:31:56', NULL, NULL, 'PC');
INSERT INTO `sys_dict_data` VALUES (36, '000000', 0, '安卓', 'android', 'sys_device_type', '', 'default', 'N', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '安卓');
INSERT INTO `sys_dict_data` VALUES (37, '000000', 0, 'iOS', 'ios', 'sys_device_type', '', 'default', 'N', 103, 1, '2025-09-28 14:31:56', NULL, NULL, 'iOS');
INSERT INTO `sys_dict_data` VALUES (38, '000000', 0, '小程序', 'xcx', 'sys_device_type', '', 'default', 'N', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '小程序');
INSERT INTO `sys_dict_data` VALUES (39, '000000', 1, '已撤销', 'cancel', 'wf_business_status', '', 'danger', 'N', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '已撤销');
INSERT INTO `sys_dict_data` VALUES (40, '000000', 2, '草稿', 'draft', 'wf_business_status', '', 'info', 'N', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '草稿');
INSERT INTO `sys_dict_data` VALUES (41, '000000', 3, '待审核', 'waiting', 'wf_business_status', '', 'primary', 'N', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '待审核');
INSERT INTO `sys_dict_data` VALUES (42, '000000', 4, '已完成', 'finish', 'wf_business_status', '', 'success', 'N', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '已完成');
INSERT INTO `sys_dict_data` VALUES (43, '000000', 5, '已作废', 'invalid', 'wf_business_status', '', 'danger', 'N', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '已作废');
INSERT INTO `sys_dict_data` VALUES (44, '000000', 6, '已退回', 'back', 'wf_business_status', '', 'danger', 'N', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '已退回');
INSERT INTO `sys_dict_data` VALUES (45, '000000', 7, '已终止', 'termination', 'wf_business_status', '', 'danger', 'N', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '已终止');
INSERT INTO `sys_dict_data` VALUES (46, '000000', 1, '自定义表单', 'static', 'wf_form_type', '', 'success', 'N', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '自定义表单');
INSERT INTO `sys_dict_data` VALUES (47, '000000', 2, '动态表单', 'dynamic', 'wf_form_type', '', 'primary', 'N', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '动态表单');
INSERT INTO `sys_dict_data` VALUES (48, '000000', 1, '撤销', 'cancel', 'wf_task_status', '', 'danger', 'N', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '撤销');
INSERT INTO `sys_dict_data` VALUES (49, '000000', 2, '通过', 'pass', 'wf_task_status', '', 'success', 'N', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '通过');
INSERT INTO `sys_dict_data` VALUES (50, '000000', 3, '待审核', 'waiting', 'wf_task_status', '', 'primary', 'N', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '待审核');
INSERT INTO `sys_dict_data` VALUES (51, '000000', 4, '作废', 'invalid', 'wf_task_status', '', 'danger', 'N', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '作废');
INSERT INTO `sys_dict_data` VALUES (52, '000000', 5, '退回', 'back', 'wf_task_status', '', 'danger', 'N', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '退回');
INSERT INTO `sys_dict_data` VALUES (53, '000000', 6, '终止', 'termination', 'wf_task_status', '', 'danger', 'N', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '终止');
INSERT INTO `sys_dict_data` VALUES (54, '000000', 7, '转办', 'transfer', 'wf_task_status', '', 'primary', 'N', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '转办');
INSERT INTO `sys_dict_data` VALUES (55, '000000', 8, '委托', 'depute', 'wf_task_status', '', 'primary', 'N', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '委托');
INSERT INTO `sys_dict_data` VALUES (56, '000000', 9, '抄送', 'copy', 'wf_task_status', '', 'primary', 'N', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '抄送');
INSERT INTO `sys_dict_data` VALUES (57, '000000', 10, '加签', 'sign', 'wf_task_status', '', 'primary', 'N', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '加签');
INSERT INTO `sys_dict_data` VALUES (58, '000000', 11, '减签', 'sign_off', 'wf_task_status', '', 'danger', 'N', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '减签');
INSERT INTO `sys_dict_data` VALUES (59, '000000', 11, '超时', 'timeout', 'wf_task_status', '', 'danger', 'N', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '超时');
INSERT INTO `sys_dict_data` VALUES (1972192658102882305, '000000', 0, '正常', '0', 'edu_question_bank_status', '', 'primary', 'N', 103, 1, '2025-09-28 14:52:26', 1, '2025-09-28 14:52:26', '');
INSERT INTO `sys_dict_data` VALUES (1972192688096350209, '000000', 1, '停用', '1', 'edu_question_bank_status', '', 'primary', 'N', 103, 1, '2025-09-28 14:52:33', 1, '2025-09-28 14:52:33', '');
INSERT INTO `sys_dict_data` VALUES (1972192731637420034, '000000', 0, '正常', '0', 'edu_question_bank_category_status', '', 'primary', 'N', 103, 1, '2025-09-28 14:52:43', 1, '2025-09-28 14:52:43', '');
INSERT INTO `sys_dict_data` VALUES (1972192753439412225, '000000', 1, '停用', '1', 'edu_question_bank_category_status', '', 'primary', 'N', 103, 1, '2025-09-28 14:52:49', 1, '2025-09-28 14:52:49', '');
INSERT INTO `sys_dict_data` VALUES (1973927240565207042, '000000', 0, '开启', '0', 'edu_question_status', '', 'primary', 'N', 103, 1, '2025-10-03 09:45:03', 1, '2025-10-03 09:45:03', '');
INSERT INTO `sys_dict_data` VALUES (1973927266792189954, '000000', 1, '停用', '1', 'edu_question_status', '', 'primary', 'N', 103, 1, '2025-10-03 09:45:09', 1, '2025-10-03 09:45:09', '');
INSERT INTO `sys_dict_data` VALUES (1973934023497146370, '000000', 1, '单选题', '1', 'edu_question_type', '', 'primary', 'N', 103, 1, '2025-10-03 10:12:00', 1, '2025-10-03 10:12:00', '');
INSERT INTO `sys_dict_data` VALUES (1973934060771926017, '000000', 2, '多选题', '2', 'edu_question_type', '', 'primary', 'N', 103, 1, '2025-10-03 10:12:09', 1, '2025-10-03 10:12:09', '');
INSERT INTO `sys_dict_data` VALUES (1973934083681214465, '000000', 3, '判断题', '3', 'edu_question_type', '', 'primary', 'N', 103, 1, '2025-10-03 10:12:14', 1, '2025-10-03 10:12:14', '');
INSERT INTO `sys_dict_data` VALUES (1974308937945280530, '533080', 1, '男', '0', 'sys_user_sex', '', '', 'Y', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '性别男');
INSERT INTO `sys_dict_data` VALUES (1974308937945280531, '533080', 2, '女', '1', 'sys_user_sex', '', '', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '性别女');
INSERT INTO `sys_dict_data` VALUES (1974308937945280532, '533080', 3, '未知', '2', 'sys_user_sex', '', '', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '性别未知');
INSERT INTO `sys_dict_data` VALUES (1974308937945280533, '533080', 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (1974308937945280534, '533080', 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (1974308937945280535, '533080', 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '正常状态');
INSERT INTO `sys_dict_data` VALUES (1974308937945280536, '533080', 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '停用状态');
INSERT INTO `sys_dict_data` VALUES (1974308937945280537, '533080', 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (1974308937945280538, '533080', 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (1974308937945280539, '533080', 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '通知');
INSERT INTO `sys_dict_data` VALUES (1974308938012389377, '533080', 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '公告');
INSERT INTO `sys_dict_data` VALUES (1974308938012389378, '533080', 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '正常状态');
INSERT INTO `sys_dict_data` VALUES (1974308938012389379, '533080', 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (1974308938012389380, '533080', 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '新增操作');
INSERT INTO `sys_dict_data` VALUES (1974308938012389381, '533080', 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '修改操作');
INSERT INTO `sys_dict_data` VALUES (1974308938012389382, '533080', 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '删除操作');
INSERT INTO `sys_dict_data` VALUES (1974308938012389383, '533080', 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '授权操作');
INSERT INTO `sys_dict_data` VALUES (1974308938012389384, '533080', 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '导出操作');
INSERT INTO `sys_dict_data` VALUES (1974308938012389385, '533080', 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '导入操作');
INSERT INTO `sys_dict_data` VALUES (1974308938012389386, '533080', 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '强退操作');
INSERT INTO `sys_dict_data` VALUES (1974308938012389387, '533080', 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '生成操作');
INSERT INTO `sys_dict_data` VALUES (1974308938012389388, '533080', 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '清空操作');
INSERT INTO `sys_dict_data` VALUES (1974308938012389389, '533080', 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '正常状态');
INSERT INTO `sys_dict_data` VALUES (1974308938012389390, '533080', 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '停用状态');
INSERT INTO `sys_dict_data` VALUES (1974308938012389391, '533080', 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '其他操作');
INSERT INTO `sys_dict_data` VALUES (1974308938012389392, '533080', 0, '密码认证', 'password', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '密码认证');
INSERT INTO `sys_dict_data` VALUES (1974308938012389393, '533080', 0, '短信认证', 'sms', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '短信认证');
INSERT INTO `sys_dict_data` VALUES (1974308938012389394, '533080', 0, '邮件认证', 'email', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '邮件认证');
INSERT INTO `sys_dict_data` VALUES (1974308938012389395, '533080', 0, '小程序认证', 'xcx', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '小程序认证');
INSERT INTO `sys_dict_data` VALUES (1974308938012389396, '533080', 0, '三方登录认证', 'social', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '三方登录认证');
INSERT INTO `sys_dict_data` VALUES (1974308938012389397, '533080', 0, 'PC', 'pc', 'sys_device_type', '', 'default', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', 'PC');
INSERT INTO `sys_dict_data` VALUES (1974308938012389398, '533080', 0, '安卓', 'android', 'sys_device_type', '', 'default', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '安卓');
INSERT INTO `sys_dict_data` VALUES (1974308938012389399, '533080', 0, 'iOS', 'ios', 'sys_device_type', '', 'default', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', 'iOS');
INSERT INTO `sys_dict_data` VALUES (1974308938012389400, '533080', 0, '小程序', 'xcx', 'sys_device_type', '', 'default', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '小程序');
INSERT INTO `sys_dict_data` VALUES (1974308938012389401, '533080', 1, '已撤销', 'cancel', 'wf_business_status', '', 'danger', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '已撤销');
INSERT INTO `sys_dict_data` VALUES (1974308938012389402, '533080', 2, '草稿', 'draft', 'wf_business_status', '', 'info', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '草稿');
INSERT INTO `sys_dict_data` VALUES (1974308938012389403, '533080', 3, '待审核', 'waiting', 'wf_business_status', '', 'primary', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '待审核');
INSERT INTO `sys_dict_data` VALUES (1974308938012389404, '533080', 4, '已完成', 'finish', 'wf_business_status', '', 'success', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '已完成');
INSERT INTO `sys_dict_data` VALUES (1974308938012389405, '533080', 5, '已作废', 'invalid', 'wf_business_status', '', 'danger', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '已作废');
INSERT INTO `sys_dict_data` VALUES (1974308938012389406, '533080', 6, '已退回', 'back', 'wf_business_status', '', 'danger', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '已退回');
INSERT INTO `sys_dict_data` VALUES (1974308938012389407, '533080', 7, '已终止', 'termination', 'wf_business_status', '', 'danger', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '已终止');
INSERT INTO `sys_dict_data` VALUES (1974308938012389408, '533080', 1, '自定义表单', 'static', 'wf_form_type', '', 'success', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '自定义表单');
INSERT INTO `sys_dict_data` VALUES (1974308938012389409, '533080', 2, '动态表单', 'dynamic', 'wf_form_type', '', 'primary', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '动态表单');
INSERT INTO `sys_dict_data` VALUES (1974308938012389410, '533080', 1, '撤销', 'cancel', 'wf_task_status', '', 'danger', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '撤销');
INSERT INTO `sys_dict_data` VALUES (1974308938012389411, '533080', 2, '通过', 'pass', 'wf_task_status', '', 'success', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '通过');
INSERT INTO `sys_dict_data` VALUES (1974308938012389412, '533080', 3, '待审核', 'waiting', 'wf_task_status', '', 'primary', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '待审核');
INSERT INTO `sys_dict_data` VALUES (1974308938012389413, '533080', 4, '作废', 'invalid', 'wf_task_status', '', 'danger', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '作废');
INSERT INTO `sys_dict_data` VALUES (1974308938012389414, '533080', 5, '退回', 'back', 'wf_task_status', '', 'danger', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '退回');
INSERT INTO `sys_dict_data` VALUES (1974308938012389415, '533080', 6, '终止', 'termination', 'wf_task_status', '', 'danger', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '终止');
INSERT INTO `sys_dict_data` VALUES (1974308938012389416, '533080', 7, '转办', 'transfer', 'wf_task_status', '', 'primary', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '转办');
INSERT INTO `sys_dict_data` VALUES (1974308938012389417, '533080', 8, '委托', 'depute', 'wf_task_status', '', 'primary', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '委托');
INSERT INTO `sys_dict_data` VALUES (1974308938012389418, '533080', 9, '抄送', 'copy', 'wf_task_status', '', 'primary', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '抄送');
INSERT INTO `sys_dict_data` VALUES (1974308938012389419, '533080', 10, '加签', 'sign', 'wf_task_status', '', 'primary', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '加签');
INSERT INTO `sys_dict_data` VALUES (1974308938012389420, '533080', 11, '减签', 'sign_off', 'wf_task_status', '', 'danger', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '减签');
INSERT INTO `sys_dict_data` VALUES (1974308938012389421, '533080', 11, '超时', 'timeout', 'wf_task_status', '', 'danger', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '超时');
INSERT INTO `sys_dict_data` VALUES (1974308938012389422, '533080', 0, '正常', '0', 'edu_question_bank_status', '', 'primary', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '');
INSERT INTO `sys_dict_data` VALUES (1974308938012389423, '533080', 1, '停用', '1', 'edu_question_bank_status', '', 'primary', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '');
INSERT INTO `sys_dict_data` VALUES (1974308938012389424, '533080', 0, '正常', '0', 'edu_question_bank_category_status', '', 'primary', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '');
INSERT INTO `sys_dict_data` VALUES (1974308938012389425, '533080', 1, '停用', '1', 'edu_question_bank_category_status', '', 'primary', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '');
INSERT INTO `sys_dict_data` VALUES (1974308938012389426, '533080', 0, '开启', '0', 'edu_question_status', '', 'primary', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '');
INSERT INTO `sys_dict_data` VALUES (1974308938012389427, '533080', 1, '停用', '1', 'edu_question_status', '', 'primary', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '');
INSERT INTO `sys_dict_data` VALUES (1974308938012389428, '533080', 1, '单选题', '1', 'edu_question_type', '', 'primary', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '');
INSERT INTO `sys_dict_data` VALUES (1974308938012389429, '533080', 2, '多选题', '2', 'edu_question_type', '', 'primary', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '');
INSERT INTO `sys_dict_data` VALUES (1974308938012389430, '533080', 3, '判断题', '3', 'edu_question_type', '', 'primary', 'N', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '');
INSERT INTO `sys_dict_data` VALUES (1974352938891177985, '000000', 0, '正常', '0', 'edu_exam_category_status', '', 'primary', 'N', 103, 1, '2025-10-04 13:56:37', 1, '2025-10-04 13:56:37', '');
INSERT INTO `sys_dict_data` VALUES (1974352958881230850, '000000', 1, '停用', '1', 'edu_exam_category_status', '', 'primary', 'N', 103, 1, '2025-10-04 13:56:42', 1, '2025-10-04 13:56:42', '');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL COMMENT '字典主键',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `tenant_id`(`tenant_id` ASC, `dict_type` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '000000', '用户性别', 'sys_user_sex', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '000000', '菜单状态', 'sys_show_hide', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '000000', '系统开关', 'sys_normal_disable', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (6, '000000', '系统是否', 'sys_yes_no', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '000000', '通知类型', 'sys_notice_type', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '000000', '通知状态', 'sys_notice_status', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '000000', '操作类型', 'sys_oper_type', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '000000', '系统状态', 'sys_common_status', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '000000', '授权类型', 'sys_grant_type', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '认证授权类型');
INSERT INTO `sys_dict_type` VALUES (12, '000000', '设备类型', 'sys_device_type', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '客户端设备类型');
INSERT INTO `sys_dict_type` VALUES (13, '000000', '业务状态', 'wf_business_status', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '业务状态列表');
INSERT INTO `sys_dict_type` VALUES (14, '000000', '表单类型', 'wf_form_type', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '表单类型列表');
INSERT INTO `sys_dict_type` VALUES (15, '000000', '任务状态', 'wf_task_status', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '任务状态');
INSERT INTO `sys_dict_type` VALUES (1972192537768300546, '000000', '题库分类状态', 'edu_question_bank_category_status', 103, 1, '2025-09-28 14:51:57', 1, '2025-09-28 14:51:57', '');
INSERT INTO `sys_dict_type` VALUES (1972192593367994370, '000000', '题库状态', 'edu_question_bank_status', 103, 1, '2025-09-28 14:52:10', 1, '2025-09-28 14:52:10', '');
INSERT INTO `sys_dict_type` VALUES (1973927175159230465, '000000', '试题状态', 'edu_question_status', 103, 1, '2025-10-03 09:44:47', 1, '2025-10-03 09:44:47', '');
INSERT INTO `sys_dict_type` VALUES (1973933932094873601, '000000', '试题类型', 'edu_question_type', 103, 1, '2025-10-03 10:11:38', 1, '2025-10-03 10:11:38', '');
INSERT INTO `sys_dict_type` VALUES (1974308937945280513, '533080', '题库分类状态', 'edu_question_bank_category_status', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '');
INSERT INTO `sys_dict_type` VALUES (1974308937945280514, '533080', '题库状态', 'edu_question_bank_status', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '');
INSERT INTO `sys_dict_type` VALUES (1974308937945280515, '533080', '试题状态', 'edu_question_status', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '');
INSERT INTO `sys_dict_type` VALUES (1974308937945280516, '533080', '试题类型', 'edu_question_type', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '');
INSERT INTO `sys_dict_type` VALUES (1974308937945280517, '533080', '系统状态', 'sys_common_status', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (1974308937945280518, '533080', '设备类型', 'sys_device_type', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '客户端设备类型');
INSERT INTO `sys_dict_type` VALUES (1974308937945280519, '533080', '授权类型', 'sys_grant_type', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '认证授权类型');
INSERT INTO `sys_dict_type` VALUES (1974308937945280520, '533080', '系统开关', 'sys_normal_disable', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (1974308937945280521, '533080', '通知状态', 'sys_notice_status', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (1974308937945280522, '533080', '通知类型', 'sys_notice_type', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (1974308937945280523, '533080', '操作类型', 'sys_oper_type', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (1974308937945280524, '533080', '菜单状态', 'sys_show_hide', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (1974308937945280525, '533080', '用户性别', 'sys_user_sex', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (1974308937945280526, '533080', '系统是否', 'sys_yes_no', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (1974308937945280527, '533080', '业务状态', 'wf_business_status', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '业务状态列表');
INSERT INTO `sys_dict_type` VALUES (1974308937945280528, '533080', '表单类型', 'wf_form_type', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '表单类型列表');
INSERT INTO `sys_dict_type` VALUES (1974308937945280529, '533080', '任务状态', 'wf_task_status', 103, 1, '2025-10-04 11:01:46', 1, '2025-10-04 11:01:46', '任务状态');
INSERT INTO `sys_dict_type` VALUES (1974352885459939329, '000000', '考试分类状态', 'edu_exam_category_status', 103, 1, '2025-10-04 13:56:24', 1, '2025-10-04 13:56:24', '');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL COMMENT '访问ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `client_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '客户端',
  `device_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '设备类型',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1974309257366695938, '533080', 'weilai', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '密码输入错误1次', '2025-10-04 11:03:03');
INSERT INTO `sys_logininfor` VALUES (1974309276060708865, '533080', 'weilai', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2025-10-04 11:03:07');
INSERT INTO `sys_logininfor` VALUES (1974309652277194754, '533080', 'weilai', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2025-10-04 11:04:37');
INSERT INTO `sys_logininfor` VALUES (1974349367672008706, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '验证码已失效', '2025-10-04 13:42:26');
INSERT INTO `sys_logininfor` VALUES (1974349383031549954, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2025-10-04 13:42:29');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '显示状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 3, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 4, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, 'PLUS官网', 0, 5, 'https://gitee.com/dromara/RuoYi-Vue-Plus', NULL, '', 0, 0, 'M', '0', '0', '', 'guide', 103, 1, '2025-09-28 14:31:55', NULL, NULL, 'RuoYi-Vue-Plus官网地址');
INSERT INTO `sys_menu` VALUES (5, '测试菜单', 0, 5, 'demo', NULL, '', 1, 0, 'M', '0', '0', '', 'star', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '测试菜单');
INSERT INTO `sys_menu` VALUES (6, '租户管理', 0, 2, 'tenant', NULL, '', 1, 0, 'M', '0', '0', '', 'chart', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '租户管理目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '修改生成配置', 3, 2, 'gen-edit/index/:tableId', 'tool/gen/editTable', '', 1, 1, 'C', '1', '0', 'tool:gen:edit', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '/tool/gen');
INSERT INTO `sys_menu` VALUES (117, 'Admin监控', 2, 5, 'Admin', 'monitor/admin/index', '', 1, 0, 'C', '0', '0', 'monitor:admin:list', 'dashboard', 103, 1, '2025-09-28 14:31:55', NULL, NULL, 'Admin监控菜单');
INSERT INTO `sys_menu` VALUES (118, '文件管理', 1, 10, 'oss', 'system/oss/index', '', 1, 0, 'C', '0', '0', 'system:oss:list', 'upload', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '文件管理菜单');
INSERT INTO `sys_menu` VALUES (120, '任务调度中心', 2, 6, 'snailjob', 'monitor/snailjob/index', '', 1, 0, 'C', '0', '0', 'monitor:snailjob:list', 'job', 103, 1, '2025-09-28 14:31:55', NULL, NULL, 'SnailJob控制台菜单');
INSERT INTO `sys_menu` VALUES (121, '租户管理', 6, 1, 'tenant', 'system/tenant/index', '', 1, 0, 'C', '0', '0', 'system:tenant:list', 'list', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '租户管理菜单');
INSERT INTO `sys_menu` VALUES (122, '租户套餐管理', 6, 2, 'tenantPackage', 'system/tenantPackage/index', '', 1, 0, 'C', '0', '0', 'system:tenantPackage:list', 'form', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '租户套餐管理菜单');
INSERT INTO `sys_menu` VALUES (123, '客户端管理', 1, 11, 'client', 'system/client/index', '', 1, 0, 'C', '0', '0', 'system:client:list', 'international', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '客户端管理菜单');
INSERT INTO `sys_menu` VALUES (130, '分配用户', 1, 2, 'role-auth/user/:roleId', 'system/role/authUser', '', 1, 1, 'C', '1', '0', 'system:role:edit', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '/system/role');
INSERT INTO `sys_menu` VALUES (131, '分配角色', 1, 1, 'user-auth/role/:userId', 'system/user/authRole', '', 1, 1, 'C', '1', '0', 'system:user:edit', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '/system/user');
INSERT INTO `sys_menu` VALUES (132, '字典数据', 1, 6, 'dict-data/index/:dictId', 'system/dict/data', '', 1, 1, 'C', '1', '0', 'system:dict:list', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '/system/dict');
INSERT INTO `sys_menu` VALUES (133, '文件配置管理', 1, 10, 'oss-config/index', 'system/oss/config', '', 1, 1, 'C', '1', '0', 'system:ossConfig:list', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '/system/oss');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '客户端管理查询', 123, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:client:query', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1062, '客户端管理新增', 123, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:client:add', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1063, '客户端管理修改', 123, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:client:edit', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1064, '客户端管理删除', 123, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:client:remove', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1065, '客户端管理导出', 123, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:client:export', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1500, '测试单表', 5, 1, 'demo', 'demo/demo/index', '', 1, 0, 'C', '0', '0', 'demo:demo:list', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '测试单表菜单');
INSERT INTO `sys_menu` VALUES (1501, '测试单表查询', 1500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'demo:demo:query', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1502, '测试单表新增', 1500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'demo:demo:add', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1503, '测试单表修改', 1500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'demo:demo:edit', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1504, '测试单表删除', 1500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'demo:demo:remove', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1505, '测试单表导出', 1500, 5, '#', '', '', 1, 0, 'F', '0', '0', 'demo:demo:export', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1506, '测试树表', 5, 1, 'tree', 'demo/tree/index', '', 1, 0, 'C', '0', '0', 'demo:tree:list', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '测试树表菜单');
INSERT INTO `sys_menu` VALUES (1507, '测试树表查询', 1506, 1, '#', '', '', 1, 0, 'F', '0', '0', 'demo:tree:query', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1508, '测试树表新增', 1506, 2, '#', '', '', 1, 0, 'F', '0', '0', 'demo:tree:add', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1509, '测试树表修改', 1506, 3, '#', '', '', 1, 0, 'F', '0', '0', 'demo:tree:edit', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1510, '测试树表删除', 1506, 4, '#', '', '', 1, 0, 'F', '0', '0', 'demo:tree:remove', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1511, '测试树表导出', 1506, 5, '#', '', '', 1, 0, 'F', '0', '0', 'demo:tree:export', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1600, '文件查询', 118, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:query', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1601, '文件上传', 118, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:upload', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1602, '文件下载', 118, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:download', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1603, '文件删除', 118, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:remove', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1606, '租户查询', 121, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenant:query', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1607, '租户新增', 121, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenant:add', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1608, '租户修改', 121, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenant:edit', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1609, '租户删除', 121, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenant:remove', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1610, '租户导出', 121, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenant:export', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1611, '租户套餐查询', 122, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenantPackage:query', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1612, '租户套餐新增', 122, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenantPackage:add', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1613, '租户套餐修改', 122, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenantPackage:edit', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1614, '租户套餐删除', 122, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenantPackage:remove', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1615, '租户套餐导出', 122, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenantPackage:export', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1620, '配置列表', 118, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:ossConfig:list', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1621, '配置添加', 118, 6, '#', '', '', 1, 0, 'F', '0', '0', 'system:ossConfig:add', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1622, '配置编辑', 118, 6, '#', '', '', 1, 0, 'F', '0', '0', 'system:ossConfig:edit', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1623, '配置删除', 118, 6, '#', '', '', 1, 0, 'F', '0', '0', 'system:ossConfig:remove', '#', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11616, '工作流', 0, 6, 'workflow', '', '', 1, 0, 'M', '0', '0', '', 'workflow', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11618, '我的任务', 0, 7, 'task', '', '', 1, 0, 'M', '0', '0', '', 'my-task', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11619, '我的待办', 11618, 2, 'taskWaiting', 'workflow/task/taskWaiting', '', 1, 1, 'C', '0', '0', '', 'waiting', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11620, '流程定义', 11616, 3, 'processDefinition', 'workflow/processDefinition/index', '', 1, 1, 'C', '0', '0', '', 'process-definition', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11621, '流程实例', 11630, 1, 'processInstance', 'workflow/processInstance/index', '', 1, 1, 'C', '0', '0', '', 'tree-table', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11622, '流程分类', 11616, 1, 'category', 'workflow/category/index', '', 1, 0, 'C', '0', '0', 'workflow:category:list', 'category', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11623, '流程分类查询', 11622, 1, '#', '', '', 1, 0, 'F', '0', '0', 'workflow:category:query', '#', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11624, '流程分类新增', 11622, 2, '#', '', '', 1, 0, 'F', '0', '0', 'workflow:category:add', '#', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11625, '流程分类修改', 11622, 3, '#', '', '', 1, 0, 'F', '0', '0', 'workflow:category:edit', '#', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11626, '流程分类删除', 11622, 4, '#', '', '', 1, 0, 'F', '0', '0', 'workflow:category:remove', '#', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11627, '流程分类导出', 11622, 5, '#', '', '', 1, 0, 'F', '0', '0', 'workflow:category:export', '#', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11629, '我发起的', 11618, 1, 'myDocument', 'workflow/task/myDocument', '', 1, 1, 'C', '0', '0', '', 'guide', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11630, '流程监控', 11616, 4, 'monitor', '', '', 1, 0, 'M', '0', '0', '', 'monitor', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11631, '待办任务', 11630, 2, 'allTaskWaiting', 'workflow/task/allTaskWaiting', '', 1, 1, 'C', '0', '0', '', 'waiting', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11632, '我的已办', 11618, 3, 'taskFinish', 'workflow/task/taskFinish', '', 1, 1, 'C', '0', '0', '', 'finish', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11633, '我的抄送', 11618, 4, 'taskCopyList', 'workflow/task/taskCopyList', '', 1, 1, 'C', '0', '0', '', 'my-copy', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11638, '请假申请', 5, 1, 'leave', 'workflow/leave/index', '', 1, 0, 'C', '0', '0', 'workflow:leave:list', '#', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '请假申请菜单');
INSERT INTO `sys_menu` VALUES (11639, '请假申请查询', 11638, 1, '#', '', '', 1, 0, 'F', '0', '0', 'workflow:leave:query', '#', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11640, '请假申请新增', 11638, 2, '#', '', '', 1, 0, 'F', '0', '0', 'workflow:leave:add', '#', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11641, '请假申请修改', 11638, 3, '#', '', '', 1, 0, 'F', '0', '0', 'workflow:leave:edit', '#', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11642, '请假申请删除', 11638, 4, '#', '', '', 1, 0, 'F', '0', '0', 'workflow:leave:remove', '#', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11643, '请假申请导出', 11638, 5, '#', '', '', 1, 0, 'F', '0', '0', 'workflow:leave:export', '#', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11700, '流程设计', 11616, 5, 'design/index', 'workflow/processDefinition/design', '', 1, 1, 'C', '1', '0', 'workflow:leave:edit', '#', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '/workflow/processDefinition');
INSERT INTO `sys_menu` VALUES (11701, '请假申请', 11616, 6, 'leaveEdit/index', 'workflow/leave/leaveEdit', '', 1, 1, 'C', '1', '0', 'workflow:leave:edit', '#', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11801, '流程表达式', 11616, 2, 'spel', 'workflow/spel/index', '', 1, 0, 'C', '0', '0', 'workflow:spel:list', 'input', 103, 1, '2025-10-04 11:01:24', 1, '2025-10-04 11:01:24', '流程达式定义菜单');
INSERT INTO `sys_menu` VALUES (11802, '流程达式定义查询', 11801, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'workflow:spel:query', '#', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11803, '流程达式定义新增', 11801, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'workflow:spel:add', '#', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11804, '流程达式定义修改', 11801, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'workflow:spel:edit', '#', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11805, '流程达式定义删除', 11801, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'workflow:spel:remove', '#', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11806, '流程达式定义导出', 11801, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'workflow:spel:export', '#', 103, 1, '2025-10-04 11:01:24', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1972195018522955778, '题库管理', 0, 1, 'question/bank', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'example', 103, 1, '2025-09-28 15:01:49', 1, '2025-09-28 15:54:08', '');
INSERT INTO `sys_menu` VALUES (1972195267572338690, '题库', 1972195018522955778, 1, 'questionBank', 'edu/questionBank/index', NULL, 1, 0, 'C', '0', '0', 'edu:questionBank:list', '#', 103, 1, '2025-09-28 15:28:51', NULL, NULL, '题库菜单');
INSERT INTO `sys_menu` VALUES (1972195267572338691, '题库查询', 1972195267572338690, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'edu:questionBank:query', '#', 103, 1, '2025-09-28 15:28:51', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1972195267572338692, '题库新增', 1972195267572338690, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'edu:questionBank:add', '#', 103, 1, '2025-09-28 15:28:51', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1972195267572338693, '题库修改', 1972195267572338690, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'edu:questionBank:edit', '#', 103, 1, '2025-09-28 15:28:51', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1972195267572338694, '题库删除', 1972195267572338690, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'edu:questionBank:remove', '#', 103, 1, '2025-09-28 15:28:51', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1972195267572338695, '题库导出', 1972195267572338690, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'edu:questionBank:export', '#', 103, 1, '2025-09-28 15:28:51', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1972209543498375170, '题库分类', 1972195018522955778, 1, 'questionBankCategory', 'edu/questionBankCategory/index', NULL, 1, 0, 'C', '0', '0', 'edu:questionBankCategory:list', '#', 103, 1, '2025-09-28 16:00:03', NULL, NULL, '题库分类菜单');
INSERT INTO `sys_menu` VALUES (1972209543498375171, '题库分类查询', 1972209543498375170, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'edu:questionBankCategory:query', '#', 103, 1, '2025-09-28 16:00:03', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1972209543498375172, '题库分类新增', 1972209543498375170, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'edu:questionBankCategory:add', '#', 103, 1, '2025-09-28 16:00:03', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1972209543498375173, '题库分类修改', 1972209543498375170, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'edu:questionBankCategory:edit', '#', 103, 1, '2025-09-28 16:00:03', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1972209543498375174, '题库分类删除', 1972209543498375170, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'edu:questionBankCategory:remove', '#', 103, 1, '2025-09-28 16:00:03', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1972209543498375175, '题库分类导出', 1972209543498375170, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'edu:questionBankCategory:export', '#', 103, 1, '2025-09-28 16:00:03', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1973928478631473154, '试题', 1972195018522955778, 1, 'question/index/:bankId', 'edu/question/index', NULL, 1, 0, 'C', '1', '0', 'edu:question:list', '#', 103, 1, '2025-10-03 09:50:39', 1, '2025-10-03 15:51:10', '试题菜单');
INSERT INTO `sys_menu` VALUES (1973928478631473155, '试题查询', 1973928478631473154, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'edu:question:query', '#', 103, 1, '2025-10-03 09:50:39', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1973928478631473156, '试题新增', 1973928478631473154, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'edu:question:add', '#', 103, 1, '2025-10-03 09:50:39', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1973928478631473157, '试题修改', 1973928478631473154, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'edu:question:edit', '#', 103, 1, '2025-10-03 09:50:39', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1973928478631473158, '试题删除', 1973928478631473154, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'edu:question:remove', '#', 103, 1, '2025-10-03 09:50:39', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1973928478631473159, '试题导出', 1973928478631473154, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'edu:question:export', '#', 103, 1, '2025-10-03 09:50:39', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1974353177597407233, '考试分类', 1972195018522955778, 1, 'examCategory', 'edu/examCategory/index', NULL, 1, 0, 'C', '0', '0', 'edu:examCategory:list', '#', 103, 1, '2025-10-04 13:58:18', NULL, NULL, '考试分类菜单');
INSERT INTO `sys_menu` VALUES (1974353177597407234, '考试分类查询', 1974353177597407233, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'edu:examCategory:query', '#', 103, 1, '2025-10-04 13:58:18', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1974353177597407235, '考试分类新增', 1974353177597407233, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'edu:examCategory:add', '#', 103, 1, '2025-10-04 13:58:18', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1974353177597407236, '考试分类修改', 1974353177597407233, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'edu:examCategory:edit', '#', 103, 1, '2025-10-04 13:58:18', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1974353177597407237, '考试分类删除', 1974353177597407233, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'edu:examCategory:remove', '#', 103, 1, '2025-10-04 13:58:18', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1974353177597407238, '考试分类导出', 1974353177597407233, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'edu:examCategory:export', '#', 103, 1, '2025-10-04 13:58:18', NULL, NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` bigint NOT NULL COMMENT '公告ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '000000', '温馨提醒：2018-07-01 新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '000000', '维护通知：2018-07-01 系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 103, 1, '2025-09-28 14:31:56', NULL, NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL COMMENT '日志主键',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1974309428074868738, '533080', '通知公告', 1, 'org.dromara.system.controller.system.SysNoticeController.add()', 'POST', 1, 'weilai', '广州市未来中学', '/system/notice', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"noticeId\":null,\"noticeTitle\":\"123\",\"noticeType\":\"1\",\"noticeContent\":\"<p>123</p>\",\"status\":\"0\",\"remark\":\"\",\"createByName\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2025-10-04 11:03:43', 13);
INSERT INTO `sys_oper_log` VALUES (1974309439785365505, '533080', '通知公告', 3, 'org.dromara.system.controller.system.SysNoticeController.remove()', 'DELETE', 1, 'weilai', '广州市未来中学', '/system/notice/1974309428007759874', '0:0:0:0:0:0:0:1', '内网IP', '[\"1974309428007759874\"]', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2025-10-04 11:03:46', 6);
INSERT INTO `sys_oper_log` VALUES (1974318537956356098, '000000', '操作日志', 9, 'org.dromara.system.controller.monitor.SysOperlogController.clean()', 'DELETE', 1, 'admin', '研发部门', '/monitor/operlog/clean', '0:0:0:0:0:0:0:1', '内网IP', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2025-10-04 11:39:55', 14);
INSERT INTO `sys_oper_log` VALUES (1974318553093599234, '000000', '登录日志', 9, 'org.dromara.system.controller.monitor.SysLogininforController.clean()', 'DELETE', 1, 'admin', '研发部门', '/monitor/logininfor/clean', '0:0:0:0:0:0:0:1', '内网IP', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2025-10-04 11:39:59', 5);
INSERT INTO `sys_oper_log` VALUES (1974349801333682177, '000000', '客户端管理', 2, 'org.dromara.system.controller.system.SysClientController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/client', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":2,\"clientId\":\"428a8310cd442757ae699df5d894f051\",\"clientKey\":\"app\",\"clientSecret\":\"app123\",\"grantTypeList\":[\"password\",\"sms\",\"social\"],\"grantType\":\"password,sms,social\",\"deviceType\":\"android\",\"activeTimeout\":180000,\"timeout\":604800,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2025-10-04 13:44:09', 16);
INSERT INTO `sys_oper_log` VALUES (1974349815632064513, '000000', '客户端管理', 2, 'org.dromara.system.controller.system.SysClientController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/client', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":1,\"clientId\":\"e5cd7e4891bf95d1d19206ce24a7b32e\",\"clientKey\":\"pc\",\"clientSecret\":\"pc123\",\"grantTypeList\":[\"password\",\"social\"],\"grantType\":\"password,social\",\"deviceType\":\"pc\",\"activeTimeout\":180000,\"timeout\":604800,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2025-10-04 13:44:12', 6);
INSERT INTO `sys_oper_log` VALUES (1974352410400485378, '000000', '代码生成', 6, 'org.dromara.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '0:0:0:0:0:0:0:1', '内网IP', '{\"tables\":\"edu_exam_category\",\"dataName\":\"master\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2025-10-04 13:54:31', 127);
INSERT INTO `sys_oper_log` VALUES (1974352508744331265, '000000', '代码生成', 2, 'org.dromara.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2025-10-04 13:54:54\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":null},\"tableId\":\"1974352410014609409\",\"dataName\":\"master\",\"tableName\":\"edu_exam_category\",\"tableComment\":\"考试分类表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"EduExamCategory\",\"tplCategory\":\"crud\",\"packageName\":\"org.dromara.edu\",\"moduleName\":\"edu\",\"businessName\":\"examCategory\",\"functionName\":\"考试分类\",\"functionAuthor\":\"eezd\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":103,\"createBy\":1,\"createTime\":\"2025-10-04 13:54:31\",\"updateBy\":1,\"updateTime\":\"2025-10-04 13:54:54\",\"columnId\":\"1974352410333376514\",\"tableId\":\"1974352410014609409\",\"columnName\":\"id\",\"columnComment\":\"考试分类ID\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"pk\":true,\"insert\":false,\"usableColumn\":false,\"edit\":true,\"superColumn\":false,\"query\":false,\"increment\":true,\"capJavaField\":\"Id\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2025-10-04 13:54:31\",\"updateBy\":1,\"updateTime\":\"2025-10-04 13:54:54\",\"columnId\":\"1974352410333376515\",\"tableId\":\"1974352410014609409\",\"columnName\":\"tenant_id\",\"columnComment\":\"租户编号\",\"columnType\":\"varchar(20)\",\"javaType\":\"String\",\"javaField\":\"tenantId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":null,\"isList\":null,\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"list\":false,\"pk\":false,\"insert\":false,\"usableColumn\":false,\"edit\":false,\"superColumn\":false,\"query\":false,\"increment\":false,\"capJavaField\":\"TenantId\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2025-10-04 13:54:31\",\"updateBy\":1,\"updateTime\":\"2025-10-04 13:54:54\",\"columnId\":\"1974352410333376516\",\"tableId\":\"1974352410014609409\",\"columnName\":\"parent_id\",\"columnComment\":\"父级分类ID,根节点为0\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"parentId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":3,\"required\":false,\"list\":true,\"pk\":false,\"insert\":true,\"usableColumn\":true,\"edit\":true,\"superColumn\":true,\"query\":true,\"increment\":false,\"capJavaField\":\"ParentId\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2025-10-04 13:54:31\",\"updateBy\":1,\"updateTime\":\"2025-10-04 13:54:54\",\"columnId\":\"1974352410333376517\",\"tableId\":\"1974352410014609409\",\"columnName\":\"category_name\",\"columnComment\":\"分类名称\",\"columnType\":\"varchar(100)\",\"javaType\":\"String\",\"javaField\":\"categoryName\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"LIKE\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":4,\"required\":true,\"list\":true,\"pk\":false,\"insert\":true,\"usableColumn\":false,\"edit\":true,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"CategoryName\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2025-10-04 13:54:31\",\"updateBy\":1,\"updateTime\":\"2025-10-04 13:54:54\",\"columnId\":\"1974352410333376518\",\"tableId\":\"1974352410014609409\",\"columnName\":\"sort_order\",\"columnComment\":\"排序\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"sortOrder\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":5,\"required\":false,\"list\":true,\"pk\":false,\"insert\":true,\"usableColumn\":false,\"edit\":true,\"superColumn\":false,\"query\":false,\"increment\":false,\"capJavaField\":\"SortOrder\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2025-10-04 13:54:31\",\"updateBy\":1,\"updateTime\":\"2025-10-04 13:54:54\",\"columnId\":\"1974352', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2025-10-04 13:54:54', 38);
INSERT INTO `sys_oper_log` VALUES (1974352885459939330, '000000', '字典类型', 1, 'org.dromara.system.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictId\":null,\"dictName\":\"考试分类状态\",\"dictType\":\"edu_exam_category_status\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2025-10-04 13:56:24', 16);
INSERT INTO `sys_oper_log` VALUES (1974352938891177986, '000000', '字典数据', 1, 'org.dromara.system.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":0,\"dictLabel\":\"正常\",\"dictValue\":\"0\",\"dictType\":\"edu_exam_category_status\",\"cssClass\":\"\",\"listClass\":\"primary\",\"isDefault\":null,\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2025-10-04 13:56:37', 20);
INSERT INTO `sys_oper_log` VALUES (1974352958944145410, '000000', '字典数据', 1, 'org.dromara.system.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":1,\"dictLabel\":\"停用\",\"dictValue\":\"1\",\"dictType\":\"edu_exam_category_status\",\"cssClass\":\"\",\"listClass\":\"primary\",\"isDefault\":null,\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2025-10-04 13:56:42', 20);
INSERT INTO `sys_oper_log` VALUES (1974353167069704194, '000000', '代码生成', 2, 'org.dromara.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2025-10-04 13:57:31\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1972195018522955778\"},\"tableId\":\"1974352410014609409\",\"dataName\":\"master\",\"tableName\":\"edu_exam_category\",\"tableComment\":\"考试分类表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"EduExamCategory\",\"tplCategory\":\"crud\",\"packageName\":\"org.dromara.edu\",\"moduleName\":\"edu\",\"businessName\":\"examCategory\",\"functionName\":\"考试分类\",\"functionAuthor\":\"eezd\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":103,\"createBy\":1,\"createTime\":\"2025-10-04 13:54:31\",\"updateBy\":1,\"updateTime\":\"2025-10-04 13:57:31\",\"columnId\":\"1974352410333376514\",\"tableId\":\"1974352410014609409\",\"columnName\":\"id\",\"columnComment\":\"考试分类ID\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"pk\":true,\"insert\":false,\"usableColumn\":false,\"edit\":true,\"superColumn\":false,\"query\":false,\"increment\":true,\"capJavaField\":\"Id\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2025-10-04 13:54:31\",\"updateBy\":1,\"updateTime\":\"2025-10-04 13:57:31\",\"columnId\":\"1974352410333376515\",\"tableId\":\"1974352410014609409\",\"columnName\":\"tenant_id\",\"columnComment\":\"租户编号\",\"columnType\":\"varchar(20)\",\"javaType\":\"String\",\"javaField\":\"tenantId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":null,\"isList\":null,\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"list\":false,\"pk\":false,\"insert\":false,\"usableColumn\":false,\"edit\":false,\"superColumn\":false,\"query\":false,\"increment\":false,\"capJavaField\":\"TenantId\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2025-10-04 13:54:31\",\"updateBy\":1,\"updateTime\":\"2025-10-04 13:57:31\",\"columnId\":\"1974352410333376516\",\"tableId\":\"1974352410014609409\",\"columnName\":\"parent_id\",\"columnComment\":\"父级分类ID,根节点为0\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"parentId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":3,\"required\":false,\"list\":true,\"pk\":false,\"insert\":true,\"usableColumn\":true,\"edit\":true,\"superColumn\":true,\"query\":true,\"increment\":false,\"capJavaField\":\"ParentId\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2025-10-04 13:54:31\",\"updateBy\":1,\"updateTime\":\"2025-10-04 13:57:31\",\"columnId\":\"1974352410333376517\",\"tableId\":\"1974352410014609409\",\"columnName\":\"category_name\",\"columnComment\":\"分类名称\",\"columnType\":\"varchar(100)\",\"javaType\":\"String\",\"javaField\":\"categoryName\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"LIKE\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":4,\"required\":true,\"list\":true,\"pk\":false,\"insert\":true,\"usableColumn\":false,\"edit\":true,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"CategoryName\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2025-10-04 13:54:31\",\"updateBy\":1,\"updateTime\":\"2025-10-04 13:57:31\",\"columnId\":\"1974352410333376518\",\"tableId\":\"1974352410014609409\",\"columnName\":\"sort_order\",\"columnComment\":\"排序\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"sortOrder\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":5,\"required\":false,\"list\":true,\"pk\":false,\"insert\":true,\"usableColumn\":false,\"edit\":true,\"superColumn\":false,\"query\":false,\"increment\":false,\"capJavaField\":\"SortOrder\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2025-10-04 13:54:31\",\"updateBy\":1,\"updateTime\":\"2025-10-04 13:57:31\",\"c', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2025-10-04 13:57:31', 23);
INSERT INTO `sys_oper_log` VALUES (1974353178629206018, '000000', '代码生成', 8, 'org.dromara.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '0:0:0:0:0:0:0:1', '内网IP', '{\"tableIdStr\":\"1974352410014609409\"}', '', 0, '', '2025-10-04 13:57:34', 239);
INSERT INTO `sys_oper_log` VALUES (1974354612883988482, '000000', '代码生成', 2, 'org.dromara.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2025-10-04 14:03:16\",\"params\":{\"treeCode\":\"id\",\"treeName\":\"category_name\",\"treeParentCode\":\"parent_id\",\"parentMenuId\":\"1972195018522955778\"},\"tableId\":\"1974352410014609409\",\"dataName\":\"master\",\"tableName\":\"edu_exam_category\",\"tableComment\":\"考试分类表\",\"subTableName\":\"\",\"subTableFkName\":\"\",\"className\":\"EduExamCategory\",\"tplCategory\":\"tree\",\"packageName\":\"org.dromara.edu\",\"moduleName\":\"edu\",\"businessName\":\"examCategory\",\"functionName\":\"考试分类\",\"functionAuthor\":\"eezd\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":103,\"createBy\":1,\"createTime\":\"2025-10-04 13:54:31\",\"updateBy\":1,\"updateTime\":\"2025-10-04 14:03:16\",\"columnId\":\"1974352410333376514\",\"tableId\":\"1974352410014609409\",\"columnName\":\"id\",\"columnComment\":\"考试分类ID\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"pk\":true,\"superColumn\":false,\"edit\":true,\"insert\":false,\"usableColumn\":false,\"query\":false,\"capJavaField\":\"Id\",\"increment\":true},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2025-10-04 13:54:31\",\"updateBy\":1,\"updateTime\":\"2025-10-04 14:03:16\",\"columnId\":\"1974352410333376515\",\"tableId\":\"1974352410014609409\",\"columnName\":\"tenant_id\",\"columnComment\":\"租户编号\",\"columnType\":\"varchar(20)\",\"javaType\":\"String\",\"javaField\":\"tenantId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":null,\"isList\":null,\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"list\":false,\"pk\":false,\"superColumn\":false,\"edit\":false,\"insert\":false,\"usableColumn\":false,\"query\":false,\"capJavaField\":\"TenantId\",\"increment\":false},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2025-10-04 13:54:31\",\"updateBy\":1,\"updateTime\":\"2025-10-04 14:03:16\",\"columnId\":\"1974352410333376516\",\"tableId\":\"1974352410014609409\",\"columnName\":\"parent_id\",\"columnComment\":\"父级分类ID,根节点为0\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"parentId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":3,\"required\":false,\"list\":true,\"pk\":false,\"superColumn\":true,\"edit\":true,\"insert\":true,\"usableColumn\":true,\"query\":true,\"capJavaField\":\"ParentId\",\"increment\":false},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2025-10-04 13:54:31\",\"updateBy\":1,\"updateTime\":\"2025-10-04 14:03:16\",\"columnId\":\"1974352410333376517\",\"tableId\":\"1974352410014609409\",\"columnName\":\"category_name\",\"columnComment\":\"分类名称\",\"columnType\":\"varchar(100)\",\"javaType\":\"String\",\"javaField\":\"categoryName\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"LIKE\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":4,\"required\":true,\"list\":true,\"pk\":false,\"superColumn\":false,\"edit\":true,\"insert\":true,\"usableColumn\":false,\"query\":true,\"capJavaField\":\"CategoryName\",\"increment\":false},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2025-10-04 13:54:31\",\"updateBy\":1,\"updateTime\":\"2025-10-04 14:03:16\",\"columnId\":\"1974352410333376518\",\"tableId\":\"1974352410014609409\",\"columnName\":\"sort_order\",\"columnComment\":\"排序\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"sortOrder\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":5,\"required\":false,\"list\":true,\"pk\":false,\"superColumn\":false,\"edit\":true,\"insert\":true,\"usableColumn\":false,\"query\":false,\"capJavaField\":\"SortOrder\",\"increment\":false},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2025-10-04 13:54:31\",\"updateBy\":1,\"updateTime\":\"2025-10-0', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2025-10-04 14:03:16', 64);
INSERT INTO `sys_oper_log` VALUES (1974354623403302913, '000000', '代码生成', 8, 'org.dromara.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '0:0:0:0:0:0:0:1', '内网IP', '{\"tableIdStr\":\"1974352410014609409\"}', '', 0, '', '2025-10-04 14:03:19', 145);
INSERT INTO `sys_oper_log` VALUES (1974355693282197506, '000000', '题库', 2, 'org.dromara.edu.controller.EduQuestionBankController.edit()', 'PUT', 1, 'admin', '研发部门', '/edu/questionBank', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1973944395251740674\",\"bankName\":\"初一语文\",\"bankDesc\":null,\"categoryId\":\"1972292862084866050\",\"status\":\"0\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2025-10-04 14:07:34', 22);
INSERT INTO `sys_oper_log` VALUES (1974355713444216833, '000000', '题库', 2, 'org.dromara.edu.controller.EduQuestionBankController.edit()', 'PUT', 1, 'admin', '研发部门', '/edu/questionBank', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1974008748755849218\",\"bankName\":\"初一数学\",\"bankDesc\":null,\"categoryId\":\"1972292880988594177\",\"status\":\"0\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2025-10-04 14:07:39', 10);
INSERT INTO `sys_oper_log` VALUES (1974355791953199107, '000000', '考试分类', 1, 'org.dromara.edu.controller.EduExamCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/edu/examCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1974355791953199106\",\"parentId\":0,\"categoryName\":\"21级\",\"sortOrder\":null,\"status\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2025-10-04 14:07:57', 10);
INSERT INTO `sys_oper_log` VALUES (1974355816443740161, '000000', '考试分类', 1, 'org.dromara.edu.controller.EduExamCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/edu/examCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1974355816364048386\",\"parentId\":0,\"categoryName\":\"22级\",\"sortOrder\":null,\"status\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2025-10-04 14:08:03', 6);
INSERT INTO `sys_oper_log` VALUES (1974356017430593537, '000000', '部门管理', 2, 'org.dromara.system.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":\"2025-10-04 11:16:09\",\"updateBy\":null,\"updateTime\":null,\"deptId\":\"1974312557780627457\",\"parentId\":\"1974312139650461697\",\"deptName\":\"20级\",\"deptCategory\":null,\"orderNum\":0,\"leader\":null,\"phone\":null,\"email\":null,\"status\":\"0\",\"belongDeptId\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2025-10-04 14:08:51', 37);
INSERT INTO `sys_oper_log` VALUES (1974356037370314754, '000000', '部门管理', 2, 'org.dromara.system.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":\"2025-10-04 11:16:48\",\"updateBy\":null,\"updateTime\":null,\"deptId\":\"1974312721278791682\",\"parentId\":\"1974312557780627457\",\"deptName\":\"20级一班\",\"deptCategory\":null,\"orderNum\":0,\"leader\":null,\"phone\":null,\"email\":null,\"status\":\"0\",\"belongDeptId\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2025-10-04 14:08:56', 20);
INSERT INTO `sys_oper_log` VALUES (1974356054378217473, '000000', '部门管理', 2, 'org.dromara.system.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":\"2025-10-04 11:16:55\",\"updateBy\":null,\"updateTime\":null,\"deptId\":\"1974312750253043714\",\"parentId\":\"1974312557780627457\",\"deptName\":\"20级二班\",\"deptCategory\":null,\"orderNum\":0,\"leader\":null,\"phone\":null,\"email\":null,\"status\":\"0\",\"belongDeptId\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2025-10-04 14:09:00', 19);
INSERT INTO `sys_oper_log` VALUES (1974356223400280065, '000000', '考试分类', 2, 'org.dromara.edu.controller.EduExamCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/edu/examCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1974355816364048386\",\"parentId\":0,\"categoryName\":\"20级\",\"sortOrder\":0,\"status\":\"0\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2025-10-04 14:09:40', 5);
INSERT INTO `sys_oper_log` VALUES (1974356296079179777, '000000', '考试分类', 1, 'org.dromara.edu.controller.EduExamCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/edu/examCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1974356296016265218\",\"parentId\":\"1974355791953199106\",\"categoryName\":\"初一阶段\",\"sortOrder\":null,\"status\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2025-10-04 14:09:57', 5);
INSERT INTO `sys_oper_log` VALUES (1974356503781113858, '000000', '考试分类', 1, 'org.dromara.edu.controller.EduExamCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/edu/examCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1974356503714004993\",\"parentId\":\"1974355791953199106\",\"categoryName\":\"初二阶段\",\"sortOrder\":null,\"status\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2025-10-04 14:10:47', 6);
INSERT INTO `sys_oper_log` VALUES (1974356691551715329, '000000', '考试分类', 1, 'org.dromara.edu.controller.EduExamCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/edu/examCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1974356691484606465\",\"parentId\":\"1974356296016265218\",\"categoryName\":\"10月考试\",\"sortOrder\":null,\"status\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2025-10-04 14:11:32', 6);
INSERT INTO `sys_oper_log` VALUES (1974356718672084993, '000000', '考试分类', 1, 'org.dromara.edu.controller.EduExamCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/edu/examCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1974356718604976129\",\"parentId\":\"1974356296016265218\",\"categoryName\":\"12月考试\",\"sortOrder\":null,\"status\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2025-10-04 14:11:38', 5);
INSERT INTO `sys_oper_log` VALUES (1974356809428434946, '000000', '考试分类', 2, 'org.dromara.edu.controller.EduExamCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/edu/examCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1974356691484606465\",\"parentId\":\"1974356296016265218\",\"categoryName\":\"2021年10月考试\",\"sortOrder\":0,\"status\":\"0\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2025-10-04 14:12:00', 5);
INSERT INTO `sys_oper_log` VALUES (1974356836708188161, '000000', '考试分类', 2, 'org.dromara.edu.controller.EduExamCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/edu/examCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"1974356718604976129\",\"parentId\":\"1974356296016265218\",\"categoryName\":\"2021年12月考试\",\"sortOrder\":0,\"status\":\"0\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2025-10-04 14:12:06', 5);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `oss_id` bigint NOT NULL COMMENT '对象存储主键',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '原名',
  `file_suffix` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件后缀名',
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'URL地址',
  `ext1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '扩展字段',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '上传人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `service` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'minio' COMMENT '服务商',
  PRIMARY KEY (`oss_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'OSS对象存储表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oss_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss_config`;
CREATE TABLE `sys_oss_config`  (
  `oss_config_id` bigint NOT NULL COMMENT '主键',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `config_key` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配置key',
  `access_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'accessKey',
  `secret_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '秘钥',
  `bucket_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '桶名称',
  `prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '前缀',
  `endpoint` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '访问站点',
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '自定义域名',
  `is_https` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否https（Y=是,N=否）',
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '域',
  `access_policy` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '桶权限类型(0=private 1=public 2=custom)',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否默认（0=是,1=否）',
  `ext1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '扩展字段',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`oss_config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '对象存储配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oss_config
-- ----------------------------
INSERT INTO `sys_oss_config` VALUES (1, '000000', 'minio', 'ruoyi', 'ruoyi123', 'ruoyi', '', '127.0.0.1:9000', '', 'N', '', '1', '0', '', 103, 1, '2025-09-28 14:31:57', 1, '2025-09-28 14:31:57', NULL);
INSERT INTO `sys_oss_config` VALUES (2, '000000', 'qiniu', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi', '', 's3-cn-north-1.qiniucs.com', '', 'N', '', '1', '1', '', 103, 1, '2025-09-28 14:31:57', 1, '2025-09-28 14:31:57', NULL);
INSERT INTO `sys_oss_config` VALUES (3, '000000', 'aliyun', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi', '', 'oss-cn-beijing.aliyuncs.com', '', 'N', '', '1', '1', '', 103, 1, '2025-09-28 14:31:57', 1, '2025-09-28 14:31:57', NULL);
INSERT INTO `sys_oss_config` VALUES (4, '000000', 'qcloud', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi-1240000000', '', 'cos.ap-beijing.myqcloud.com', '', 'N', 'ap-beijing', '1', '1', '', 103, 1, '2025-09-28 14:31:57', 1, '2025-09-28 14:31:57', NULL);
INSERT INTO `sys_oss_config` VALUES (5, '000000', 'image', 'ruoyi', 'ruoyi123', 'ruoyi', 'image', '127.0.0.1:9000', '', 'N', '', '1', '1', '', 103, 1, '2025-09-28 14:31:57', 1, '2025-09-28 14:31:57', NULL);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `dept_id` bigint NOT NULL COMMENT '部门id',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_category` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '岗位类别编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, '000000', 103, 'ceo', NULL, '董事长', 1, '0', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_post` VALUES (2, '000000', 100, 'se', NULL, '项目经理', 2, '0', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_post` VALUES (3, '000000', 100, 'hr', NULL, '人力资源', 3, '0', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');
INSERT INTO `sys_post` VALUES (4, '000000', 100, 'user', NULL, '普通员工', 4, '0', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限 5：仅本人数据权限 6：部门及以下或本人数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '000000', '超级管理员', 'superadmin', 1, '1', 1, 1, '0', '0', 103, 1, '2025-09-28 14:31:55', NULL, NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (3, '000000', '教职工', 'teacher', 3, '4', 1, 1, '0', '0', 103, 1, '2025-09-28 14:31:55', 1, '2025-10-04 11:26:57', '');
INSERT INTO `sys_role` VALUES (4, '000000', '学生', 'student', 4, '5', 1, 1, '0', '0', 103, 1, '2025-09-28 14:31:55', 1, '2025-10-04 11:21:12', '');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (1974308937555210242, 1974308937622319106);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (3, 1);
INSERT INTO `sys_role_menu` VALUES (3, 2);
INSERT INTO `sys_role_menu` VALUES (3, 3);
INSERT INTO `sys_role_menu` VALUES (3, 4);
INSERT INTO `sys_role_menu` VALUES (3, 5);
INSERT INTO `sys_role_menu` VALUES (3, 6);
INSERT INTO `sys_role_menu` VALUES (3, 100);
INSERT INTO `sys_role_menu` VALUES (3, 101);
INSERT INTO `sys_role_menu` VALUES (3, 102);
INSERT INTO `sys_role_menu` VALUES (3, 103);
INSERT INTO `sys_role_menu` VALUES (3, 104);
INSERT INTO `sys_role_menu` VALUES (3, 105);
INSERT INTO `sys_role_menu` VALUES (3, 106);
INSERT INTO `sys_role_menu` VALUES (3, 107);
INSERT INTO `sys_role_menu` VALUES (3, 108);
INSERT INTO `sys_role_menu` VALUES (3, 109);
INSERT INTO `sys_role_menu` VALUES (3, 113);
INSERT INTO `sys_role_menu` VALUES (3, 115);
INSERT INTO `sys_role_menu` VALUES (3, 116);
INSERT INTO `sys_role_menu` VALUES (3, 117);
INSERT INTO `sys_role_menu` VALUES (3, 118);
INSERT INTO `sys_role_menu` VALUES (3, 120);
INSERT INTO `sys_role_menu` VALUES (3, 121);
INSERT INTO `sys_role_menu` VALUES (3, 122);
INSERT INTO `sys_role_menu` VALUES (3, 123);
INSERT INTO `sys_role_menu` VALUES (3, 130);
INSERT INTO `sys_role_menu` VALUES (3, 131);
INSERT INTO `sys_role_menu` VALUES (3, 132);
INSERT INTO `sys_role_menu` VALUES (3, 133);
INSERT INTO `sys_role_menu` VALUES (3, 500);
INSERT INTO `sys_role_menu` VALUES (3, 501);
INSERT INTO `sys_role_menu` VALUES (3, 1001);
INSERT INTO `sys_role_menu` VALUES (3, 1002);
INSERT INTO `sys_role_menu` VALUES (3, 1003);
INSERT INTO `sys_role_menu` VALUES (3, 1004);
INSERT INTO `sys_role_menu` VALUES (3, 1005);
INSERT INTO `sys_role_menu` VALUES (3, 1006);
INSERT INTO `sys_role_menu` VALUES (3, 1007);
INSERT INTO `sys_role_menu` VALUES (3, 1008);
INSERT INTO `sys_role_menu` VALUES (3, 1009);
INSERT INTO `sys_role_menu` VALUES (3, 1010);
INSERT INTO `sys_role_menu` VALUES (3, 1011);
INSERT INTO `sys_role_menu` VALUES (3, 1012);
INSERT INTO `sys_role_menu` VALUES (3, 1013);
INSERT INTO `sys_role_menu` VALUES (3, 1014);
INSERT INTO `sys_role_menu` VALUES (3, 1015);
INSERT INTO `sys_role_menu` VALUES (3, 1016);
INSERT INTO `sys_role_menu` VALUES (3, 1017);
INSERT INTO `sys_role_menu` VALUES (3, 1018);
INSERT INTO `sys_role_menu` VALUES (3, 1019);
INSERT INTO `sys_role_menu` VALUES (3, 1020);
INSERT INTO `sys_role_menu` VALUES (3, 1021);
INSERT INTO `sys_role_menu` VALUES (3, 1022);
INSERT INTO `sys_role_menu` VALUES (3, 1023);
INSERT INTO `sys_role_menu` VALUES (3, 1024);
INSERT INTO `sys_role_menu` VALUES (3, 1025);
INSERT INTO `sys_role_menu` VALUES (3, 1026);
INSERT INTO `sys_role_menu` VALUES (3, 1027);
INSERT INTO `sys_role_menu` VALUES (3, 1028);
INSERT INTO `sys_role_menu` VALUES (3, 1029);
INSERT INTO `sys_role_menu` VALUES (3, 1030);
INSERT INTO `sys_role_menu` VALUES (3, 1031);
INSERT INTO `sys_role_menu` VALUES (3, 1032);
INSERT INTO `sys_role_menu` VALUES (3, 1033);
INSERT INTO `sys_role_menu` VALUES (3, 1034);
INSERT INTO `sys_role_menu` VALUES (3, 1035);
INSERT INTO `sys_role_menu` VALUES (3, 1036);
INSERT INTO `sys_role_menu` VALUES (3, 1037);
INSERT INTO `sys_role_menu` VALUES (3, 1038);
INSERT INTO `sys_role_menu` VALUES (3, 1039);
INSERT INTO `sys_role_menu` VALUES (3, 1040);
INSERT INTO `sys_role_menu` VALUES (3, 1041);
INSERT INTO `sys_role_menu` VALUES (3, 1042);
INSERT INTO `sys_role_menu` VALUES (3, 1043);
INSERT INTO `sys_role_menu` VALUES (3, 1044);
INSERT INTO `sys_role_menu` VALUES (3, 1045);
INSERT INTO `sys_role_menu` VALUES (3, 1046);
INSERT INTO `sys_role_menu` VALUES (3, 1047);
INSERT INTO `sys_role_menu` VALUES (3, 1048);
INSERT INTO `sys_role_menu` VALUES (3, 1050);
INSERT INTO `sys_role_menu` VALUES (3, 1055);
INSERT INTO `sys_role_menu` VALUES (3, 1056);
INSERT INTO `sys_role_menu` VALUES (3, 1057);
INSERT INTO `sys_role_menu` VALUES (3, 1058);
INSERT INTO `sys_role_menu` VALUES (3, 1059);
INSERT INTO `sys_role_menu` VALUES (3, 1060);
INSERT INTO `sys_role_menu` VALUES (3, 1061);
INSERT INTO `sys_role_menu` VALUES (3, 1062);
INSERT INTO `sys_role_menu` VALUES (3, 1063);
INSERT INTO `sys_role_menu` VALUES (3, 1064);
INSERT INTO `sys_role_menu` VALUES (3, 1065);
INSERT INTO `sys_role_menu` VALUES (3, 1500);
INSERT INTO `sys_role_menu` VALUES (3, 1501);
INSERT INTO `sys_role_menu` VALUES (3, 1502);
INSERT INTO `sys_role_menu` VALUES (3, 1503);
INSERT INTO `sys_role_menu` VALUES (3, 1504);
INSERT INTO `sys_role_menu` VALUES (3, 1505);
INSERT INTO `sys_role_menu` VALUES (3, 1506);
INSERT INTO `sys_role_menu` VALUES (3, 1507);
INSERT INTO `sys_role_menu` VALUES (3, 1508);
INSERT INTO `sys_role_menu` VALUES (3, 1509);
INSERT INTO `sys_role_menu` VALUES (3, 1510);
INSERT INTO `sys_role_menu` VALUES (3, 1511);
INSERT INTO `sys_role_menu` VALUES (3, 1600);
INSERT INTO `sys_role_menu` VALUES (3, 1601);
INSERT INTO `sys_role_menu` VALUES (3, 1602);
INSERT INTO `sys_role_menu` VALUES (3, 1603);
INSERT INTO `sys_role_menu` VALUES (3, 1606);
INSERT INTO `sys_role_menu` VALUES (3, 1607);
INSERT INTO `sys_role_menu` VALUES (3, 1608);
INSERT INTO `sys_role_menu` VALUES (3, 1609);
INSERT INTO `sys_role_menu` VALUES (3, 1610);
INSERT INTO `sys_role_menu` VALUES (3, 1611);
INSERT INTO `sys_role_menu` VALUES (3, 1612);
INSERT INTO `sys_role_menu` VALUES (3, 1613);
INSERT INTO `sys_role_menu` VALUES (3, 1614);
INSERT INTO `sys_role_menu` VALUES (3, 1615);
INSERT INTO `sys_role_menu` VALUES (3, 1620);
INSERT INTO `sys_role_menu` VALUES (3, 1621);
INSERT INTO `sys_role_menu` VALUES (3, 1622);
INSERT INTO `sys_role_menu` VALUES (3, 1623);
INSERT INTO `sys_role_menu` VALUES (3, 11616);
INSERT INTO `sys_role_menu` VALUES (3, 11618);
INSERT INTO `sys_role_menu` VALUES (3, 11619);
INSERT INTO `sys_role_menu` VALUES (3, 11620);
INSERT INTO `sys_role_menu` VALUES (3, 11621);
INSERT INTO `sys_role_menu` VALUES (3, 11622);
INSERT INTO `sys_role_menu` VALUES (3, 11623);
INSERT INTO `sys_role_menu` VALUES (3, 11624);
INSERT INTO `sys_role_menu` VALUES (3, 11625);
INSERT INTO `sys_role_menu` VALUES (3, 11626);
INSERT INTO `sys_role_menu` VALUES (3, 11627);
INSERT INTO `sys_role_menu` VALUES (3, 11629);
INSERT INTO `sys_role_menu` VALUES (3, 11630);
INSERT INTO `sys_role_menu` VALUES (3, 11631);
INSERT INTO `sys_role_menu` VALUES (3, 11632);
INSERT INTO `sys_role_menu` VALUES (3, 11633);
INSERT INTO `sys_role_menu` VALUES (3, 11638);
INSERT INTO `sys_role_menu` VALUES (3, 11639);
INSERT INTO `sys_role_menu` VALUES (3, 11640);
INSERT INTO `sys_role_menu` VALUES (3, 11641);
INSERT INTO `sys_role_menu` VALUES (3, 11642);
INSERT INTO `sys_role_menu` VALUES (3, 11643);
INSERT INTO `sys_role_menu` VALUES (3, 11700);
INSERT INTO `sys_role_menu` VALUES (3, 11701);
INSERT INTO `sys_role_menu` VALUES (3, 11801);
INSERT INTO `sys_role_menu` VALUES (3, 11802);
INSERT INTO `sys_role_menu` VALUES (3, 11803);
INSERT INTO `sys_role_menu` VALUES (3, 11804);
INSERT INTO `sys_role_menu` VALUES (3, 11805);
INSERT INTO `sys_role_menu` VALUES (3, 11806);
INSERT INTO `sys_role_menu` VALUES (3, 1972195018522955778);
INSERT INTO `sys_role_menu` VALUES (3, 1972195267572338690);
INSERT INTO `sys_role_menu` VALUES (3, 1972195267572338691);
INSERT INTO `sys_role_menu` VALUES (3, 1972195267572338692);
INSERT INTO `sys_role_menu` VALUES (3, 1972195267572338693);
INSERT INTO `sys_role_menu` VALUES (3, 1972195267572338694);
INSERT INTO `sys_role_menu` VALUES (3, 1972195267572338695);
INSERT INTO `sys_role_menu` VALUES (3, 1972209543498375170);
INSERT INTO `sys_role_menu` VALUES (3, 1972209543498375171);
INSERT INTO `sys_role_menu` VALUES (3, 1972209543498375172);
INSERT INTO `sys_role_menu` VALUES (3, 1972209543498375173);
INSERT INTO `sys_role_menu` VALUES (3, 1972209543498375174);
INSERT INTO `sys_role_menu` VALUES (3, 1972209543498375175);
INSERT INTO `sys_role_menu` VALUES (3, 1973928478631473154);
INSERT INTO `sys_role_menu` VALUES (3, 1973928478631473155);
INSERT INTO `sys_role_menu` VALUES (3, 1973928478631473156);
INSERT INTO `sys_role_menu` VALUES (3, 1973928478631473157);
INSERT INTO `sys_role_menu` VALUES (3, 1973928478631473158);
INSERT INTO `sys_role_menu` VALUES (3, 1973928478631473159);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 2);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 3);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 4);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 5);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 100);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 101);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 102);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 103);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 104);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 105);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 106);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 107);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 108);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 109);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 113);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 115);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 116);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 117);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 118);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 120);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 123);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 130);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 131);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 132);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 133);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 500);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 501);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1001);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1002);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1003);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1004);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1005);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1006);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1007);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1008);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1009);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1010);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1011);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1012);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1013);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1014);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1015);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1016);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1017);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1018);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1019);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1020);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1021);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1022);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1023);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1024);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1025);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1026);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1027);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1028);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1029);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1030);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1031);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1032);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1033);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1034);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1035);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1036);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1037);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1038);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1039);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1040);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1041);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1042);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1043);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1044);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1045);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1046);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1047);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1048);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1050);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1055);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1056);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1057);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1058);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1059);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1060);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1061);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1062);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1063);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1064);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1065);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1500);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1501);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1502);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1503);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1504);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1505);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1506);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1507);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1508);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1509);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1510);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1511);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1600);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1601);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1602);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1603);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1620);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1621);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1622);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1623);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1972195018522955778);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1972195267572338690);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1972195267572338691);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1972195267572338692);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1972195267572338693);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1972195267572338694);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1972195267572338695);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1972209543498375170);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1972209543498375171);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1972209543498375172);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1972209543498375173);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1972209543498375174);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1972209543498375175);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1973928478631473154);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1973928478631473155);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1973928478631473156);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1973928478631473157);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1973928478631473158);
INSERT INTO `sys_role_menu` VALUES (1974308937555210242, 1973928478631473159);

-- ----------------------------
-- Table structure for sys_social
-- ----------------------------
DROP TABLE IF EXISTS `sys_social`;
CREATE TABLE `sys_social`  (
  `id` bigint NOT NULL COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户id',
  `auth_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '平台+平台唯一id',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户来源',
  `open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台编号唯一id',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `access_token` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户的授权令牌',
  `expire_in` int NULL DEFAULT NULL COMMENT '用户的授权令牌的有效期，部分平台可能没有',
  `refresh_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '刷新令牌，部分平台可能没有',
  `access_code` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台的授权信息，部分平台可能没有',
  `union_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户的 unionid',
  `scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授予的权限，部分平台可能没有',
  `token_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个别平台的授权信息，部分平台可能没有',
  `id_token` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'id token，部分平台可能没有',
  `mac_algorithm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小米平台用户的附带属性，部分平台可能没有',
  `mac_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小米平台用户的附带属性，部分平台可能没有',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户的授权code，部分平台可能没有',
  `oauth_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Twitter平台用户的附带属性，部分平台可能没有',
  `oauth_token_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Twitter平台用户的附带属性，部分平台可能没有',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '社会化关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_social
-- ----------------------------

-- ----------------------------
-- Table structure for sys_tenant
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant`;
CREATE TABLE `sys_tenant`  (
  `id` bigint NOT NULL COMMENT 'id',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户编号',
  `contact_user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `company_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
  `license_number` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统一社会信用代码',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `intro` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业简介',
  `domain` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '域名',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `package_id` bigint NULL DEFAULT NULL COMMENT '租户套餐编号',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '过期时间',
  `account_count` int NULL DEFAULT -1 COMMENT '用户数量（-1不限制）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '租户状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '租户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_tenant
-- ----------------------------
INSERT INTO `sys_tenant` VALUES (1, '000000', '管理组', '15888888888', 'XXX有限公司', NULL, NULL, '多租户通用后台管理管理系统', NULL, NULL, NULL, NULL, -1, '0', '0', 103, 1, '2025-09-28 14:31:55', NULL, NULL);

-- ----------------------------
-- Table structure for sys_tenant_package
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant_package`;
CREATE TABLE `sys_tenant_package`  (
  `package_id` bigint NOT NULL COMMENT '租户套餐id',
  `package_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '套餐名称',
  `menu_ids` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联菜单id',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`package_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '租户套餐表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_tenant_package
-- ----------------------------
INSERT INTO `sys_tenant_package` VALUES (1974307852467793921, '主要套餐', '1,100,1001,1002,1003,1004,1005,1006,1007,131,101,1008,1009,1010,1011,1012,130,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,132,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,1050,118,1600,1601,1602,1603,1620,1621,1622,1623,133,123,1061,1062,1063,1064,1065,1972195018522955778,1972195267572338690,1972195267572338691,1972195267572338692,1972195267572338693,1972195267572338694,1972195267572338695,1972209543498375170,1972209543498375171,1972209543498375172,1972209543498375173,1972209543498375174,1972209543498375175,1973928478631473154,1973928478631473155,1973928478631473156,1973928478631473157,1973928478631473158,1973928478631473159,2,109,1046,1047,1048,113,117,120,3,115,1055,1056,1058,1057,1059,1060,116,4,5,1500,1501,1502,1503,1504,1505,1506,1507,1508,1509,1510,1511', '', 1, '0', '0', 103, 1, '2025-10-04 10:57:28', 1, '2025-10-04 10:57:28');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'sys_user' COMMENT '用户类型（sys_user系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` bigint NULL DEFAULT NULL COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, '000000', 103, 'admin', '疯狂的狮子Li', 'sys_user', 'crazyLionLi@163.com', '15888888888', '1', NULL, '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '0:0:0:0:0:0:0:1', '2025-10-04 13:42:29', 103, 1, '2025-09-28 14:31:55', -1, '2025-10-04 13:42:29', '管理员');
INSERT INTO `sys_user` VALUES (3, '000000', 108, 'test', '本部门及以下 密码666666', 'sys_user', '', '', '0', NULL, '$2a$10$b8yUzN0C71sbz.PhNOCgJe.Tu1yWC3RNrTyjSQ8p1W0.aaUXUJ.Ne', '0', '1', '127.0.0.1', '2025-09-28 14:31:55', 103, 1, '2025-09-28 14:31:55', 1, '2025-10-04 10:54:01', NULL);
INSERT INTO `sys_user` VALUES (4, '000000', 102, 'test1', '仅本人 密码666666', 'sys_user', '', '', '0', NULL, '$2a$10$b8yUzN0C71sbz.PhNOCgJe.Tu1yWC3RNrTyjSQ8p1W0.aaUXUJ.Ne', '0', '1', '127.0.0.1', '2025-09-28 14:31:55', 103, 1, '2025-09-28 14:31:55', 1, '2025-10-04 10:53:58', NULL);
INSERT INTO `sys_user` VALUES (1974314859711131649, '000000', 1974312589770584066, '21admin', '21级管理员', 'sys_user', '', '', '0', NULL, '$2a$10$k6e2Nso2MiHUJaGxBquukePc8ERrZFE/TL6F3kWYcs3fN1Q0Ya9y2', '0', '0', '0:0:0:0:0:0:0:1', '2025-10-04 11:28:16', 103, 1, '2025-10-04 11:25:18', 1974314859711131649, '2025-10-04 11:28:26', '');
INSERT INTO `sys_user` VALUES (1974315974963982338, '000000', 1974312557780627457, '22admin', '22级管理员', 'sys_user', '', '', '0', NULL, '$2a$10$fdGO5Hy70DJSUJ0Pwv8fceDZXYofJzGBNxO5tqNSDxlx7y0a0MF.u', '0', '0', '', NULL, 103, 1, '2025-10-04 11:29:44', 1, '2025-10-04 11:29:44', '');
INSERT INTO `sys_user` VALUES (1974317845929750530, '000000', 1974312677473480706, 'zhangwei', '张伟', 'sys_user', 'zhangwei@example.com', '13811223344', '0', NULL, '$2a$10$DzuvTGEnWo7thhwzojllyOlwFUmp8sL1Mawye9QCeScpQEXbP98RG', '0', '0', '', NULL, NULL, 1, '2025-10-04 11:37:10', NULL, '2025-10-04 11:37:10', NULL);
INSERT INTO `sys_user` VALUES (1974317845992665090, '000000', 1974312677473480706, 'wangjing', '王静', 'sys_user', 'wangjing@example.com', '13922334455', '1', NULL, '$2a$10$DzuvTGEnWo7thhwzojllyOlwFUmp8sL1Mawye9QCeScpQEXbP98RG', '0', '0', '', NULL, NULL, 1, '2025-10-04 11:37:10', NULL, '2025-10-04 11:37:10', NULL);
INSERT INTO `sys_user` VALUES (1974317846055579649, '000000', 1974312677473480706, 'liqiang', '李强', 'sys_user', 'liqiang@example.com', '13733445566', '0', NULL, '$2a$10$DzuvTGEnWo7thhwzojllyOlwFUmp8sL1Mawye9QCeScpQEXbP98RG', '0', '0', '', NULL, NULL, 1, '2025-10-04 11:37:10', NULL, '2025-10-04 11:37:10', NULL);
INSERT INTO `sys_user` VALUES (1974317846055579650, '000000', 1974312677473480706, 'chenyan', '陈艳', 'sys_user', 'chenyan@example.com', '13644556677', '1', NULL, '$2a$10$DzuvTGEnWo7thhwzojllyOlwFUmp8sL1Mawye9QCeScpQEXbP98RG', '0', '0', '', NULL, NULL, 1, '2025-10-04 11:37:10', NULL, '2025-10-04 11:37:10', NULL);
INSERT INTO `sys_user` VALUES (1974317846122688514, '000000', 1974312677473480706, 'liuyang', '刘洋', 'sys_user', 'liuyang@example.com', '13555667788', '0', NULL, '$2a$10$DzuvTGEnWo7thhwzojllyOlwFUmp8sL1Mawye9QCeScpQEXbP98RG', '0', '0', '', NULL, NULL, 1, '2025-10-04 11:37:10', NULL, '2025-10-04 11:37:10', NULL);
INSERT INTO `sys_user` VALUES (1974317846189797378, '000000', 1974312677473480706, 'zhaomin', '赵敏', 'sys_user', 'zhaomin@example.com', '15866778899', '1', NULL, '$2a$10$DzuvTGEnWo7thhwzojllyOlwFUmp8sL1Mawye9QCeScpQEXbP98RG', '0', '0', '', NULL, NULL, 1, '2025-10-04 11:37:10', NULL, '2025-10-04 11:37:10', NULL);
INSERT INTO `sys_user` VALUES (1974317846189797379, '000000', 1974312677473480706, 'zhoujie', '周杰', 'sys_user', 'zhoujie@example.com', '15977889900', '0', NULL, '$2a$10$DzuvTGEnWo7thhwzojllyOlwFUmp8sL1Mawye9QCeScpQEXbP98RG', '0', '0', '', NULL, NULL, 1, '2025-10-04 11:37:10', NULL, '2025-10-04 11:37:10', NULL);
INSERT INTO `sys_user` VALUES (1974317846252711938, '000000', 1974312677473480706, 'wulei', '吴磊', 'sys_user', 'wulei@example.com', '18688990011', '0', NULL, '$2a$10$DzuvTGEnWo7thhwzojllyOlwFUmp8sL1Mawye9QCeScpQEXbP98RG', '0', '0', '', NULL, NULL, 1, '2025-10-04 11:37:10', NULL, '2025-10-04 11:37:10', NULL);
INSERT INTO `sys_user` VALUES (1974317846315626497, '000000', 1974312677473480706, 'sunna', '孙娜', 'sys_user', 'sunna@example.com', '18599001122', '1', NULL, '$2a$10$DzuvTGEnWo7thhwzojllyOlwFUmp8sL1Mawye9QCeScpQEXbP98RG', '0', '0', '', NULL, NULL, 1, '2025-10-04 11:37:10', NULL, '2025-10-04 11:37:10', NULL);
INSERT INTO `sys_user` VALUES (1974317846315626498, '000000', 1974312677473480706, 'zhengtao', '郑涛', 'sys_user', 'zhengtao@example.com', '13400112233', '0', NULL, '$2a$10$DzuvTGEnWo7thhwzojllyOlwFUmp8sL1Mawye9QCeScpQEXbP98RG', '0', '0', '', NULL, NULL, 1, '2025-10-04 11:37:10', NULL, '2025-10-04 11:37:10', NULL);
INSERT INTO `sys_user` VALUES (1974317846382735361, '000000', 1974312677473480706, 'malin', '马琳', 'sys_user', 'malin@example.com', '13311223344', '1', NULL, '$2a$10$DzuvTGEnWo7thhwzojllyOlwFUmp8sL1Mawye9QCeScpQEXbP98RG', '0', '0', '', NULL, NULL, 1, '2025-10-04 11:37:10', NULL, '2025-10-04 11:37:10', NULL);
INSERT INTO `sys_user` VALUES (1974317846382735362, '000000', 1974312677473480706, 'caoyong', '曹勇', 'sys_user', 'caoyong@example.com', '15322334455', '0', NULL, '$2a$10$DzuvTGEnWo7thhwzojllyOlwFUmp8sL1Mawye9QCeScpQEXbP98RG', '0', '0', '', NULL, NULL, 1, '2025-10-04 11:37:10', NULL, '2025-10-04 11:37:10', NULL);
INSERT INTO `sys_user` VALUES (1974317846449844226, '000000', 1974312677473480706, 'yuanli', '袁丽', 'sys_user', 'yuanli@example.com', '15133445566', '1', NULL, '$2a$10$DzuvTGEnWo7thhwzojllyOlwFUmp8sL1Mawye9QCeScpQEXbP98RG', '0', '0', '', NULL, NULL, 1, '2025-10-04 11:37:10', NULL, '2025-10-04 11:37:10', NULL);
INSERT INTO `sys_user` VALUES (1974317846512758786, '000000', 1974312677473480706, 'jiangping', '蒋平', 'sys_user', 'jiangping@example.com', '18844556677', '0', NULL, '$2a$10$DzuvTGEnWo7thhwzojllyOlwFUmp8sL1Mawye9QCeScpQEXbP98RG', '0', '0', '', NULL, NULL, 1, '2025-10-04 11:37:10', NULL, '2025-10-04 11:37:10', NULL);
INSERT INTO `sys_user` VALUES (1974317846584061954, '000000', 1974312656841699330, 'dengfang', '邓芳', 'sys_user', 'dengfang@example.com', '18755667788', '1', NULL, '$2a$10$DzuvTGEnWo7thhwzojllyOlwFUmp8sL1Mawye9QCeScpQEXbP98RG', '0', '0', '', NULL, NULL, 1, '2025-10-04 11:37:10', NULL, '2025-10-04 11:37:10', NULL);
INSERT INTO `sys_user` VALUES (1974317846584061955, '000000', 1974312656841699330, 'hanlei', '韩磊', 'sys_user', 'hanlei@example.com', '17766778899', '0', NULL, '$2a$10$DzuvTGEnWo7thhwzojllyOlwFUmp8sL1Mawye9QCeScpQEXbP98RG', '0', '0', '', NULL, NULL, 1, '2025-10-04 11:37:10', NULL, '2025-10-04 11:37:10', NULL);
INSERT INTO `sys_user` VALUES (1974317846646976514, '000000', 1974312656841699330, 'tangyan', '唐燕', 'sys_user', 'tangyan@example.com', '17677889900', '1', NULL, '$2a$10$DzuvTGEnWo7thhwzojllyOlwFUmp8sL1Mawye9QCeScpQEXbP98RG', '0', '0', '', NULL, NULL, 1, '2025-10-04 11:37:10', NULL, '2025-10-04 11:37:10', NULL);
INSERT INTO `sys_user` VALUES (1974317846714085377, '000000', 1974312656841699330, 'fengchao', '冯超', 'sys_user', 'fengchao@example.com', '19988990011', '0', NULL, '$2a$10$DzuvTGEnWo7thhwzojllyOlwFUmp8sL1Mawye9QCeScpQEXbP98RG', '0', '0', '', NULL, NULL, 1, '2025-10-04 11:37:10', NULL, '2025-10-04 11:37:10', NULL);
INSERT INTO `sys_user` VALUES (1974317846714085378, '000000', 1974312656841699330, 'songjia', '宋佳', 'sys_user', 'songjia@example.com', '19899001122', '1', NULL, '$2a$10$DzuvTGEnWo7thhwzojllyOlwFUmp8sL1Mawye9QCeScpQEXbP98RG', '0', '0', '', NULL, NULL, 1, '2025-10-04 11:37:10', NULL, '2025-10-04 11:37:10', NULL);
INSERT INTO `sys_user` VALUES (1974317846781194241, '000000', 1974312656841699330, 'xujun', '许军', 'sys_user', 'xujun@example.com', '13200112233', '0', NULL, '$2a$10$DzuvTGEnWo7thhwzojllyOlwFUmp8sL1Mawye9QCeScpQEXbP98RG', '0', '0', '', NULL, NULL, 1, '2025-10-04 11:37:10', NULL, '2025-10-04 11:37:10', NULL);
INSERT INTO `sys_user` VALUES (1974317846781194242, '000000', 1974312656841699330, 'gaoxiang', '高翔', 'sys_user', 'gaoxiang@example.com', '13112341234', '0', NULL, '$2a$10$DzuvTGEnWo7thhwzojllyOlwFUmp8sL1Mawye9QCeScpQEXbP98RG', '0', '0', '', NULL, NULL, 1, '2025-10-04 11:37:10', NULL, '2025-10-04 11:37:10', NULL);
INSERT INTO `sys_user` VALUES (1974317846844108801, '000000', 1974312656841699330, 'luoying', '罗英', 'sys_user', 'luoying@example.com', '15523452345', '1', NULL, '$2a$10$DzuvTGEnWo7thhwzojllyOlwFUmp8sL1Mawye9QCeScpQEXbP98RG', '0', '0', '', NULL, NULL, 1, '2025-10-04 11:37:10', NULL, '2025-10-04 11:37:10', NULL);
INSERT INTO `sys_user` VALUES (1974317846911217666, '000000', 1974312656841699330, 'pengfei', '彭飞', 'sys_user', 'pengfei@example.com', '18934563456', '0', NULL, '$2a$10$DzuvTGEnWo7thhwzojllyOlwFUmp8sL1Mawye9QCeScpQEXbP98RG', '0', '0', '', NULL, NULL, 1, '2025-10-04 11:37:10', NULL, '2025-10-04 11:37:10', NULL);
INSERT INTO `sys_user` VALUES (1974317846911217667, '000000', 1974312656841699330, 'huangli', '黄丽', 'sys_user', 'huangli@example.com', '18045674567', '1', NULL, '$2a$10$DzuvTGEnWo7thhwzojllyOlwFUmp8sL1Mawye9QCeScpQEXbP98RG', '0', '0', '', NULL, NULL, 1, '2025-10-04 11:37:10', NULL, '2025-10-04 11:37:10', NULL);
INSERT INTO `sys_user` VALUES (1974317846974132226, '000000', 1974312656841699330, 'guohao', '郭昊', 'sys_user', 'guohao@example.com', '17856785678', '0', NULL, '$2a$10$DzuvTGEnWo7thhwzojllyOlwFUmp8sL1Mawye9QCeScpQEXbP98RG', '0', '0', '', NULL, NULL, 1, '2025-10-04 11:37:10', NULL, '2025-10-04 11:37:10', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (1974308937878171650, 1974308937555210242);
INSERT INTO `sys_user_role` VALUES (1974314859711131649, 3);
INSERT INTO `sys_user_role` VALUES (1974315974963982338, 3);

-- ----------------------------
-- Table structure for test_demo
-- ----------------------------
DROP TABLE IF EXISTS `test_demo`;
CREATE TABLE `test_demo`  (
  `id` bigint NOT NULL COMMENT '主键',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门id',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `order_num` int NULL DEFAULT 0 COMMENT '排序号',
  `test_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'key键',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '值',
  `version` int NULL DEFAULT 0 COMMENT '版本',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `del_flag` int NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '测试单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_demo
-- ----------------------------
INSERT INTO `test_demo` VALUES (1, '000000', 102, 4, 1, '测试数据权限', '测试', 0, 103, '2025-09-28 14:31:57', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (2, '000000', 102, 3, 2, '子节点1', '111', 0, 103, '2025-09-28 14:31:57', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (3, '000000', 102, 3, 3, '子节点2', '222', 0, 103, '2025-09-28 14:31:57', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (4, '000000', 108, 4, 4, '测试数据', 'demo', 0, 103, '2025-09-28 14:31:57', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (5, '000000', 108, 3, 13, '子节点11', '1111', 0, 103, '2025-09-28 14:31:57', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (6, '000000', 108, 3, 12, '子节点22', '2222', 0, 103, '2025-09-28 14:31:57', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (7, '000000', 108, 3, 11, '子节点33', '3333', 0, 103, '2025-09-28 14:31:57', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (8, '000000', 108, 3, 10, '子节点44', '4444', 0, 103, '2025-09-28 14:31:57', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (9, '000000', 108, 3, 9, '子节点55', '5555', 0, 103, '2025-09-28 14:31:57', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (10, '000000', 108, 3, 8, '子节点66', '6666', 0, 103, '2025-09-28 14:31:57', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (11, '000000', 108, 3, 7, '子节点77', '7777', 0, 103, '2025-09-28 14:31:57', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (12, '000000', 108, 3, 6, '子节点88', '8888', 0, 103, '2025-09-28 14:31:57', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (13, '000000', 108, 3, 5, '子节点99', '9999', 0, 103, '2025-09-28 14:31:57', 1, NULL, NULL, 0);

-- ----------------------------
-- Table structure for test_leave
-- ----------------------------
DROP TABLE IF EXISTS `test_leave`;
CREATE TABLE `test_leave`  (
  `id` bigint NOT NULL COMMENT 'id',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `apply_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '申请编号',
  `leave_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请假类型',
  `start_date` datetime NOT NULL COMMENT '开始时间',
  `end_date` datetime NOT NULL COMMENT '结束时间',
  `leave_days` int NOT NULL COMMENT '请假天数',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请假原因',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '请假申请表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_leave
-- ----------------------------

-- ----------------------------
-- Table structure for test_tree
-- ----------------------------
DROP TABLE IF EXISTS `test_tree`;
CREATE TABLE `test_tree`  (
  `id` bigint NOT NULL COMMENT '主键',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父id',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门id',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `tree_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '值',
  `version` int NULL DEFAULT 0 COMMENT '版本',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `del_flag` int NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '测试树表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_tree
-- ----------------------------
INSERT INTO `test_tree` VALUES (1, '000000', 0, 102, 4, '测试数据权限', 0, 103, '2025-09-28 14:31:57', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (2, '000000', 1, 102, 3, '子节点1', 0, 103, '2025-09-28 14:31:57', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (3, '000000', 2, 102, 3, '子节点2', 0, 103, '2025-09-28 14:31:57', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (4, '000000', 0, 108, 4, '测试树1', 0, 103, '2025-09-28 14:31:57', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (5, '000000', 4, 108, 3, '子节点11', 0, 103, '2025-09-28 14:31:57', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (6, '000000', 4, 108, 3, '子节点22', 0, 103, '2025-09-28 14:31:57', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (7, '000000', 4, 108, 3, '子节点33', 0, 103, '2025-09-28 14:31:57', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (8, '000000', 5, 108, 3, '子节点44', 0, 103, '2025-09-28 14:31:57', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (9, '000000', 6, 108, 3, '子节点55', 0, 103, '2025-09-28 14:31:57', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (10, '000000', 7, 108, 3, '子节点66', 0, 103, '2025-09-28 14:31:57', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (11, '000000', 7, 108, 3, '子节点77', 0, 103, '2025-09-28 14:31:57', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (12, '000000', 10, 108, 3, '子节点88', 0, 103, '2025-09-28 14:31:57', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (13, '000000', 10, 108, 3, '子节点99', 0, 103, '2025-09-28 14:31:57', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (1972217838460162050, '000000', 0, 55, 55, '55', 0, 103, '2025-09-28 16:32:29', 1, '2025-09-28 16:32:29', 1, 0);
INSERT INTO `test_tree` VALUES (1972217948476755970, '000000', 1972217838460162050, 1, 2, '3', 0, 103, '2025-09-28 16:32:56', 1, '2025-09-28 16:32:56', 1, 0);

SET FOREIGN_KEY_CHECKS = 1;

-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: blog
-- ------------------------------------------------------
-- Server version	5.5.62

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `articleid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `userid` int(10) unsigned NOT NULL COMMENT '用户id',
  `title` tinytext COMMENT '文章标题',
  `type` varchar(10) DEFAULT NULL COMMENT '文章类型',
  `content` text COMMENT '文章内容',
  `contentimage` varchar(200) DEFAULT NULL COMMENT '文章图片',
  `commentcount` int(10) DEFAULT '0' COMMENT '文章评论数',
  `publictime` varchar(20) NOT NULL COMMENT '发表时间',
  `articlestate` tinyint(4) DEFAULT '1' COMMENT '文章状态：1-通过；0-不通过',
  `url` varchar(50) DEFAULT NULL COMMENT '静态页面地址',
  PRIMARY KEY (`articleid`),
  KEY `userid` (`userid`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (4,35,'杨幂刘恺威离婚，公公一直保护儿媳到最后，他才是受伤最重的人！','娱乐','不管杨幂和刘恺威之间到底有什么过节，既然双方已经做出了决定，过去的事情大家还是理性吃瓜，感情毕竟是两个人之间的事，双方之间的恩怨随着离婚声明的公布也应该落下帷幕了。只是在这场离婚大战里，有一个人倒是值得大家关注，就是在离婚声明发布2天前，还在接受采访谈及杨幂的公公，刘恺威的父亲刘丹，其实从刘丹的回答里也不难看出，杨幂的这场婚姻早就或多或少有些“问题”了，可是刘丹也一直力挺杨幂到了最后一刻，对于儿媳妇的疼爱也是显而易见的。','static\\upload\\2\\25\\1551063261411534527.jpg',0,'2018/12/22 11:29:43',1,'template\\html\\article_4.html'),(7,35,'教父','感叹','<p>我最爱的电影是《教父》。在这一点上，我可以同许多男人达成共识。马龙的表演实在令人心折。在少年时代，我深深着迷，甚至模仿他那含混不清的说话方式，却并不成功。一个平凡的小人物，喊破了嗓子也找不到认真的听众，那个口齿不清的教父，却没人敢忽略他说出的每一个字。他总是面无表情，背后却潜藏着不可忽视的力量——一种优雅的狂暴、平静的残忍、化妆的邪恶，如同毒蛇与猛虎的混合体。他轻蔑地说，“让我开一个你无法拒绝的条件”——这是男人的威权；他温和地说：“不经常与家人呆在一起的男人，永远也成不了真正的男人。”——这是男人的价值。而事实不是这样的。那个真实的教父，生活中的马龙·白兰度，是个十足的混蛋，他的家族则是一窝混蛋。&nbsp;<br/></p><p><br/></p><p>当然，他们是迷人的混蛋，令人同情的混蛋，应该被宽恕的混蛋。&nbsp;</p><p><br/></p><p>白兰度家族中，女人个个红杏出墙，男人个个酗酒成性，且盛产自杀者。小马龙的童年在阴郁中度过，父亲很少回家，母亲终日喝得酩酊大醉，与一个又一个男人发生关系。小马龙生活中惟一的温暖来自一个友善的同性恋教士。这使得他成为一个双性恋者，因为同性恋行为被军校开除。&nbsp;</p><p><br/></p><p>为逃避这一切，他来到纽约，跻身百老汇，阴郁生活赐予他的狂暴气质令他成功出演《欲望号街车》，名声鹊起。“仿佛一觉醒来坐在糖果堆上”，他不能承受这种名气，感觉自己是个骗子，不得不求助于心理医生。为了帮助他战胜焦虑，医生甚至为他宣读希特勒的讲演词。&nbsp;</p><p><br/></p><p style=\"white-space: normal;\">版权归作者所有，任何形式转载请联系作者。</p><p style=\"white-space: normal;\">作者：加肥猫（来自豆瓣）</p><p style=\"white-space: normal;\">来源：https://movie.douban.com/review/1147562/</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\"><br/></p><p><br/></p>','static\\upload\\12\\4\\5c9852f1-ede2-48aa-8ead-665c4be22187_设计 - 37.jpg',0,'2019/01/02 11:05:09',0,'template\\html\\article_7.html'),(8,36,'查看话题 ＞ 打破界限，这是史上最不一样的蜘蛛侠电影！','电影','作为21世纪银幕形象更新换代最多的超级英雄，蜘蛛侠系列的不断重启对粉丝而言早已经是家常便饭。不过这次，他们的画风可谓全面刷新...\r\n\r\n谈到蜘蛛侠的人设，最经典的莫过于托比·马奎尔在老版三部曲中设定的形象。在成长过程中，他不断地陷入两难处境和选择之中，成为一位带着悲情感的英雄。“我们都是罪人，没有真正的对错之分”——这句台词，就是对当年蜘蛛侠的最佳写照。\r\n\r\n加菲版的“超凡系列”则在老版的基础上，有意将人设往更娱乐化的方向上靠，却没有获得好的效果。随着漫威MCU系列发展得如火如荼，风格上只能算中规中矩的“超凡系列”在遗憾中落幕，成为过去时。这时候，索尼终于坐不住了，不仅联合漫威共同出品“荷兰弟”汤姆·霍兰德版的蜘蛛侠，而且还制作了这部全新的蜘蛛侠动画。\r\n\r\n如果你觉得这些年来，蜘蛛侠电影已经被重启过太多次；那么，这部一次性“同框打包”丢出了六个蜘蛛侠的《平行宇宙》，可需要你做好心理准备了——它称得上是从头到尾全程炸裂，简直都要从银幕上炸出来。','static\\upload\\2\\25\\1551067511596视觉 - 53.jpg',2,'2018/12/27 05:23:31',1,'template\\html\\article_8.html'),(9,36,'2016 年里约奥运会，joseph schooling 击败菲尔普斯，拿下了新加坡建国以来的首个金牌','电影','<p>\r\n					版权归作者所有，任何形式转载请联系作者。\r\n作者：彩蛋君KL（来自豆瓣）\r\n来源：https://movie.douban.com/review/9844335/\r\n\r\n\r\n年末压轴漫威大片《蜘蛛侠：平行宇宙》终于到来！不知道大家看过后是否对这部漫画化电影感到相当惊艳呢？影片中埋藏了不少对漫画原作和创作者的彩蛋，喜欢蜘蛛侠和漫威的观众一定会大饱眼福。今天彩蛋君就来给大家整理出电影里的彩蛋与秘密，让各位能够更深入了解其中的魅力与意义。				</p>','static\\upload\\2\\25\\1551067511593视觉 - 3.jpg',0,'2018/12/30 10:08:31',0,'template\\html\\article_9.html'),(10,36,'我是金并，我有一句mmp我现在就要说。','电影','版权归作者所有，任何形式转载请联系作者。\r\n作者：彩蛋君KL（来自豆瓣）\r\n来源：https://movie.douban.com/review\r\n年末压轴漫威大片《蜘蛛侠：平行宇宙》终于到来！不知道大家看过后是否对这部漫画化电影感到相当惊艳呢？影片中埋藏了不少对漫画原作和创作者的彩蛋，喜欢蜘蛛侠和漫威的观众一定会大饱眼福。今天彩蛋君就来给大家整理出电影里的彩蛋与秘密，让各位能够更深入了解其中的魅力与意义。','static\\upload\\2\\25\\15510633126104.jpg',0,'2018/12/27 05:28:45',0,'template\\html\\article_10.html'),(11,35,'《网络迷踪》中蕴含的魔鬼细节','电影','Margot的情感线索\r\n《网络迷踪》绝不仅仅是一部侦探片，Margot的情感线索在这部电影中起到了至关重要的作用。\r\n\r\n影片的前5分钟铺垫了Kim一家的背景。从最初WindowsXP的开机画面，建立Margot的个人用户，一家三口幸福的照片和视频一一展现。而直到2015年12月6日，母亲Pamela Kim因癌症复发去世，Margot和David的生活也蒙上了一层阴影。而就在这短短的5分钟快闪画面中，其实也隐含着两个关键的细节。','static\\upload\\2\\25\\1551070256144视觉 - 91.jpg',0,'2018/12/27 11:08:44',0,'template\\html\\article_11.html'),(12,36,'十年·肖申克的救赎','电影','距离斯蒂芬·金（Stephen King）和德拉邦特（Frank Darabont）们缔造这部伟大的作品已经有十年了。我知道美好的东西想必大家都能感受，但是很抱歉，我的聒噪仍将一如既往。\r\n\r\n在我眼里，肖申克的救赎与信念、自由和友谊有关。\r\n\r\n［1］信 念\r\n\r\n瑞德（Red）说，希望是危险的东西，是精神苦闷的根源。重重挤压之下的牢狱里呆了三十年的他的确有资格这么说。因为从进来的那一天起，狱长就说过，「把灵魂交给上帝，把身体交给我。」除了他能弄来的香烟和印着裸女的扑克牌，任何其他异动在这个黑暗的高墙之内似乎都无法生长。\r\n\r\n然而安迪（Andy）告诉他，「记住，希望是好事——甚至也许是人间至善。而美好的事永不消失。」\r\n\r\n所以安迪能够用二十年挖开瑞德认为六百年都无法凿穿的隧洞。当他终于爬出五百码恶臭的污水管道，站在瓢泼大雨中情不自禁的时候，我们仿佛看到信念刺穿重重黑幕，在暗夜中打了一道夺目霹雳。亮光之下，我们懦弱的灵魂纷纷在安迪张开的双臂下现形，并且颤抖。\r\n\r\n庸常生活里的我们，似乎已经习惯了按部就班，习惯了先说「那不可能」，习惯了没有奇迹，习惯了，习惯了。可是正如《飞越疯人院》（One Flew over the Cuckcoo’s Nest）中说的那样，「不试试，怎么知道呢？」\r\n\r\n试着留住一些信念，在它们丧失殆尽之前。它们也许无法最终实现，也许无法让我们更有意义的活着——甚至对于我自己而言，它们只会愈加带给我来更多的虚无感。然而我知道我有多需要这样的虚伪与自欺，因为你可以说我在做梦，但我不会是仅有的一个。\r\n\r\n——我们已经看到监狱长打开藏有安迪凿石锤的《圣经》时，翻至那页正是《出埃及记》。这个章节详细描述了犹太教徒逃离埃及的过程。\r\n版权归作者所有，任何形式转载请联系作者。\r\n作者：大头绿豆（来自豆瓣）\r\n来源：https://movie.douban.com/review/1000369/\r\n\r\n','static\\upload\\2\\25\\1551067511593视觉 - 3.jpg',0,'2018/12/28 07:47:56',1,'template\\html\\article_12.html'),(13,36,'闻香识女人','电影','一般而言，电影续集总不如第一部精彩，不过“教父2”却是例外，这大部分归功于帕西诺的个人魅力，他不高不帅也无腱子肉，全靠眼神，甚至比白兰度扮演的第一代教父更具震慑力。“教父1”中同样也有帕西诺，但由于剧本关系一直被白兰度的光芒所掩盖，除了帕西诺在餐厅用枪干掉对手那一场，是金子总要发光，在“教父2”中，帕西诺彻底征服了我，尽管他没有凭借此片获得奥斯卡小金人。当然在“教父2”中还有位牛人，德尼罗，他演绎第一代教父的青年时代，也很棒，惟妙惟肖模仿白兰度的嗓音和神态令人叫绝，揽得奥斯卡最佳男配角，至于后来他主演的“美国往事”更是颠峰之作，不过今天不打算讨论他。\r\n \r\n    如果认为帕西诺的水平仅局限于用眼神来征服观众，那么就大错了，在“闻香识女人”中，帕西诺扮演一名瞎眼的退役军官，而正是这个角色反而令他问鼎小金人。此片几乎是帕西诺的一场个人秀，其他所有的配角均可忽略不计。名字中有女人，可故事完全和女人没关系，纯粹是两个男人之间的故事。我平时看电影有些没心没肺，总是让导演失望，该哭的时候笑，该笑的时候叫，但看完“闻香识女人”后还是觉得挺感动。一方面，故事不错，另一方面，帕西诺的确没得说。\r\n ','uploads/20181228/30c5063508cef0a15a56a40a9ddc236b.jpg',0,'2018/12/28 07:53:11',1,'template\\html\\article_13.html'),(14,37,'楚门的世界','电影','优雅的上帝克里斯多夫，他导演出伟大的戏剧，让你，一个叫做楚门的人，暴露在五百架不停转动的摄影机里，日日夜夜。你的出生，游戏，你掉落的乳牙、你的恋爱，你在电话里喋喋不休的拉拢客户，你假装不经意地瞄一眼女同事的胸部，一个男人的出生和成长，历经多少冷清、惆怅、快乐、疯狂、欲望的生长与消散、理想的破灭与重生，这一切我们全看到了，而你却浑然不觉。恭喜你，电视宝贝、饭后甜点、荧屏里的爆米花、或者我也像克里斯多夫那样管你叫The Trueman Show演员，你是我们的Super star，却不是Truman的Truman。\r\n\r\n生命中有多少这样的时刻，可以像你现在这样荣耀，你驾驶小船，漂流在一望无边的蓝色彼岸，海浪拍打着你的脸，甜蜜而伤人，你手里拿着初恋女友的照片，不想停留，只要远行。去寻找另一个世界里的爱人，或是世界上另一个你。亿万观众为你鼓掌欢呼，消费着你英雄般的逃亡和挣脱。电影放映厅里有个女孩曾跟我说过你闪耀的一刻，胜过无数人平庸的一生。我对她说：“有些狗屎我永远不懂：”','static\\upload\\12\\4\\5c9852f1-ede2-48aa-8ead-665c4be22187_设计 - 37.jpg',0,'2018/12/28 08:49:50',1,'template\\html\\article_14.html'),(15,37,'辛德勒先生，我也想在你的墓碑上放上一块石头','电影','<span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\">对这部磅礴伟大的电影，实在不敢妄加评论。可是，又觉得对于这样一直想看却一直不敢看的电影，如果不写点什么，也实在难以告慰自己粗鄙又真挚的感情。</span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\" />\r\n<br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\" />\r\n<span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\">哎，好生纠结。一如辛德勒先生的每一次抉择。又很庆幸自己是在这个时候才看的这部电影，小一些时，微薄的耐性一定无法让我对着黑白片花上3个多小时，一定会干出中途睡着、吃零食等挫事来分散注意力吧？</span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\" />\r\n<br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\" />\r\n<span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\">一直以来对犹太民族都有着难以言说的好感。他们的聪明勤奋以及在世界各个领域所取得的成就为世人瞩目，甚至连他们的面容我都喜欢，尤其是女生，多半有着挺直的鼻梁，以及深邃的大眼睛，眼里总是闪烁温柔而智慧的光芒。</span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\" />\r\n<br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\" />\r\n<span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\">这样的一个民族，却一直经历着磨难。一直到现在，以色列不曾得到过真正的和平，战火蔓延，二战期间，更是经历了令人发指的疯狂屠杀，以希特勒为首的纳粹政权，将这个充满智慧、善于创造财富的民族列为劣等民族，赶尽杀绝成为最通用的政策。一个个集中营林立，枪声不断，每一声枪响，都是一个无辜的犹太人的倒下，有强壮的男人，有清秀的女人，也有稚嫩的孩童。</span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\" />\r\n<br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\" />\r\n<span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\">即使对这段历史有不算太详实的记忆，看《辛德勒的名单》时，还是一阵阵的揪心。力求还原于真实的一帧帧影像，让我只觉影片持续时间过长，实际上对于那漫长屈辱的屠杀史而言，</span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\" />\r\n<span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\">三个多小时不过是沧海一粟的渺小吧？</span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\" />\r\n<br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\" />\r\n<span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\">即便如此，还是深深折服。辛德勒先生的拯救行为，犹太人的顽强、乐观、聪明等美好秉性，纳粹军官的残忍，历历在目，犹如乘坐时光机，回到那段令人不忍目睹的黑暗年代。</span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\" />','static\\upload\\2\\25\\1551067511596视觉 - 53.jpg',0,'2018/12/30 02:42:52',1,'template\\html\\article_15.html'),(16,36,'国家金牌意识的觉醒和真实的印度妇女地位','电影','<p>2016 年里约奥运会，joseph schooling 击败菲尔普斯，拿下了新加坡建国以来的首个金牌。在我们眼里，奥运金牌早已不是什么稀罕物，而在只有五百万人口的弹丸新加坡，Schooling就是国家英雄一般。</p><p><br/></p><p>回国后，新加坡给他安排一场庆祝胜利的游行。Schooling站在敞篷双层巴士的最上层，巴士载着他缓缓开过新加坡的一条条主干道。街道两旁站满了翘首期盼的民众，巴士开过的时候，很多人还一直追着巴士跑。这种国宝级别的待遇和关注度，我在新加坡只看过一次，那就是2015年李光耀去世。李光耀的灵柩同样缓缓地经过了一条条的主干道，街边一样满满的人群注目着。只不过上次是目送一个英雄的离开。这次是迎接一个英雄的到来。</p><p><br/></p><p>Schooling的夺金究竟对这个国家产生了多大的影响？首先，它让新加坡人民跟过节一样欢欣了好久。其次，据说每个游泳馆的少年游泳班爆满，尤其是蝶泳。因为Schooling拿下的是100米蝶泳的冠军。论偶像的力量！最重要的，一个声音，一种意识悄然地在新加坡民众之间萌发出来，那就是：新加坡人也可以拿奥运冠军！突然间，大家就觉得金牌并不是那么遥不可及了。但是“”我（们）也可以“”这个声音，这个意识让新加坡人足足等了51年。</p><p><br/></p><p>新加坡这么富足的一个国家，运动方面的投资从来都是不差钱。为了激励运动员夺奖牌，心甘情愿地拿钱去砸运动员们。2016年里约奥运会，中国奥运金牌据说只有20万人民币的奖金。而2008年奥运会，依靠转新加坡国籍的中国乒乓球运动员，新加坡拿下了银牌，当时就给运动员接近四百万人民币的奖金。当然，这个奖金要跟教练分点。但就算是在这样砸重金的激励制度下，新加坡在2016年之前都没出现过真正由新加坡人夺牌的成绩。</p><p><br/></p><p>奥运种子选手都是万里挑一，想想新加坡的人口基数，跟中国比起来，能挑的范围也不大。但挑出来的也不会体育素质差。奥运会28项比赛。要是不擅长田径，可以玩器械；不擅长陆地的，可以玩水里的。总能找到契合自家国情和人种特点的运动进行一搏。新加坡运动史上也不乏表现出色的运动员。但对于国际比赛夺冠，关键还是大家的自信没有出来。这种长久以往的“我不可以”魔咒一直打不破，直到Schooling的出现。</p><p><br/></p>','uploads/20181230/5f0a21e2828caafac08bc33e33e700a5.jpg',1,'2018/12/30 09:06:53',1,'template\\html\\article_16.html'),(25,36,'盗梦空间','令人惊叹的导演','&nbsp;<span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\">Inception就好象是玄幻小说，你必须接受它里面的无数天马行空的设定；但是它是最好的玄幻小说，因为在它的设定下情节无懈可击。所以首先要解释片中提到的所有设定：</span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\" />\r\n<br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\" />\r\n<br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\" />\r\n<span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\">1. 首先，片中一共有六层世界。如果我们把片子中小组计划的现实世界作为参照物的话，按照做梦依次向上分别是：现实世界，第一层梦境，第二层梦境，第三层梦境，第四层梦境，limbo（迷失域）。</span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\" />\r\n<br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\" />\r\n<span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\">2. 正常人活动在现实世界，做梦的时候在第一层梦境。如果要进入第二层梦境，也就是梦里的梦，必须要服用一般性药物。在服用一般性药物的情况下，要从梦中醒来（不管是第一层还是第二层）有两种方法：第一种就是所谓的&lsquo;kick&rsquo;，也就是重力下坠的冲击。第二种就是被杀死。当然，等药物效果过期也是一种不是办法的办法。</span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\" />\r\n<br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\" />\r\n<span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\">3. 如果要进入第三层梦境，也就是梦里的梦里的梦，一般性药物就无效了，必须要加强型药物。但是加强型药物的副作用是如果在梦里被杀死不能醒来，而会进入Limbo（后面解释什么是limbo），所以只能用 Kick的方式来苏醒。</span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\" />\r\n<br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\" />\r\n<span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\">4. 所谓的Synchronize a kick （协同刺激），也就是说要在各层同时刺激才能把梦中人唤醒。比如说对于在第四层梦境活动的人需要在第一至四层同时Kick（刺激）才能使其在第一层苏醒；如果只在第三和第四层Kick（刺激）则其会在第三层苏醒；而如果中间有某层没有同时Kick（刺激），比如只在第一，第二和第四层Kick（刺激）或者只在第一和第二层Kick（刺激），则活动在第四层的梦中人不会苏醒，这也就是所谓的Miss a kick （错过刺激）。所以当片中小组计划侵入深层梦境的时候，每一层必须留人醒着负责Kick（刺激），而且用音乐的结束来协调同时Kick（刺激）的时刻。</span>','uploads/20190105/7a13d6997a484ce100eb267d9a3157ea.jpg',0,'2019/01/05 06:57:48',1,'template\\html\\article_25.html'),(26,37,'让子弹飞','电影','&nbsp;<span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\">&nbsp; &ldquo;由于对姜文过于卑躬屈膝，厚颜无耻的吹捧，该影评已被和谐。&rdquo;</span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\" />\r\n<span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\">这句是我在去看电影之前，已经准备好的影评（还是抄来的）。</span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\" />\r\n<span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;吾辈俗人，花钱去影院只图消遣。回来吹吹水，网上吐吐槽。严肃客观的评价电影于我如浮云，就是带着这么强烈的偏见去看的电影。国产片导演就那么几位。考虑到他们近年的发挥惊人地稳定， 吾辈观影前，早已选择好了态度。</span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\" />\r\n<span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;比如赵氏孤儿，陈凯歌肯定给我们带来悲剧。他就活在自己的那点小悲剧情怀里，老想拍一悲剧，还肯定又玩现了，整个一纯悲剧。我们买了电影票，聚精会神地盯着屏幕，唯恐事后骂得不够尖刻戏谑不够振聋发聩。 再比如让子弹飞， 姜文肯定给我们带来惊喜。我们买了电影票，就等着让他TMD给我们翻译翻译什么叫TMD的惊喜。 看不懂，就说这片真有深度，可惜太小众了。 看懂了，便把他当神来捧，唯恐自己的态度不够卑贱，拜倒得不够迅猛。 只恨&ldquo;愿为姜文门下走狗&rdquo;这种结构已在王小波徐文长身上用滥了。</span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\" />\r\n<span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;人总是渴求被认同。所谓&ldquo;人生得一知己，死而无憾&rdquo;，描绘的就是这种渴求被满足时的快感。人性若此，无以抗衡。这群大导演大玩家，亦不能脱俗，只是口味略有偏好。冯小刚张艺谋什么的活明白了，追求票房认同。陈凯歌自负才华，追求带点文艺腔的装B青年的认同。吾辈小装青年，层次低，为与不装B的大众拉开差距，大家紧紧抱成鸡蛋状，追求蛋内认同，人称蛋同。还有些大装青年，最爱唱反调，追求与小装们拉开差距，显得层次高，自会有人贴过来膜拜他们，叫他们大神。</span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\" />\r\n<span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姜文拍电影，也图个被认同。他的四部风格各异的电影，都有强烈的自我表达欲望。每一个片中的&ldquo;我&rdquo;，包括夏雨演的，都是他内心的部分投射。其前三部电影表现出来的选本、选角的眼光，节奏、镜头的把握，讲故事谈思想的水平等硬实力，在吾等小青年心中已然封神入圣。但姜文不满足，他追求更广阔的认同。《鬼来》被禁，《太阳》票房不佳，这些不认同的声音在姜文心里絮絮叨叨挥之不去。</span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\" />\r\n<span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\">两年多后，姜文射出来的，是经过精心构化，寻求破局的子弹。他的野心是得到同行，大众，小青年，大神和官府共同的认同。一言以蔽之：</span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\" />\r\n<span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px;\">我姜文，&ldquo;站着&rdquo;也能把钱赚了。&nbsp;</span>','static\\upload\\2\\25\\1551067511593视觉 - 3.jpg',0,'2019/01/05 06:59:03',1,'template\\html\\article_26.html'),(27,35,'哈利·波特与死亡圣器','魔法世界','<p><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">最后一次……</span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">最后一次，乔治 和弗雷德 露出调皮而又默契的笑容。同时来到这个世界，此刻却生死相隔……从今往后，“妈妈，你永远不会分不清我们了。”</span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">最后一次，卢平和唐克斯夫妇嘴角扬起安详的微笑，告诉哈利不要怕，我们永远在，always……大战开始前，两人紧紧握住了双手，直到一同倒下的那一刻，十根手指，依然紧握……</span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">最后一次，邓布利多的最后一个礼物，是用他的死换来的那块复活石……轻轻地，哈利在手中缓缓地转了三下</span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">最后一次，斯内普，透过他那“邪恶”的眼睛，望穿双眸，盯着这个爱极恨极的男孩……&quot;look at me “倾注的不只是他全生命的爱。还有他第一次脱下的，自己的伪装。而流出的眼泪，是银色的……这个世界上最勇敢的男人，留给人们最动容的一句话就是——</span><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(17, 17, 17); font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">always……</span></p>','uploads/20190106/26319a97bb3b67de25aad92dae3297b7.jpg',0,'2019/01/06 12:37:50',1,'template\\html\\article_27.html');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup`
--

DROP TABLE IF EXISTS `backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup` (
  `backupid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '数据库操作id',
  `backuptime` varchar(30) DEFAULT NULL COMMENT '操作时间',
  `filename` varchar(50) DEFAULT NULL COMMENT '备份文件名',
  `sqlUrl` tinytext COMMENT '文件路径',
  PRIMARY KEY (`backupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup`
--

LOCK TABLES `backup` WRITE;
/*!40000 ALTER TABLE `backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection`
--

DROP TABLE IF EXISTS `collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection` (
  `collectionid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏id',
  `userid` int(10) unsigned NOT NULL COMMENT '用户id',
  `articleid` int(10) unsigned NOT NULL COMMENT '微语id',
  `collecttime` varchar(20) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`collectionid`),
  KEY `userid` (`userid`),
  KEY `articleid` (`articleid`),
  CONSTRAINT `collection_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `collection_ibfk_2` FOREIGN KEY (`articleid`) REFERENCES `article` (`articleid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection`
--

LOCK TABLES `collection` WRITE;
/*!40000 ALTER TABLE `collection` DISABLE KEYS */;
INSERT INTO `collection` VALUES (13,37,4,'2019/01/02 17:47:59'),(14,37,10,'2019/01/02 17:48:03'),(15,37,12,'2019/01/02 17:48:08'),(16,35,8,'2019/01/02 19:00:28'),(22,36,12,'2019/01/06 13:44:40'),(23,36,8,'2019/01/06 13:45:02'),(24,35,10,'2019/01/06 13:56:56'),(25,37,4,'2019/01/08 08:31:02'),(26,37,12,'2019/01/08 08:31:16');
/*!40000 ALTER TABLE `collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `commentid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `userid` int(10) unsigned NOT NULL COMMENT '用户id',
  `articleid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `whisperid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '微语id',
  `commentcontent` text COMMENT '评论内容',
  `commenttime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  PRIMARY KEY (`commentid`),
  KEY `userid` (`userid`),
  KEY `comment_ibfk_2` (`articleid`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (3,35,4,0,'tiana ','2018-12-22 18:15:52'),(16,36,10,0,'我想要看蜘蛛侠','2018-12-26 21:40:37'),(17,36,4,0,'世事无常啊','2018-12-26 22:48:28'),(18,36,4,0,'世事无常啊','2018-12-26 22:50:10'),(19,36,4,0,'我是猪八戒','2018-12-26 22:51:37'),(20,36,9,0,'你的迷失人生，不需要靠平行世界的另一个强大自己来拯救。','2018-12-26 22:59:52'),(21,35,11,7,'当编剧和导演在初期就把所有线索摆在你面前的时候，你能否和主角一样拼凑起所有的线索，逻辑严密地得出真相。','2018-12-27 03:26:34'),(22,35,10,0,'一直开着上帝视角进行着复仇','2018-12-27 03:34:51'),(23,35,8,0,'松隆子让我有些意外，以前看他的悠长假期和恋爱世纪完全想象不到可以爆发出这一面','2018-12-27 03:37:46'),(24,35,8,0,'松隆子让我有些意外，以前看他的悠长假期和恋爱世纪完全想象不到可以爆发出这一面','2018-12-27 03:40:46'),(25,36,11,0,'因为两个未成年的人性本恶而走向了灭亡，虽然女主一直开着上帝视角进行着复仇，但是感觉不到一丝快乐，说犯罪的那两个孩子纯恶也不是，但是也是理智不成熟的对外没有一丝善良','2018-12-27 03:44:33'),(26,36,11,8,'六小龄童回应被黑','2018-12-27 03:44:52'),(27,36,12,0,'一个人可以被毁灭，就是不能打败他。','2018-12-27 23:48:45'),(28,37,14,0,'我很可爱','2018-12-28 00:50:13'),(32,37,0,13,'新年快乐','2018-12-29 03:26:15'),(33,37,0,7,'元旦快乐','2018-12-30 04:17:16'),(34,35,0,13,'安尔雅','2018-12-29 18:09:16'),(35,37,0,13,'日上映','2018-12-29 18:11:38'),(36,36,8,0,'六个蜘蛛侠的《平行宇宙》','2018-12-29 17:36:20'),(37,36,8,0,'六个蜘蛛侠的《平行宇宙》','2018-12-29 17:37:44'),(38,36,8,0,'大概','2018-12-29 17:42:33'),(39,36,9,0,'让优秀成为一种习惯','2018-12-29 18:00:59'),(40,37,0,15,'啊gt ','2018-12-30 02:39:46'),(41,36,4,0,'dagag ','2019-01-01 01:49:50'),(42,37,9,0,'永远以一颗宽容的心对待别人','2019-01-02 04:33:57'),(43,37,9,0,'湖人总冠军！！！','2019-01-02 04:34:32'),(44,35,0,19,'幸运草','2019-01-01 23:01:17'),(45,37,0,14,'嘎嘎嘎','2019-01-01 23:01:55'),(46,37,0,20,'方法','2019-01-01 23:05:54'),(47,37,0,21,'快快快','2019-01-01 23:07:00'),(48,36,10,0,'乔杉提出了一个千古之谜：为什么女人会认为揉脸可以瘦脸，揉胸可以丰胸呢？难道不可以反之亦然？','2019-01-06 04:03:36'),(49,37,15,0,'那位平日里规章严明的麦格教授，挥舞起魔杖，保卫魔法的殿堂，一串串的“烈火熊熊”咒……','2019-01-05 17:17:33'),(50,37,0,22,'熔炉》烘烤集体的良知','2019-01-05 17:41:06'),(56,36,39,0,'嗯嗯','2019-02-24 09:28:54'),(57,35,40,0,NULL,'2019-02-24 13:16:46'),(58,35,40,0,NULL,'2019-02-24 13:18:14'),(59,35,40,0,NULL,'2019-02-24 13:20:53'),(60,36,40,0,'反反复复付','2019-02-24 13:21:54'),(61,36,8,0,NULL,'2019-02-24 13:22:21'),(62,36,8,0,'发啊噶','2019-02-24 13:26:07'),(63,35,0,7,'我爱你','2019-02-25 05:47:28'),(64,37,0,14,'你好吗？','2019-02-25 05:51:44'),(65,37,0,14,'你好吗？','2019-02-25 05:52:21'),(66,37,0,15,'你好啊得到','2019-02-25 05:53:39'),(67,37,0,20,'你好，我是小猪','2019-02-25 14:40:45'),(68,41,16,0,'你好，我是警察','2019-03-04 06:04:19');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `messageid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '留言id',
  `userid` int(10) unsigned NOT NULL COMMENT '用户id',
  `toid` int(10) unsigned NOT NULL,
  `messagetime` varchar(20) DEFAULT NULL COMMENT '留言时间',
  `messagecontent` tinytext COMMENT '留言内容',
  PRIMARY KEY (`messageid`),
  KEY `userid` (`userid`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (20,36,36,'2018/12/27 03:14:15','我想对你说'),(25,35,35,'2018/12/28 08:35:28','当帕西诺驾驶着红色法拉利疯狂盲目飚车，心被紧紧揪着，祈祷他平安的时候，才发现原来自己可以如此轻易的入戏。'),(26,35,35,'2018/12/28 08:37:46','我曾经吹嘘说自己看电影不哭，一不留神，吹过头了。五星。\r\n '),(27,37,37,'2018/12/30 02:17:35','那一场无疾而终的暗恋-88恋爱解析'),(28,37,37,'2018/12/30 02:17:56','1988大结局后，很是疯狂的找了大量的影评来看，却发现始终找不到我心中想要的那个。'),(30,35,36,'2019/02/25 17:28:55','之前网上好多人道德绑架王传君，说他忘本，出了名气忘了爱情公寓，其实我想说，到底是谁忘本，在原创公司几乎没有参与的情况下拍了一部新次元冒险家'),(31,35,36,'2019/02/25 17:33:34','我是test，请多多指教~');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo` (
  `photosid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '照片id',
  `userid` int(10) unsigned NOT NULL COMMENT '用户id',
  `photopath` text,
  `position` varchar(100) DEFAULT NULL COMMENT '位置',
  `mood` tinytext COMMENT '心情语',
  `phototime` varchar(20) DEFAULT NULL COMMENT '上传时间',
  `photostate` tinyint(2) DEFAULT '1' COMMENT '图片状态',
  PRIMARY KEY (`photosid`),
  KEY `userid` (`userid`),
  CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES (12,36,'static\\upload\\12\\4\\5c9852f1-ede2-48aa-8ead-665c4be22187_设计 - 37.jpg','dgut','今天我开心','2018/12/27 03:57:54',1),(13,36,'static\\upload\\2\\25\\1551067511596视觉 - 53.jpg','dgut','今天我开心','2018/12/27 03:58:28',0),(19,36,'static\\upload\\2\\25\\1551067511593视觉 - 3.jpg','新西兰','今天我开心','2018/12/27 04:14:02',1),(20,36,'static\\upload\\2\\25\\15510633126104.jpg','dgut','今天我开心','2018/12/27 04:14:08',1),(36,35,'static\\upload\\2\\25\\1551071058381视觉 - 45.jpg','沙哈拉沙漠','当幸福来敲门 The Pursuit of Happyness','2018/12/28 08:38:39',1),(37,36,'uploads/20181228/7df69810449edfbee90acf5e140887c8.jpg','东京铁塔','元旦快乐！','2018/12/28 08:57:58',1),(39,36,'uploads/20181230/aa9b17c77b52244dea2aa49090694460.jpg','伦敦','当幸福来敲门','2018/12/30 12:37:41',1),(40,36,'static\\upload\\2\\25\\1551071058377视觉 - 5.jpg*static\\upload\\2\\25\\1551071058381视觉 - 45.jpg*static\\upload\\2\\25\\1551071058384设计 - 211.jpg','温暖的南极','不是我剧透，是墙先开的口','2018/12/31 03:31:39',1),(41,37,'uploads/20190102/9d4420470e463ea38a5a2e16e5d66954.jpg','天堂','我们无法改变世界，但我们可以选择不被世界改变...','2019/01/02 07:10:35',1),(42,37,'uploads/20190102/1b49ee2d341998a16f38865a687d2c60.jpg','天堂','我们无法改变世界，但我们可以选择不被世界改变...','2019/01/02 07:10:35',1);
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reply` (
  `replyid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '回复id',
  `commentidd` int(10) unsigned NOT NULL COMMENT '评论id',
  `realid` int(10) DEFAULT NULL COMMENT '回复用户id',
  `realname` varchar(20) DEFAULT NULL COMMENT '回复用户名',
  `realimage` varchar(100) DEFAULT NULL COMMENT '回复用户照片',
  `replycontent` tinytext,
  `replytime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`replyid`),
  KEY `commentid` (`commentidd`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (5,16,36,'smile','uploads/20181227/a4f4c2dc0cce7533b2e1c307e25d55e7.jpg','喜欢蜘蛛侠和漫威的观众一定会大饱眼福。','2018/12/27 11:22:07'),(6,24,35,'test','uploads/20181222/4604070aea5f8691b146caccc344890f.jpg','可需要你做好心理准备了——它称得上是','2018/12/27 11:41:02'),(7,19,36,'smile','uploads/20181227/a4f4c2dc0cce7533b2e1c307e25d55e7.jpg','意外，以前看他的','2018/12/27 11:41:38'),(8,27,36,'smile','uploads/20181227/a4f4c2dc0cce7533b2e1c307e25d55e7.jpg','我就是那个人','2018/12/28 07:48:58'),(11,19,36,'smile','uploads/20181227/a4f4c2dc0cce7533b2e1c307e25d55e7.jpg','你好啊','2018/12/30 12:49:16'),(12,3,36,'smile','uploads/20181227/a4f4c2dc0cce7533b2e1c307e25d55e7.jpg','dia','2018/12/30 01:00:35'),(13,17,36,'smile','uploads/20181227/a4f4c2dc0cce7533b2e1c307e25d55e7.jpg','fah','2018/12/30 01:01:48'),(14,22,36,'smile','uploads/20181227/a4f4c2dc0cce7533b2e1c307e25d55e7.jpg','无论是一部作品、一个人，还是一件事，都往往可以衍生出许多不同的话题','2019/01/06 12:03:55');
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(20) NOT NULL COMMENT '用户名称',
  `password` varchar(100) NOT NULL COMMENT '用户密码',
  `address` varchar(100) DEFAULT NULL,
  `work` varchar(100) DEFAULT NULL,
  `sex` tinyint(2) DEFAULT NULL,
  `age` varchar(2) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL COMMENT '用户email',
  `image` varchar(200) DEFAULT 'static\\upload\\2\\24\\1550991884619设计 - 31.jpg' COMMENT '用户头像',
  `spaceimage` varchar(200) DEFAULT 'uploads/20181222/banner.jpg',
  `motto` tinytext,
  `words` text,
  `interest` varchar(20) DEFAULT NULL,
  `usertype` tinyint(4) DEFAULT '0' COMMENT '用户类型：0-读者；1-管理员',
  `userstate` tinyint(4) DEFAULT '0' COMMENT '用户状态：-1-被禁；0-审核中；1通过',
  `registertime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (35,'test','123','浩瀚的撒哈拉沙漠','我想当一名警察',1,NULL,'1841339771@qq.com','static\\upload\\12\\4\\5c9852f1-ede2-48aa-8ead-665c4be22187_设计 - 37.jpg','uploads/20181222/banner.jpg','《活着》——《在细雨中呼喊》后的余华与《英雄》前的张艺谋','福贵是一个败家子，然而由于命运的际遇成为了自食其力的“城市贫民”，这一转折的标志就是 ——皮影。被抓了壮丁的时候，福贵拼命保住了皮影箱子，因为“还指着这养家呢，这是借人家的，得还。”这时候福贵在乱军中已经确定了自己的身份，在被 ***的军队抓住后，小战士用刺刀轻轻穿透了皮影，在阳光下细细端详，这一箱皮影告诉了***的军队，福贵是劳动人民，福贵由此给解放军唱戏，拉车，也算是参加了革命。此时的福贵已经在命运的水流中如一片枯叶流转了，看电影版的《活着》就是在看命运带给了平凡的人生什么，电影版更加突出的是，命运的悲剧不是无原因的，人为的命运的悲剧也许才是更大的悲剧，在一个个“伟大”的时代中，人是如何的努力也难以把握住自己的命运，人的徒劳，人的无奈，人的卑微的欲求——活着，是如何的被践踏。或许，余华在小说着力淡化的“人类无法忍受太多的真实”，在电影中又被还原了。也许这才是电影无法在大陆公开放映的关键所在，而沉于哲理的小说，终于在1998年在大陆出版了。',NULL,0,0,'2018-12-22 02:53:32',NULL),(36,'smile','123','中国第一滩','简简单单的一名医生',2,NULL,'980013084@qq.com','static\\upload\\2\\24\\1550991884619设计 - 31.jpg','uploads/20190105/7a13d6997a484ce100eb267d9a3157ea.jpg','男人。 千万不要记恨你的对手，这样会让你失去理智。','老教父对麦克说：“我最不希望参与家里面的事情，我希望你将来可以成为州长，议员什么的，那样就不用再受大人物操控”；这句话是感触最深的，其实无论是资本主义还是社会主义、甚至是独裁社会，权力永远都在操控我们，所以人们奋斗的最终目标就是不被操控，然而不被操控就必须操控别人，这个漩涡没有人可以逃避才是教父整个家族几代人的悲哀，也是世界的悲哀。',NULL,0,0,'2018-12-23 11:11:29',NULL),(37,'fish','ULNV02mBz8lgry4ZBtC6nQ==','来自蔚蓝的天空','一名敬业的人民教师',0,NULL,'13432929246@163.com','static\\upload\\2\\24\\1550991884619设计 - 31.jpg','uploads/20190102/46ec9e9af1588766dc34cccac92199ef.jpg','一部没有爱情与美女的电影,却光芒四射','“这是一部男人必看的电影。”人人都这么说。但单纯从性别区分，就会让这电影变狭隘。《肖申克的救赎》突破了男人电影的局限，通篇几乎充满令人难以置信的温馨基调，而电影里最伟大的主题是“希望”。 当我们无奈地遇到了如同肖申克一般囚禁了心灵自由的那种囹圄，我们是无奈的老布鲁克，灰心的瑞德，还是智慧的安迪？运用智慧，信任希望，并且勇敢面对恐惧心理，去打败它？ 经典的电影之所以经典，因为他们都在做同一件事——让你从不同的角度来欣赏希望的美好',NULL,0,0,'2018-12-28 12:48:25',NULL),(38,'james','111','美丽的东莞理工学院','一代枭雄',2,NULL,'246420565@qq.com','static\\upload\\2\\24\\1550991884619设计 - 31.jpg','uploads/20190101/b8d5fde89badbf927a46959f897380d4.jpg','让优秀成为一种习惯！','老渔夫就是敢于挑战自身缺陷及自己勇气和信心的胜利者，从世俗胜利观的角度看，老渔夫不是最后的胜利者，因为尽管开始他战胜了大马林鱼，但是最终大马林鱼还是让鲨鱼吃了，他只是带着大马林鱼的白骨架子回到了岸上，也就是说，鲨鱼才是胜利者。可是,在理想主义者眼里,，师贝多芬所说“我可以被摧毁，但我不能被征服”。\r\n人性是强悍的，人类本身有自己的限度，但正是因为有了老渔夫这样的人一次又一次地向限度挑战，超越它们，这个限度才一次次扩大，一次次把更大的挑战摆在了人类面前。在这个意义上，老渔夫桑地亚哥这样的英雄，不管他们挑战限度是成功还是失败,都是值得我们永远敬重的。因为，他带给我们的是人类最为高贵的自信。',NULL,0,0,'2019-01-01 08:38:33',NULL),(41,'ant','wdNJvrqzGS9MVrIBO+m9qQ==',NULL,NULL,NULL,NULL,'111@qq.com','static\\upload\\2\\25\\1551067511593视觉 - 3.jpg','uploads/20181222/banner.jpg',NULL,NULL,NULL,0,0,'2019-02-27 16:34:17','g7_8_a(^1m&y931');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whisper`
--

DROP TABLE IF EXISTS `whisper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whisper` (
  `whisperid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '微语id',
  `userid` int(10) unsigned NOT NULL COMMENT '用户id',
  `whispercontent` text COMMENT '微语内容',
  `picturepath` text COMMENT '微语图片路径',
  `whispertime` varchar(20) DEFAULT NULL COMMENT '微语时间',
  `commentcount` int(10) DEFAULT '0' COMMENT '评论数',
  `love` tinyint(4) DEFAULT '0' COMMENT '被赞次数',
  PRIMARY KEY (`whisperid`),
  KEY `userid` (`userid`),
  CONSTRAINT `whisper_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whisper`
--

LOCK TABLES `whisper` WRITE;
/*!40000 ALTER TABLE `whisper` DISABLE KEYS */;
INSERT INTO `whisper` VALUES (7,37,'一直以来泰国爱情电影一直都习惯的走向于暖心，并多少会添上一些些的励志色彩，就像下一站说爱你一样的模式。我叫帅哥。','static\\upload\\2\\25\\1551067511593视觉 - 3.jpg*static\\upload\\12\\4\\5c9852f1-ede2-48aa-8ead-665c4be22187_设计 - 37.jpg','2019/01/02 18:15:33',0,4),(14,36,'《蓝色星球2》系列第七集，也就是最后一集，影片结尾时，大卫·爱登堡坐在沙滩边上，海风依旧吹乱他的白发。\r\n他说：“我们在历史上扮演着独一无二的角色，我们从未如此关心过我们对这个星球的所作所为，我们也从未拥有如此强大的力量去做一些事情，当然我们有责任去关心我们蓝色的星球，人类和地球上所有的生命的未来取决于我们。”\r\n他说完这段话，便也意味着这部伟大的讲述海洋生命故事的纪录片落下帷幕，下一次，不知道还要多久才能再听到爱登堡出镜旁白的纪录片。','static\\upload\\2\\25\\1551067511596视觉 - 53.jpg','2018/12/30 14:05:06',1,2),(15,36,'那一场无疾而终的暗恋-88恋爱解析\r\n若无其事的路过吐槽，而后带着憨厚的傻笑躲在窗口偷看，\r\n一遍遍拆解鞋带，直到那个女孩出现再假装不耐烦的离开\r\n在那个女孩每次看过来的时候收回凝视的目光\r\n当着小伙伴的面用力和女孩划开界限。\r\n','static\\upload\\12\\4\\5c9852f1-ede2-48aa-8ead-665c4be22187_设计 - 37.jpg*static\\upload\\2\\25\\1551063261411534527.jpg','2018/12/30 14:15:48',1,1),(20,37,'皮影或许更能代表福贵和他的命运之间的友情，在1958年大炼钢铁的时代，连皮影上的铁丝也要拆下来取炼钢，“制造解放台湾最关键的两颗子弹”，于是才有了福贵去工地上的唱戏，才有了妙趣横生的小有庆的形象生动地刻画。陪伴福贵几十年的皮影终于还是在文化大革命中烧掉了，但是皮影的箱子还在，小孙子的小鸡还是可以放在里面的，就像福贵的人生，不断经历惨痛的种种的打击，命运已经千疮百孔，福贵依然平凡，依然活着，依然坚持了太过卑微的希望——活着','static\\upload\\2\\25\\1551063261411534527.jpg','2019/01/02 19:02:24',1,2),(21,37,'我们愤怒的不仅是禽兽的行径，更是禽兽逍遥法外，正义无处伸张，无能为力才是最痛苦和绝望的。一个非常容易感动观众的题材，尤其还是真实事件改编。其实电影还有很多提升空间，包括对犯罪场面的描述太刻意未也太多了。但仍喜欢这样的电影，这才是电影应有的立场。这就是我们和韩影的差距。','static\\upload\\2\\25\\1551071058381视觉 - 45.jpg*static\\upload\\2\\25\\1551071058384设计 - 211.jpg','2019/01/02 19:06:49',1,1),(22,37,'影片改编自真实事件。\r\n       穿过幽暗狭长的隧道，便是雾津。漫天浓郁的雾气，两条刚刚失去，尸体还温热的生命，还有那块绿色的交通指示牌，无声地告诉姜仁浩：雾津欢迎你。\r\n       也许每个生命来到这个世界上本来应该是平等的。如今似乎人们已经达成了某种共识，那就是那句仿佛是刻在亘古不变的宇宙中沙尘上的一句话：人人生来平等。但现实的讽刺意义或许就在于此，它不断地，隐约的告诉我们，人人生来不平等。','static\\upload\\2\\25\\1551063261411534527.jpg','2019/01/06 13:40:19',1,0),(25,35,'在查阅了一些资料之后，我的思路如述：访问页面跳转到登陆页面时，存储上一个页面的URL路径，并放在Session中。用户填写完数据之后将数据提交到Servlet，Servlet处理之后通过Session获取到登陆页面之前的页面URL。最后，通过重定向或者跳转返回到登录前的页面。','static\\upload\\2\\25\\1551071058377视觉 - 5.jpg*static\\upload\\2\\25\\1551071058381视觉 - 45.jpg*static\\upload\\2\\25\\1551071058384设计 - 211.jpg','2019/02/25 13:04:17',0,0);
/*!40000 ALTER TABLE `whisper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whisperpicture`
--

DROP TABLE IF EXISTS `whisperpicture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whisperpicture` (
  `wisperpictureid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '微语图片id',
  `whisperid` int(10) unsigned NOT NULL COMMENT '微语id',
  `picturepath` varchar(100) DEFAULT NULL COMMENT '微语图片路径',
  PRIMARY KEY (`wisperpictureid`),
  KEY `whisperid` (`whisperid`),
  CONSTRAINT `whisperpicture_ibfk_1` FOREIGN KEY (`whisperid`) REFERENCES `whisper` (`whisperid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whisperpicture`
--

LOCK TABLES `whisperpicture` WRITE;
/*!40000 ALTER TABLE `whisperpicture` DISABLE KEYS */;
INSERT INTO `whisperpicture` VALUES (7,7,'uploads/20181229/31cd10053b152a985b4f12cf47d34794.jpg');
/*!40000 ALTER TABLE `whisperpicture` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-04 15:49:58

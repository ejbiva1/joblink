/*Data for the table TB_USER */
TRUNCATE TABLE TB_USER;

INSERT INTO TB_USER 
(ID, USERNAME, PASSWORD, CREATE_USERID, CREATE_DATE, LAST_UPDATE_USERID, LAST_UPDATE_DATE)
VALUES
('user_001', 'user001', '97f3c717da19b4697ae9884e67aabce6', 'system_admin', now(), 'system_admin', now());

INSERT INTO TB_USER
(ID, USERNAME, PASSWORD, CREATE_USERID, CREATE_DATE, LAST_UPDATE_USERID, LAST_UPDATE_DATE)
VALUES
('user_002', 'user002', '8b63b2922634ffaeab2019e50f13dd20', 'system_admin', now(), 'system_admin', now());


/*Data for the table TB_ADMIN_MENU */
TRUNCATE TABLE TB_ADMIN_MENU;

INSERT INTO TB_ADMIN_MENU VALUES
('menu_admin_001', 'system_admin', '菜单设置', 'intiMenuSetting.do', 1,
'system_admin', now(), 'system_admin', now(), false);

INSERT INTO TB_ADMIN_MENU VALUES
('menu_admin_002', 'system_admin', '场馆信息维护', 'initVenuePage.do', 2,
'system_admin', now(), 'system_admin', now(), false);

INSERT INTO TB_ADMIN_MENU VALUES
('menu_admin_003', 'system_admin', '教练信息维护', 'initCoachPage.do', 3,
'system_admin', now(), 'system_admin', now(), false);

INSERT INTO TB_ADMIN_MENU VALUES
('menu_admin_004', 'system_admin', '场馆团购维护', 'initProductPage.do', 4,
'system_admin', now(), 'system_admin', now(), false);

INSERT INTO TB_ADMIN_MENU VALUES
('menu_admin_005', 'system_admin', '私教课程维护', 'initPrivateLessonPage.do', 5,
'system_admin', now(), 'system_admin', now(), false);

INSERT INTO TB_ADMIN_MENU VALUES
('menu_admin_006', 'system_admin', '团课课程维护', 'initGroupLessonPage.do', 6,
'system_admin', now(), 'system_admin', now(), false);


INSERT INTO TB_ADMIN_MENU VALUES
('menu_admin_007', 'venue_admin', '场馆信息维护', 'initVenuePage.do', 1,
'system_admin', now(), 'system_admin', now(), false);

INSERT INTO TB_ADMIN_MENU VALUES
('menu_admin_008', 'venue_admin', '教练信息维护', 'initCoachPage.do', 2,
'system_admin', now(), 'system_admin', now(), false);

INSERT INTO TB_ADMIN_MENU VALUES
('menu_admin_009', 'venue_admin', '场馆团购维护', 'initProductPage.do', 3,
'system_admin', now(), 'system_admin', now(), false);

INSERT INTO TB_ADMIN_MENU VALUES
('menu_admin_010', 'venue_admin', '团课课程维护', 'initGroupLessonPage.do', 4,
'system_admin', now(), 'system_admin', now(), false);


INSERT INTO TB_ADMIN_MENU VALUES
('menu_admin_011', 'venue_admin', '教练信息维护', 'initCoachPage.do', 1,
'system_admin', now(), 'system_admin', now(), false);



/*Data for the table TB_PARAM_CONFIG */
TRUNCATE TABLE TB_PARAM_CONFIG;

INSERT INTO TB_PARAM_CONFIG VALUES
('param_config_0001', 'coach_status', 'multiple', 'coach_working', '在职',
'system_admin', now(), 'system_admin', now(), false);

INSERT INTO TB_PARAM_CONFIG VALUES
('param_config_0002', 'coach_status', 'multiple', 'coach_on_leave', '休息中',
'system_admin', now(), 'system_admin', now(), false);

INSERT INTO TB_PARAM_CONFIG VALUES
('param_config_0003', 'venue_status', 'multiple', 'venue_open', '营业中',
'system_admin', now(), 'system_admin', now(), false);

INSERT INTO TB_PARAM_CONFIG VALUES
('param_config_0004', 'venue_status', 'multiple', 'venue_closed', '歇业',
'system_admin', now(), 'system_admin', now(), false);

INSERT INTO TB_PARAM_CONFIG VALUES
('param_config_0005', 'class_status', 'multiple', 'class_open', '已上架',
'system_admin', now(), 'system_admin', now(), false);

INSERT INTO TB_PARAM_CONFIG VALUES
('param_config_0006', 'class_status', 'multiple', 'class_closed', '已下架',
'system_admin', now(), 'system_admin', now(), false);

INSERT INTO TB_PARAM_CONFIG VALUES
('param_config_0007', 'product_status', 'multiple', 'product_on_sale', '已上架',
'system_admin', now(), 'system_admin', now(), false);

INSERT INTO TB_PARAM_CONFIG VALUES
('param_config_0008', 'product_status', 'multiple', 'product_sale_off', '已下架',
'system_admin', now(), 'system_admin', now(), false);

INSERT INTO TB_PARAM_CONFIG VALUES
('param_config_0009', 'identification_type', 'multiple', 'id_card', '身份证',
'system_admin', now(), 'system_admin', now(), false);

INSERT INTO TB_PARAM_CONFIG VALUES
('param_config_0010', 'identification_type', 'multiple', 'passport', '护照',
'system_admin', now(), 'system_admin', now(), false);

INSERT INTO TB_PARAM_CONFIG VALUES
('param_config_0011', 'sport_type', 'multiple', '健身', '健身',
'system_admin', now(), 'system_admin', now(), false);

INSERT INTO TB_PARAM_CONFIG VALUES
('param_config_0012', 'sport_type', 'multiple', '瑜伽', '瑜伽',
'system_admin', now(), 'system_admin', now(), false);

INSERT INTO TB_PARAM_CONFIG VALUES
('param_config_0013', 'sport_type', 'multiple', '游泳', '游泳',
'system_admin', now(), 'system_admin', now(), false);

INSERT INTO TB_PARAM_CONFIG VALUES
('param_config_0014', 'sport_type', 'multiple', '舞蹈', '舞蹈',
'system_admin', now(), 'system_admin', now(), false);

INSERT INTO TB_PARAM_CONFIG VALUES
('param_config_0021', 'coupon_status', 'multiple', 'coupon_used', '已使用',
'system_admin', now(), 'system_admin', now(), false);

INSERT INTO TB_PARAM_CONFIG VALUES
('param_config_0022', 'coupon_status', 'multiple', 'coupon_unused', '未使用',
'system_admin', now(), 'system_admin', now(), false);

INSERT INTO TB_PARAM_CONFIG VALUES
('param_config_0023', 'order_status', 'multiple', 'order_unpaid', '待付款',
'system_admin', now(), 'system_admin', now(), false);

INSERT INTO TB_PARAM_CONFIG VALUES
('param_config_0024', 'order_status', 'multiple', 'order_unused', '未消费',
'system_admin', now(), 'system_admin', now(), false);

INSERT INTO TB_PARAM_CONFIG VALUES
('param_config_0025', 'order_status', 'multiple', 'order_used', '已消费',
'system_admin', now(), 'system_admin', now(), false);

INSERT INTO TB_PARAM_CONFIG VALUES
('param_config_0026', 'order_status', 'multiple', 'order_refunded', '已退款',
'system_admin', now(), 'system_admin', now(), false);

INSERT INTO TB_PARAM_CONFIG VALUES
('param_config_0027', 'order_status', 'multiple', 'order_settled', '已结算',
'system_admin', now(), 'system_admin', now(), false);

/*INSERT INTO TB_PARAM_CONFIG VALUES
('param_config_0028', 'order_status', 'multiple', 'order_refunding', '退款处理中',
'system_admin', now(), 'system_admin', now(), false);*/

INSERT INTO TB_PARAM_CONFIG VALUES
('param_config_0041', 'user_type', 'multiple', 'coach', '教练',
'system_admin', now(), 'system_admin', now(), false);

INSERT INTO TB_PARAM_CONFIG VALUES
('param_config_0042', 'user_type', 'multiple', 'venue_admin', '场馆管理员',
'system_admin', now(), 'system_admin', now(), false);

INSERT INTO TB_PARAM_CONFIG VALUES
('param_config_0043', 'user_type', 'multiple', 'system_admin', '系统管理员',
'system_admin', now(), 'system_admin', now(), false);



/*Data for the table TB_AREA */
TRUNCATE TABLE TB_AREA;

INSERT INTO TB_AREA VALUES
('AREA_00001', '上海', '黄浦区', '人民广场');

INSERT INTO TB_AREA VALUES
('AREA_00002', '上海', '黄浦区', '南京东路');

INSERT INTO TB_AREA VALUES
('AREA_00003', '上海', '黄浦区', '外滩');

INSERT INTO TB_AREA VALUES
('AREA_00004', '上海', '黄浦区', '城隍庙');

INSERT INTO TB_AREA VALUES
('AREA_00005', '上海', '黄浦区', '老西门');

INSERT INTO TB_AREA VALUES
('AREA_00006', '上海', '黄浦区', '董家渡');

INSERT INTO TB_AREA VALUES
('AREA_00007', '上海', '卢湾区', '淮海路');

INSERT INTO TB_AREA VALUES
('AREA_00008', '上海', '卢湾区', '新天地');

INSERT INTO TB_AREA VALUES
('AREA_00009', '上海', '卢湾区', '打浦桥');

INSERT INTO TB_AREA VALUES
('AREA_00010', '上海', '卢湾区', '瑞金宾馆区');

INSERT INTO TB_AREA VALUES
('AREA_00011', '上海', '静安区', '静安寺');

INSERT INTO TB_AREA VALUES
('AREA_00012', '上海', '静安区', '南京西路');

INSERT INTO TB_AREA VALUES
('AREA_00013', '上海', '静安区', '曹家渡');

INSERT INTO TB_AREA VALUES
('AREA_00014', '上海', '静安区', '同乐坊');

INSERT INTO TB_AREA VALUES
('AREA_00015', '上海', '徐汇区', '徐家汇');

INSERT INTO TB_AREA VALUES
('AREA_00016', '上海', '徐汇区', '万体馆');

INSERT INTO TB_AREA VALUES
('AREA_00017', '上海', '徐汇区', '衡山路');

INSERT INTO TB_AREA VALUES
('AREA_00018', '上海', '徐汇区', '音乐学院');

INSERT INTO TB_AREA VALUES
('AREA_00019', '上海', '徐汇区', '复兴西路/丁香花园');

INSERT INTO TB_AREA VALUES
('AREA_00020', '上海', '徐汇区', '肇嘉浜路沿线');

INSERT INTO TB_AREA VALUES
('AREA_00021', '上海', '徐汇区', '龙华');

INSERT INTO TB_AREA VALUES
('AREA_00022', '上海', '徐汇区', '漕河泾/田林');

INSERT INTO TB_AREA VALUES
('AREA_00023', '上海', '徐汇区', '上海南站');

INSERT INTO TB_AREA VALUES
('AREA_00024', '上海', '徐汇区', '光启城');

INSERT INTO TB_AREA VALUES
('AREA_00025', '上海', '长宁区', '中山公园');

INSERT INTO TB_AREA VALUES
('AREA_00026', '上海', '长宁区', '虹桥');

INSERT INTO TB_AREA VALUES
('AREA_00027', '上海', '长宁区', '天山');

INSERT INTO TB_AREA VALUES
('AREA_00028', '上海', '长宁区', '古北');

INSERT INTO TB_AREA VALUES
('AREA_00029', '上海', '长宁区', '上海影城/新华路');

INSERT INTO TB_AREA VALUES
('AREA_00030', '上海', '长宁区', '动物园/虹桥机场');

INSERT INTO TB_AREA VALUES
('AREA_00031', '上海', '长宁区', '北新泾');

INSERT INTO TB_AREA VALUES
('AREA_00032', '上海', '浦东新区', '陆家嘴');

INSERT INTO TB_AREA VALUES
('AREA_00033', '上海', '浦东新区', '八佰伴');

INSERT INTO TB_AREA VALUES
('AREA_00034', '上海', '浦东新区', '世纪公园');

INSERT INTO TB_AREA VALUES
('AREA_00035', '上海', '浦东新区', '塘桥');

INSERT INTO TB_AREA VALUES
('AREA_00036', '上海', '浦东新区', '源深体育中心');

INSERT INTO TB_AREA VALUES
('AREA_00037', '上海', '浦东新区', '金杨地区');

INSERT INTO TB_AREA VALUES
('AREA_00038', '上海', '浦东新区', '碧云社区');

INSERT INTO TB_AREA VALUES
('AREA_00039', '上海', '浦东新区', '金桥');

INSERT INTO TB_AREA VALUES
('AREA_00040', '上海', '浦东新区', '张江');

INSERT INTO TB_AREA VALUES
('AREA_00041', '上海', '浦东新区', '临沂/南码头');

INSERT INTO TB_AREA VALUES
('AREA_00042', '上海', '浦东新区', '上南地区');

INSERT INTO TB_AREA VALUES
('AREA_00043', '上海', '浦东新区', '三林地区');

INSERT INTO TB_AREA VALUES
('AREA_00044', '上海', '浦东新区', '康桥/周浦');

INSERT INTO TB_AREA VALUES
('AREA_00045', '上海', '浦东新区', '北蔡');

INSERT INTO TB_AREA VALUES
('AREA_00046', '上海', '浦东新区', '东明');

INSERT INTO TB_AREA VALUES
('AREA_00047', '上海', '浦东新区', '川沙');

INSERT INTO TB_AREA VALUES
('AREA_00048', '上海', '浦东新区', '外高桥');

INSERT INTO TB_AREA VALUES
('AREA_00049', '上海', '浦东新区', '惠南镇');

INSERT INTO TB_AREA VALUES
('AREA_00050', '上海', '浦东新区', '浦东机场');

INSERT INTO TB_AREA VALUES
('AREA_00051', '上海', '浦东新区', '临港新城');

INSERT INTO TB_AREA VALUES
('AREA_00052', '上海', '浦东新区', '曹路');

INSERT INTO TB_AREA VALUES
('AREA_00053', '上海', '浦东新区', '高行');

INSERT INTO TB_AREA VALUES
('AREA_00054', '上海', '浦东新区', '航头');

INSERT INTO TB_AREA VALUES
('AREA_00055', '上海', '浦东新区', '新场');

INSERT INTO TB_AREA VALUES
('AREA_00056', '上海', '浦东新区', '泥城');

INSERT INTO TB_AREA VALUES
('AREA_00057', '上海', '虹口区', '虹口足球场');

INSERT INTO TB_AREA VALUES
('AREA_00058', '上海', '虹口区', '四川北路');

INSERT INTO TB_AREA VALUES
('AREA_00059', '上海', '虹口区', '海宁路/七浦路');

INSERT INTO TB_AREA VALUES
('AREA_00060', '上海', '虹口区', '临平路/和平公园');

INSERT INTO TB_AREA VALUES
('AREA_00061', '上海', '虹口区', '曲阳地区');

INSERT INTO TB_AREA VALUES
('AREA_00062', '上海', '虹口区', '北外滩');

INSERT INTO TB_AREA VALUES
('AREA_00063', '上海', '虹口区', '凉城/江湾镇');

INSERT INTO TB_AREA VALUES
('AREA_00064', '上海', '虹口区', '赤峰路');

INSERT INTO TB_AREA VALUES
('AREA_00065', '上海', '杨浦区', '五角场/大学区');

INSERT INTO TB_AREA VALUES
('AREA_00066', '上海', '杨浦区', '黄兴公园');

INSERT INTO TB_AREA VALUES
('AREA_00067', '上海', '杨浦区', '控江地区');

INSERT INTO TB_AREA VALUES
('AREA_00068', '上海', '杨浦区', '中原地区');

INSERT INTO TB_AREA VALUES
('AREA_00069', '上海', '杨浦区', '平凉路');

INSERT INTO TB_AREA VALUES
('AREA_00070', '上海', '杨浦区', '鞍山新村');

INSERT INTO TB_AREA VALUES
('AREA_00071', '上海', '闸北区', '火车站');

INSERT INTO TB_AREA VALUES
('AREA_00072', '上海', '闸北区', '大宁地区');

INSERT INTO TB_AREA VALUES
('AREA_00073', '上海', '闸北区', '彭浦新村');

INSERT INTO TB_AREA VALUES
('AREA_00074', '上海', '闸北区', '大悦城');

INSERT INTO TB_AREA VALUES
('AREA_00075', '上海', '闸北区', '闸北公园');

INSERT INTO TB_AREA VALUES
('AREA_00076', '上海', '闸北区', '北区汽车站');

INSERT INTO TB_AREA VALUES
('AREA_00077', '上海', '闸北区', '西藏北路/中兴路');

INSERT INTO TB_AREA VALUES
('AREA_00078', '上海', '闸北区', '市北工业园/汶水路');

INSERT INTO TB_AREA VALUES
('AREA_00079', '上海', '普陀区', '曹家渡');

INSERT INTO TB_AREA VALUES
('AREA_00080', '上海', '普陀区', '长寿路');

INSERT INTO TB_AREA VALUES
('AREA_00081', '上海', '普陀区', '武宁地区');

INSERT INTO TB_AREA VALUES
('AREA_00082', '上海', '普陀区', '月星环球港');

INSERT INTO TB_AREA VALUES
('AREA_00083', '上海', '普陀区', '长风公园/华师大');

INSERT INTO TB_AREA VALUES
('AREA_00084', '上海', '普陀区', '曹阳地区');

INSERT INTO TB_AREA VALUES
('AREA_00085', '上海', '普陀区', '中山北路/甘泉地区');

INSERT INTO TB_AREA VALUES
('AREA_00086', '上海', '普陀区', '梅川路');

INSERT INTO TB_AREA VALUES
('AREA_00087', '上海', '普陀区', '真如');

INSERT INTO TB_AREA VALUES
('AREA_00088', '上海', '普陀区', '桃浦');

INSERT INTO TB_AREA VALUES
('AREA_00089', '上海', '宝山区', '大华地区');

INSERT INTO TB_AREA VALUES
('AREA_00090', '上海', '宝山区', '淞滨地区');

INSERT INTO TB_AREA VALUES
('AREA_00091', '上海', '宝山区', '庙行/共康');

INSERT INTO TB_AREA VALUES
('AREA_00092', '上海', '宝山区', '上海大学');

INSERT INTO TB_AREA VALUES
('AREA_00093', '上海', '宝山区', '宝山城区');

INSERT INTO TB_AREA VALUES
('AREA_00094', '上海', '宝山区', '顾村公园');

INSERT INTO TB_AREA VALUES
('AREA_00095', '上海', '宝山区', '美兰湖');

INSERT INTO TB_AREA VALUES
('AREA_00096', '上海', '宝山区', '通河/泗塘');

INSERT INTO TB_AREA VALUES
('AREA_00097', '上海', '宝山区', '月浦');

INSERT INTO TB_AREA VALUES
('AREA_00098', '上海', '宝山区', '杨行');

INSERT INTO TB_AREA VALUES
('AREA_00099', '上海', '宝山区', '高境');

INSERT INTO TB_AREA VALUES
('AREA_00100', '上海', '宝山区', '淞南');

INSERT INTO TB_AREA VALUES
('AREA_00101', '上海', '闵行区', '莘庄');

INSERT INTO TB_AREA VALUES
('AREA_00102', '上海', '闵行区', '南方商城');

INSERT INTO TB_AREA VALUES
('AREA_00103', '上海', '闵行区', '虹梅路');

INSERT INTO TB_AREA VALUES
('AREA_00104', '上海', '闵行区', '老闵行');

INSERT INTO TB_AREA VALUES
('AREA_00105', '上海', '闵行区', '莘庄龙之梦');

INSERT INTO TB_AREA VALUES
('AREA_00106', '上海', '闵行区', '万源城/东兰路');

INSERT INTO TB_AREA VALUES
('AREA_00107', '上海', '闵行区', '仲盛商业中心');

INSERT INTO TB_AREA VALUES
('AREA_00108', '上海', '闵行区', '春申地区');

INSERT INTO TB_AREA VALUES
('AREA_00109', '上海', '闵行区', '龙柏地区');

INSERT INTO TB_AREA VALUES
('AREA_00110', '上海', '闵行区', '虹桥镇');

INSERT INTO TB_AREA VALUES
('AREA_00111', '上海', '闵行区', '七宝');

INSERT INTO TB_AREA VALUES
('AREA_00112', '上海', '闵行区', '浦江镇');

INSERT INTO TB_AREA VALUES
('AREA_00113', '上海', '闵行区', '交大闵行校区');

INSERT INTO TB_AREA VALUES
('AREA_00114', '上海', '闵行区', '华漕');

INSERT INTO TB_AREA VALUES
('AREA_00115', '上海', '闵行区', '颛桥');

INSERT INTO TB_AREA VALUES
('AREA_00116', '上海', '闵行区', '北桥');

INSERT INTO TB_AREA VALUES
('AREA_00117', '上海', '闵行区', '吴泾');

INSERT INTO TB_AREA VALUES
('AREA_00118', '上海', '闵行区', '好爱广场');

INSERT INTO TB_AREA VALUES
('AREA_00119', '上海', '闵行区', '金平路步行街');

INSERT INTO TB_AREA VALUES
('AREA_00120', '上海', '松江区', '松江镇');

INSERT INTO TB_AREA VALUES
('AREA_00121', '上海', '松江区', '松江大学城');

INSERT INTO TB_AREA VALUES
('AREA_00122', '上海', '松江区', '佘山');

INSERT INTO TB_AREA VALUES
('AREA_00123', '上海', '松江区', '九亭');

INSERT INTO TB_AREA VALUES
('AREA_00124', '上海', '松江区', '泗泾');

INSERT INTO TB_AREA VALUES
('AREA_00125', '上海', '松江区', '泰晤士小镇');

INSERT INTO TB_AREA VALUES
('AREA_00126', '上海', '松江区', '松江万达');

INSERT INTO TB_AREA VALUES
('AREA_00127', '上海', '松江区', '新桥');

INSERT INTO TB_AREA VALUES
('AREA_00128', '上海', '松江区', '开元地中海');

INSERT INTO TB_AREA VALUES
('AREA_00129', '上海', '松江区', '松东路');

INSERT INTO TB_AREA VALUES
('AREA_00130', '上海', '松江区', '江学路');

INSERT INTO TB_AREA VALUES
('AREA_00131', '上海', '松江区', '荣乐中路');

INSERT INTO TB_AREA VALUES
('AREA_00132', '上海', '松江区', '中山中路');

INSERT INTO TB_AREA VALUES
('AREA_00133', '上海', '松江区', '人民北路');

INSERT INTO TB_AREA VALUES
('AREA_00134', '上海', '松江区', '飞航广场');

INSERT INTO TB_AREA VALUES
('AREA_00135', '上海', '松江区', '新松江路');

INSERT INTO TB_AREA VALUES
('AREA_00136', '上海', '松江区', '鹿都国际商业广场');

INSERT INTO TB_AREA VALUES
('AREA_00137', '上海', '嘉定区', '南翔');

INSERT INTO TB_AREA VALUES
('AREA_00138', '上海', '嘉定区', '安亭');

INSERT INTO TB_AREA VALUES
('AREA_00139', '上海', '嘉定区', '嘉定镇');

INSERT INTO TB_AREA VALUES
('AREA_00140', '上海', '嘉定区', '江桥');

INSERT INTO TB_AREA VALUES
('AREA_00141', '上海', '嘉定区', '丰庄');

INSERT INTO TB_AREA VALUES
('AREA_00142', '上海', '嘉定区', '罗宾森广场');

INSERT INTO TB_AREA VALUES
('AREA_00143', '上海', '嘉定区', '博乐广场');

INSERT INTO TB_AREA VALUES
('AREA_00144', '上海', '嘉定区', '马陆');

INSERT INTO TB_AREA VALUES
('AREA_00145', '上海', '嘉定区', '新源路');

INSERT INTO TB_AREA VALUES
('AREA_00146', '上海', '嘉定区', '戬浜');

INSERT INTO TB_AREA VALUES
('AREA_00147', '上海', '嘉定区', '黄渡');

INSERT INTO TB_AREA VALUES
('AREA_00148', '上海', '嘉定区', '嘉定新城');

INSERT INTO TB_AREA VALUES
('AREA_00149', '上海', '青浦区', '朱家角');

INSERT INTO TB_AREA VALUES
('AREA_00150', '上海', '青浦区', '青浦城区');

INSERT INTO TB_AREA VALUES
('AREA_00151', '上海', '青浦区', '徐泾');

INSERT INTO TB_AREA VALUES
('AREA_00152', '上海', '青浦区', '赵巷');

INSERT INTO TB_AREA VALUES
('AREA_00153', '上海', '青浦区', '华新');

INSERT INTO TB_AREA VALUES
('AREA_00154', '上海', '青浦区', '重固');

INSERT INTO TB_AREA VALUES
('AREA_00155', '上海', '奉贤区', '南桥');

INSERT INTO TB_AREA VALUES
('AREA_00156', '上海', '奉贤区', '百联南桥购物中心');

INSERT INTO TB_AREA VALUES
('AREA_00157', '上海', '奉贤区', '西渡');

INSERT INTO TB_AREA VALUES
('AREA_00158', '上海', '奉贤区', '易买得');

INSERT INTO TB_AREA VALUES
('AREA_00159', '上海', '奉贤区', '环城东路');

INSERT INTO TB_AREA VALUES
('AREA_00160', '上海', '奉贤区', '环城南路');

INSERT INTO TB_AREA VALUES
('AREA_00161', '上海', '奉贤区', '正阳世纪星城');

INSERT INTO TB_AREA VALUES
('AREA_00162', '上海', '奉贤区', '新都汇');

INSERT INTO TB_AREA VALUES
('AREA_00163', '上海', '奉贤区', '南桥新城区');

INSERT INTO TB_AREA VALUES
('AREA_00164', '上海', '奉贤区', '海湾旅游区');

INSERT INTO TB_AREA VALUES
('AREA_00165', '上海', '金山区', '金山卫');

INSERT INTO TB_AREA VALUES
('AREA_00166', '上海', '金山区', '卫零路');

INSERT INTO TB_AREA VALUES
('AREA_00167', '上海', '金山区', '蒙山路');

INSERT INTO TB_AREA VALUES
('AREA_00168', '上海', '金山区', '卫清路');

INSERT INTO TB_AREA VALUES
('AREA_00169', '上海', '金山区', '金山嘴');

INSERT INTO TB_AREA VALUES
('AREA_00170', '上海', '金山区', '朱泾');

INSERT INTO TB_AREA VALUES
('AREA_00171', '上海', '金山区', '石化');

INSERT INTO TB_AREA VALUES
('AREA_00172', '上海', '金山区', '金山新城');

INSERT INTO TB_AREA VALUES
('AREA_00173', '上海', '金山区', '枫泾');

INSERT INTO TB_AREA VALUES
('AREA_00174', '上海', '金山区', '朱行');

INSERT INTO TB_AREA VALUES
('AREA_00175', '上海', '金山区', '亭林');

INSERT INTO TB_AREA VALUES
('AREA_00176', '上海', '崇明县', '南门');

INSERT INTO TB_AREA VALUES
('AREA_00177', '上海', '崇明县', '东滩/前哨农场');

INSERT INTO TB_AREA VALUES
('AREA_00178', '上海', '崇明县', '陈家镇');

INSERT INTO TB_AREA VALUES
('AREA_00179', '上海', '崇明县', '堡镇');

INSERT INTO TB_AREA VALUES
('AREA_00180', '上海', '崇明县', '长兴岛');

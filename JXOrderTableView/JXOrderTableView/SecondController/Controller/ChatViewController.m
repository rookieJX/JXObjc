//
//  ChatViewController.m
//  JXOrderTableView
//
//  Created by 王加祥 on 16/10/1.
//  Copyright © 2016年 王加祥. All rights reserved.
//

#import "ChatViewController.h"
#import "SecondDatasourceAndDelegate.h"
#import "FirstCell.h"
#import "FirstModel.h"


/** 屏幕宽度 */
#define kWidth [UIScreen mainScreen].bounds.size.width
/** 屏幕高度 */
#define kHeight [UIScreen mainScreen].bounds.size.height
/** 屏幕尺寸 */
#define kScreen [UIScreen mainScreen].bounds


@interface ChatViewController ()
/** viewController */
@property (nonatomic,weak) UITableView * tableView;
/** 接收数据模型 */
@property (nonatomic,strong) NSMutableArray * items;
/** 数据代理模型 */
@property (nonatomic,strong) SecondDatasourceAndDelegate * cellArrayDataSource;

@end

@implementation ChatViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // 设置标签项的标题
        self.tabBarItem.title = @"Hypnotize";
        
        // 从图片文件创建一个 UIImage 对象
        UIImage * i = [UIImage imageNamed:@"Hypno"];
        
        // 将 UIImage 对象赋值给标签项的 iamge 属性
        self.tabBarItem.image = i;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    
    [self setupView];
}

// 模拟下载数据
- (void)loadData {
    // 模拟下载数据
    NSArray * array = @[
                        @{
                            @"firstGrade":@"12",
                            @"firstNickName":@"兰亭序",
                            @"firstContent":@"永和九年，岁在癸丑，暮春之初，会于会稽山阴之兰亭，修禊事也。群贤毕至，少长咸集。此地有崇山峻岭，茂林修竹，又有清流激湍，映带左右。引以为流觞曲水，列坐其次。虽无丝竹管弦之盛，一觞一咏，亦足以畅叙幽情。"
                            },
                        @{
                            @"firstGrade":@"2",
                            @"firstNickName":@"石壕吏",
                            @"firstContent":@"暮投石壕村，有吏夜捉人。老翁逾墙走，老妇出门看。\n吏呼一何怒，妇啼一何苦。听妇前致词，三男邺城戍。\n一男附书至，二男新战死。存者且偷生，死者长已矣。\n室中更无人，惟有乳下孙。有孙母未去，出入无完裙。\n老妪力虽衰，请从吏夜归。急应河阳役，犹得备晨炊。\n夜久语声绝，如闻泣幽咽。天明登前途，独与老翁别。"
                            },
                        @{
                            @"firstGrade":@"16",
                            @"firstNickName":@"帝京篇",
                            @"firstContent":@"山河千里国，城阙九重门。\n不睹皇居壮，安知天子尊。\n皇居帝里崤函谷，鹑野龙山侯甸服。\n五纬连影集星躔，八水分流横地轴。\n秦塞重关一百二，汉家离宫三十六。\n桂殿嶔岑对玉楼，椒房窈窕连金屋。\n三条九陌丽城隈，万户千门平旦开。\n复道斜通鳷鹊观，交衢直指凤凰台。"
                            },
                        @{
                            @"firstGrade":@"10",
                            @"firstNickName":@"点绛唇·金谷年年",
                            @"firstContent":@"金谷年年，乱生春色谁为主？余花落处，满地和烟雨。又是离歌，一阕长亭暮。王孙去，萋萋无数，南北东西路。"
                            },
                        @{
                            @"firstGrade":@"12",
                            @"firstNickName":@"兰亭序",
                            @"firstContent":@"永和九年，岁在癸丑，暮春之初，会于会稽山阴之兰亭，修禊事也。群贤毕至，少长咸集。此地有崇山峻岭，茂林修竹，又有清流激湍，映带左右。引以为流觞曲水，列坐其次。虽无丝竹管弦之盛，一觞一咏，亦足以畅叙幽情。"
                            },
                        @{
                            @"firstGrade":@"12",
                            @"firstNickName":@"兰亭序",
                            @"firstContent":@"永和九年，岁在癸丑，暮春之初，会于会稽山阴之兰亭，修禊事也。群贤毕至，少长咸集。此地有崇山峻岭，茂林修竹，又有清流激湍，映带左右。引以为流觞曲水，列坐其次。虽无丝竹管弦之盛，一觞一咏，亦足以畅叙幽情。"
                            },
                        @{
                            @"firstGrade":@"12",
                            @"firstNickName":@"兰亭序",
                            @"firstContent":@"永和九年，岁在癸丑，暮春之初，会于会稽山阴之兰亭，修禊事也。群贤毕至，少长咸集。此地有崇山峻岭，茂林修竹，又有清流激湍，映带左右。引以为流觞曲水，列坐其次。虽无丝竹管弦之盛，一觞一咏，亦足以畅叙幽情。"
                            },
                        @{
                            @"firstGrade":@"12",
                            @"firstNickName":@"兰亭序",
                            @"firstContent":@"永和九年，岁在癸丑，暮春之初，会于会稽山阴之兰亭，修禊事也。群贤毕至，少长咸集。此地有崇山峻岭，茂林修竹，又有清流激湍，映带左右。引以为流觞曲水，列坐其次。虽无丝竹管弦之盛，一觞一咏，亦足以畅叙幽情。"
                            },
                        @{
                            @"firstGrade":@"12",
                            @"firstNickName":@"兰亭序",
                            @"firstContent":@"永和九年，岁在癸丑，暮春之初，会于会稽山阴之兰亭，修禊事也。群贤毕至，少长咸集。此地有崇山峻岭，茂林修竹，又有清流激湍，映带左右。引以为流觞曲水，列坐其次。虽无丝竹管弦之盛，一觞一咏，亦足以畅叙幽情。"
                            },
                        @{
                            @"firstGrade":@"12",
                            @"firstNickName":@"兰亭序",
                            @"firstContent":@"永和九年，岁在癸丑，暮春之初，会于会稽山阴之兰亭，修禊事也。群贤毕至，少长咸集。此地有崇山峻岭，茂林修竹，又有清流激湍，映带左右。引以为流觞曲水，列坐其次。虽无丝竹管弦之盛，一觞一咏，亦足以畅叙幽情。"
                            },
                        @{
                            @"firstGrade":@"12",
                            @"firstNickName":@"兰亭序",
                            @"firstContent":@"永和九年，岁在癸丑，暮春之初，会于会稽山阴之兰亭，修禊事也。群贤毕至，少长咸集。此地有崇山峻岭，茂林修竹，又有清流激湍，映带左右。引以为流觞曲水，列坐其次。虽无丝竹管弦之盛，一觞一咏，亦足以畅叙幽情。"
                            },
                        @{
                            @"firstGrade":@"12",
                            @"firstNickName":@"兰亭序",
                            @"firstContent":@"永和九年，岁在癸丑，暮春之初，会于会稽山阴之兰亭，修禊事也。群贤毕至，少长咸集。此地有崇山峻岭，茂林修竹，又有清流激湍，映带左右。引以为流觞曲水，列坐其次。虽无丝竹管弦之盛，一觞一咏，亦足以畅叙幽情。"
                            },
                        @{
                            @"firstGrade":@"12",
                            @"firstNickName":@"兰亭序",
                            @"firstContent":@"永和九年，岁在癸丑，暮春之初，会于会稽山阴之兰亭，修禊事也。群贤毕至，少长咸集。此地有崇山峻岭，茂林修竹，又有清流激湍，映带左右。引以为流觞曲水，列坐其次。虽无丝竹管弦之盛，一觞一咏，亦足以畅叙幽情。"
                            },
                        @{
                            @"firstGrade":@"12",
                            @"firstNickName":@"兰亭序",
                            @"firstContent":@"永和九年，岁在癸丑，暮春之初，会于会稽山阴之兰亭，修禊事也。群贤毕至，少长咸集。此地有崇山峻岭，茂林修竹，又有清流激湍，映带左右。引以为流觞曲水，列坐其次。虽无丝竹管弦之盛，一觞一咏，亦足以畅叙幽情。"
                            },
                        @{
                            @"firstGrade":@"12",
                            @"firstNickName":@"兰亭序",
                            @"firstContent":@"永和九年，岁在癸丑，暮春之初，会于会稽山阴之兰亭，修禊事也。群贤毕至，少长咸集。此地有崇山峻岭，茂林修竹，又有清流激湍，映带左右。引以为流觞曲水，列坐其次。虽无丝竹管弦之盛，一觞一咏，亦足以畅叙幽情。"
                            },
                        @{
                            @"firstGrade":@"12",
                            @"firstNickName":@"兰亭序",
                            @"firstContent":@"永和九年，岁在癸丑，暮春之初，会于会稽山阴之兰亭，修禊事也。群贤毕至，少长咸集。此地有崇山峻岭，茂林修竹，又有清流激湍，映带左右。引以为流觞曲水，列坐其次。虽无丝竹管弦之盛，一觞一咏，亦足以畅叙幽情。"
                            },
                        @{
                            @"firstGrade":@"12",
                            @"firstNickName":@"兰亭序",
                            @"firstContent":@"永和九年，岁在癸丑，暮春之初，会于会稽山阴之兰亭，修禊事也。群贤毕至，少长咸集。此地有崇山峻岭，茂林修竹，又有清流激湍，映带左右。引以为流觞曲水，列坐其次。虽无丝竹管弦之盛，一觞一咏，亦足以畅叙幽情。"
                            },
                        @{
                            @"firstGrade":@"12",
                            @"firstNickName":@"兰亭序",
                            @"firstContent":@"永和九年，岁在癸丑，暮春之初，会于会稽山阴之兰亭，修禊事也。群贤毕至，少长咸集。此地有崇山峻岭，茂林修竹，又有清流激湍，映带左右。引以为流觞曲水，列坐其次。虽无丝竹管弦之盛，一觞一咏，亦足以畅叙幽情。"
                            }
                        
                        ];
    
    for (NSDictionary * dict in array) {
        FirstModel * model = [FirstModel modelWithDict:dict];
        [self.items addObject:model];
    }
    
    [self.tableView reloadData];
    
}

- (void)setupView {
    
    self.cellArrayDataSource = [[SecondDatasourceAndDelegate alloc] initWithArray:self.items cellIdentifier:@"secondCell"];
    
    [self.tableView registerClass:[FirstCell class] forCellReuseIdentifier:@"secondCell"];
    
    [self.cellArrayDataSource handleTableViewDataSourceAndDelegate:self.tableView];
}
#pragma mark - 懒加载
- (UITableView *)tableView{
    if (_tableView == nil) {
        UITableView * tableView = [[UITableView alloc] initWithFrame:kScreen style:UITableViewStylePlain];
        [self.view addSubview:tableView];
        // 由于是weak属性的全局变量，一定要重新赋值 赋值 赋值。
        _tableView = tableView;
    }
    return _tableView;
}

- (NSMutableArray *)items{
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}

@end

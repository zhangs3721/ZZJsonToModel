#import "ViewController.h"
#import "ZZJsonToModel.h"
#import "MJExtension.h"
#import "YYModel.h"

//#import "HomeModel.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.模拟返回的 json
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"JSONSS" ofType:@"json"]];
    id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    // 2.生成文件存放的路径
#warning 此地址为 mac 文件夹地址，地址错误报错为 The folder “XXX.h” doesn’t exist.（暂时仅支持模拟器生成 model 文件，正在完善中。。。）
    NSURL *path = [NSURL URLWithString:@"/Users/zhang/Desktop/ZZJsonToModel/ZZJsonToModel"];
        
    // 3.调用方法
    __block BOOL isSuccess = NO;
    double times = [ZZJsonToModel modelWithSpendTime:^{ // 计算代码耗时
        isSuccess = [ZZJsonToModel zz_createYYModelWithJson:json fileName:@"HomeModel" extensionName:@"class" fileURL:path error:^(NSError *error) {
            NSLog(@"error = %@",error.localizedDescription);
        }];
    }];
    NSLog(@"ZZJsonToModel spend time = %f 秒",times);
    
//    if (isSuccess) {
//        // 4.生成model
//        __block HomeModel *model = nil;
//        double times = [ZZJsonToModel modelWithSpendTime:^{ // 计算代码耗时
//            model = [HomeModel yy_modelWithJSON:json];
//        }];
//        NSLog(@"Model spend time = %f 秒",times);
//    }
}

@end

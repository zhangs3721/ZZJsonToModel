#import "ViewController.h"
#import "ZZJsonToModel.h"

#import "YYModel.h"
#import "TestModel.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.模拟返回的 json
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"JSON" ofType:@"json"]];
    id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    // 2.生成文件存放的路径
    NSURL *path = [NSURL URLWithString:@"/Users/zhang/Desktop/ZZJsonToModel/ZZJsonToModel"];
    // 3.调用方法
    __block BOOL isSuccess = NO;
    double times = [ZZJsonToModel modelWithSpendTime:^{ // 计算代码耗时
        isSuccess = [ZZJsonToModel modelWithFileName:@"test" extensionName:@"class" json:json fileURL:path error:nil];
    }];
    NSLog(@"ZZJsonToModel spend time = %f 秒",times);
    
    if (isSuccess) {
        // 4.生成model
        double times = [ZZJsonToModel modelWithSpendTime:^{ // 计算代码耗时
            TestModel *model = nil;
            model = [TestModel yy_modelWithJSON:json];
        }];
        NSLog(@"YYModel spend time = %f 秒",times);
    }
}

@end

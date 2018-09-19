#import "ViewController.h"
#import "ZZJsonToModel.h"

#import "YYModel.h"
#import "TestModel.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"启动程序");
    // 1.模拟返回的 json
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"JSONSS" ofType:@"json"]];
    id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"获取json");
    // 2.生成文件存放的路径
    NSURL *path = [NSURL URLWithString:@"/Users/zhang/Desktop/ZZMonster/ZZJsonToModel"];
    
    /*  3.调用方法
     *  FileName: 文件名
     *  ExtensionClassName: 为预防自动生成的类名重复。例Authors类后加后缀->AuthorsClass，不会污染数据。
     *  Json: 请求到的json，默认是（NSDictionary *）json。
     *  URL: 生成文件存放的路径。
     *  error: 生成文件发生错误
     */
    NSError *error = nil;
    [ZZJsonToModel writeClassObjectsWithFileName:@"TestModel" withExtensionClassName:@"class" withJson:json toFileURL:path error:&error];
    NSLog(@"生成model");
    
    if (error) {
        NSLog(@"error = %@",error.localizedDescription);
    }else {
        // 4.生成model
        TestModel *model = nil;
        model = [TestModel yy_modelWithJSON:json];
        NSLog(@"yes");
    }
}

@end

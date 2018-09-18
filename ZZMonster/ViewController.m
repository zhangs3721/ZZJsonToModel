#import "ViewController.h"
#import "YYModel.h"
#import "ZZWriter.h"
//#import "BaseModel.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1.模拟返回的 json
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"JSON" ofType:@"json"]];
    id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    // 2.生成文件存放的路径
    NSURL *path = [NSURL URLWithString:@"/Users/zhang/Desktop/ZZMonster/ZZMonster/models"];
    
    /*  3.调用方法
     *  FileName: 文件名
     *  ExtensionClassName: 为预防自动生成的类名重复。例Authors类后加后缀->AuthorsClass，不会污染数据。
     *  Json: 请求到的json，默认是（NSDictionary *）json。
     *  URL: 生成文件存放的路径。
     *  error: 生成文件发生错误
    */
    NSError *error = nil;
    [ZZWriter writeClassObjectsWithFileName:@"BaseModel" withExtensionClassName:@"class" withJson:json toFileURL:path error:&error];
    
    if (error) {
        NSLog(@"error = %@",error.localizedDescription);
    }else {
        // 4.生成model
//        BaseModel *model = nil;
//        model = [BaseModel yy_modelWithJSON:json];
        NSLog(@"yes");
    }
}

@end

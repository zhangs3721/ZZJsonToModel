# iOS自动生成Model（ZZJsonToModel/ZZMonster兼容YYModel）

纯代码编写，无需安装任何插件，一个方法轻松搞定复杂Json转Model。（兼容[YYModel](https://github.com/ibireme/YYModel)）

## 示例：
### json示例：

```json
{
  "author" : {
    "bools" : true,
    "author" : {
      "authors" : {
        "author" : 19.100000000000001
      },
      "author" : "zzz"
    }
  },
  "pages" : 256,
  "book_name" : "Harry Potter",
  "book_info" : [
    {
      "one" : "this is one day"
    },
    {
      "one" : 10,
      "id" : "this is id"
    }
  ]
}
```

生成model图：
![生成model图](https://upload-images.jianshu.io/upload_images/5173163-f81d1de1e64b9a1d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


**注：** 示例的json中，有几点特殊。

* 1.重复的key值`author `。
* 2.特殊key值`id`。
* 3.数组`book_info`中的key值`one`的类型不同。
* 4.类名后缀`+Class`。

处理方法：

* 1.重复的key值生成的类名，从第二个类起，类名前加一个`Z`。
* 2.属性名是系统保留字的，全部大写，因为大写不影响智能提示。
* 3.如果数组中相同层级的key值类型不同，统一转化为字符串。
* 4.项目不同.h文件中类名相同会引发报错，类名并不会污染数据，建议加上类名后缀。（随机字符串也可以）


## 使用ZZMonster概要
### 1.下载[ZZJsonToModel](https://github.com/zhangs3721/ZZMonster)并导入项目中。ZZMonster目录：
![ZZMonster目录](https://upload-images.jianshu.io/upload_images/5173163-5e81d033c36d52cf.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 2.导入头文件 `#import "ZZWriter.h"`，调用此方法：

```objectivec
/*  调用方法
 *  FileName: 文件名
 *  ExtensionClassName: 为预防自动生成的类名重复。例Authors类后加后缀->AuthorsClass，不会污染数据。
 *  Json: 请求到的json，默认是（NSDictionary *）json。
 *  URL: 生成文件存放的路径。
 *  error: 生成文件发生错误
 */
+ (void)writeClassObjectsWithFileName:(NSString *)fileName withExtensionClassName:(NSString *)extensionName  withJson:(NSDictionary *)json toFileURL:(NSURL *)url error:(NSError **)error;

```
如图：
![调用主方法](https://upload-images.jianshu.io/upload_images/5173163-413ef5aa4ba27598.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 3.导入生成好的model文件：

![导入生成好的model文件](https://upload-images.jianshu.io/upload_images/5173163-0364861d3c9bc845.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 4.引用.h `#import "BaseModel.h"`后，使用YYModel。

![引用.h `#import "BaseModel.h"`后，使用YYModel](https://upload-images.jianshu.io/upload_images/5173163-2ec79e2304084259.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)




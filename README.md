## DJPictureViewer
* A PictureViewer Which is easy to realize, You can show photo or image or waterfallsflow in 
a few lines of code with it.
* 一个实现起来比较简单地图片查看器，仅仅几行代码你就可以轻松实现一个转换图片的过程中会有交叠重影效果的查看图片的功能。
* 代码优化后仅需一行代码就可以实现显示带有过程动画的图片显示功能。
* 新版本更新，先支持自定义瀑布流样式实现方式，可按照自己想要的样式私人订制一款属于您自己的瀑布流。
    * 仅通过返回每一个item的高就可以实现默认瀑布流效果，其他效果可通过自定义实现。
    * 可以自定义瀑布流列数。
    * 可以自定义瀑布流列间距、行间距、边缘间距。

## <a id="如何使用DJPictureViewer"></a>如何使用DJPictureViewer
* cocoapods导入：`pod 'DJPictureViewer'`
* 手动导入：
    * 将`DJPictureViewer`文件夹中的所有文件拽入项目中
    * 导入主头文件：`#import "DJPictureViewer.h"`

##详细使用方法（详细用法可参考示例--DJPictureViewerExample）

###瀑布流代码实现方法

```objc

// 创建布局
DJWaterfallsflowLayout *layout = [[DJWaterfallsflowLayout alloc] init];
layout.delegate = self;

// 创建CollectionView
UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];

```
#####实现代理方法（必须实现）

```objc

#pragma mark - <DJWaterfallsflowLayoutDelegate>（返回每个item的高度）
- (CGFloat)waterflowLayout:(DJWaterfallsflowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth
{
DJLayoutModel *layoutModel = self.dataArr[index];

return itemWidth * layoutModel.height / layoutModel.width;
}

```
#####以下为自定义可选实现方法

```objc

/** 返回瀑布流列数 */ //（可选自定义）
- (CGFloat)columnCountInWaterflowLayout:(DJWaterfallsflowLayout *)waterflowLayout
{
return 3;
}

/** 返回竖直间距 */
- (CGFloat)columnMarginInWaterflowLayout:(DJWaterfallsflowLayout *)waterflowLayout
{
return 10;
}

/** 返回水平间距 */
- (CGFloat)rowMarginInWaterflowLayout:(DJWaterfallsflowLayout *)waterflowLayout
{
return 10;
}

/** 返回边缘间距 */
- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(DJWaterfallsflowLayout *)waterflowLayout
{
return UIEdgeInsetsMake(10, 10, 10, 10);
}

```


### 查看图片代码实现

```objc

//你的图片数据源
NSArray *imageArr = @[@"example1",@"example2",@"example3",@"example4",@"example5"];

//图片查看（仅需一行代码）
DJPicture *pictureView = [[DJPicture alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) imgArr:imageArr];
[self.view addSubview:pictureView];

//选择控制定时器开关(默认关闭，如果需要在这里设置定时滚播)
//    pictureViewer.startTimer = YES;

```

## 提醒
* 兼容的系统支持>=iOS7.0

## <a id="期待"></a>期待
* 如果在使用过程中遇到BUG，希望你能Issues我，谢谢（或者尝试下载最新的框架代码看看BUG修复没有）
* 如果在使用过程中发现功能不够用，希望你能Issues我，我非常想为这个框架增加更多好用的功能，谢谢
* 如果你想为DJPictureViewer输出代码，请拼命Pull Requests我
* 本功能正在不断完善中，以后会持续更新，希望在以后的时光里将此功能完善的更人性化，功能更加的强大。让我们共同维护。
* 如果感觉还可以的话欢迎star，灰常感谢~

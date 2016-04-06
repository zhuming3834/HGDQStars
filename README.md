# HGDQStars
HGDQStars
制作的一种星星评分控件。控件的使用和简单<br>
```OC
 HGDQStars *view = [[HGDQStars alloc] initWithFrame:CGRectMake(100, 100, 100, 20) currentScore:3 delegate:self];  
 [self.view addSubview:view]; 
 ```
 这样控件就显示在视图上面了。<br>
 需要关联一下控件的代理StarRatingViewDelegate，这样控件滑动的时候，我们就知道目前的分数了。<br>
 效果图<br>
 ![](https://github.com/zhuming3834/HGDQStars/blob/master/20160308154009511.gif)<br>

详细的使用和实现，可看我的博客[《【iOS】星星评分控件HGDQStars》](http://blog.csdn.net/zhuming3834/article/details/50827675)<br>


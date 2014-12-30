iOS_3rdTrackingBlocker
======================

第三方SDK反跟踪插件，可以查看或屏蔽第三方SDK的上报。目前支持的SDK：

1. MobClick (3.1.9)
2. MTA (1.4.1)

编译好的deb下载：[com.zzz.3rdtrackingblocker_1.0_iphoneos-arm.deb](http://blog.imaou.com/uploads/com.zzz.3rdtrackingblocker_1.0_iphoneos-arm.deb)

----------

禁用后输出如下：

### MobClick (UMeng)

~~~
Umeng: analytics sdk version 3.1.9 , app version 1.1.1001
Umeng: appkey can not be found or not valid. MobClick methods must be called after [MobClick startWithAppkey:]!
~~~

### MTA (Tencent)

~~~
MTA is not enabled , because of the online config
~~~

----------

如果有其他SDK需要支持，请提一个issues

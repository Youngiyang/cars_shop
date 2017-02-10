##项目说明
此项目为电商汽车项目第一个demo版本，具有的功能为在线选车，在线下单，联系客服等一些常规功能，后台有汽车管理，订单管理等功能，暂时不做商用，可以给rails开发后或者初学者当一个练手的demo，有不懂的问题欢迎来找我一起讨论。

##项目前端预览
###前端页面
![前端预览图](http://7xt7pr.com1.z0.glb.clouddn.com/preview.jpg)
![前端预览图](http://7xt7pr.com1.z0.glb.clouddn.com/preview2.jpg)
![前端预览图](http://7xt7pr.com1.z0.glb.clouddn.com/preview3.jpg)
![前端预览图](http://7xt7pr.com1.z0.glb.clouddn.com/preview4.jpg)
###后台页面
![前端预览图](http://7xt7pr.com1.z0.glb.clouddn.com/preview5.jpg)
![前端预览图](http://7xt7pr.com1.z0.glb.clouddn.com/preview6.jpg)
![前端预览图](http://7xt7pr.com1.z0.glb.clouddn.com/preview7.jpg)
![前端预览图](http://7xt7pr.com1.z0.glb.clouddn.com/preview8.jpg)

##数据库设计
详见 https://www.zybuluo.com/FoxZhao/note/483844

##环境依赖
* rails
* postgresql

## 开发环境执行流程
1.安装项目依赖

 `bundle install`

2.执行迁移文件

 `rake db:migrate`

3.执行测试数据

注释掉photo.rb中以下两行

`before_validation { self.name = img_url.send(:original_filename) }`
`mount_uploader :img_url, ImageUploader`

执行测试数据

`rake test_datas:init`

4.运行rails s
`rails s -b 0.0.0.0`

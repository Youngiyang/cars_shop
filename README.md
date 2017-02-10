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
##products（货品表）
|字段名|类型|含义|备注|默认值
|--|--|--|--|
|id|int
|name|string|货品名|例：宝马X6
|brand_id|int|品牌ID|
|img_url|string|货品图片
|content_photo_ids|string|内容中显示的图片ID|多个ID用逗号分隔
|category_id|int|分类ID|
|is_hot|boolean|是否热门||false
|is_recommended|boolean|是否推荐||false
|recommended_sub_title|string|推荐副标题|is_recommended为true时为必填
|recommended_words|string|推荐词|is_recommended为true时为必填
|slogan|string|标语
|min_price|decimal|最低价

##auth_codes(短信验证码表)
|字段名|类型|含义|备注|默认值
|--|--|--|--|
|id|int
|mobile|string|手机号
|code|string|验证码
|auth_state|Boolean|是否已验证|true为已验证|false
|sent_at|datetime|发送时间
|expire_at|datetime|过期时间

##goods（商品表）
|字段名|类型|含义|备注|默认值
|--|--|--|--|
|id|int
|product_id|int|
|name|string|商品名|例：宝马X6 3.0L旗舰版
|photo_ids|string|相册中的图片ID|多个ID用逗号分隔
|source_from|string|商品产地|
|current_price|decimal|现价|
|market_price|decimal|市场价
|extra_configration|string|更多配置|多个用逗号隔开
|registered_info|string|上牌五证|多个用逗号隔开
|in_stock|boolean|是否现货||false
|status|int|状态|0：正常，1：下架，2：删除|0

##categories(分类表)
|字段名|类型|含义|备注|默认值
|--|--|--|--|
|id|int
|name|string|分类名|
|parent_id|int|父类ID||0
|description|text|分类描述|
|sort_order|int|排序|

##attrs(属性表)
|字段名|类型|含义|备注|默认值
|--|--|--|--|
|id|int
|key|string|属性名|例如：车身长度
|group_num|int|属性分组
|is_default|boolean|是否为默认属性|默认属性不可删除
> group_num对应关系 0: 基本参数， 1：车身， 2：发动机， 3：变速箱， 4：底盘转向，5：车轮制动，6：重要配置，7：更多配置

##attr_options（属性选项表）
|字段名|类型|含义|备注|默认值
|--|--|--|--|
|id|int
|attr_id|int|属性ID|
|value|string|选项值


##good_attr_options(商品属性选项关联表)
|字段名|类型|含义|备注|默认值
|--|--|--|--|
|id|int
|good_id|int|商品ID
|attr_option_id|属性选项ID|

##brands(品牌表)
|字段名|类型|含义|备注|默认值
|--|--|--|--|
|id|int
|en_name|string|英文名
|cn_name|string|中文名
|logo|string|
|sort_order|int|排序
|is_show|boolean|是否显示|为否时显示在更多中
|nationality|string|品牌所属国家|

##specs(规格表)
|字段名|类型|含义|备注|默认值
|--|--|--|--|
|id|int
|name|string|规格名|
|description|text|规格描述|

##product_specs(货品规格关系表)
|字段名|类型|含义|备注|默认值
|--|--|--|--|
|id|int
|product_id|int|货品ID
|spec_id|int|规格ID

##spec_options(规格选项表)
|字段名|类型|含义|备注|默认值
|--|--|--|--|
|id|int
|spec_id|int|所属规格ID|
|value|string|规格选项值

##good_spec_options(商品规格选项关系表)
|字段名|类型|含义|备注|默认值
|--|--|--|--|
|id|int
|good_id|int|所属商品ID
|spec_option_id|int|规格选项ID

##albums(相册表)
|字段名|类型|含义|备注|默认值
|--|--|--|--|
|id|int
|name|string|相册名|
|description|text|相册描述

##photos(图片库表)
|字段名|类型|含义|备注|默认值
|--|--|--|--|
|id|int
|album_id|int|所属相册ID
|name|string|图片名|
|img_url|string|图片链接|

##users(用户表)
|字段名|类型|含义|备注|默认值
|--|--|--|--|
|id|int
|mobile|string|手机号|
|password_digest|string|密码摘要
|user_name|string|用户昵称

##orders(预约表)
|字段名|类型|含义|备注|默认值
|--|--|--|--|
|id|int
|order_cn|string|订单号|年月日时分秒+6位随机数
|user_id|int|用户ID
|good_id|int|商品ID|
|name|string|联系人
|phone_num|string|联系电话
|province_id|integer|省份ID
|city_id|integer|城市ID
|requirements|text|要求
|status|int|订单状态

>@stauts = [['线上预约','1',], ['客服1对1对接','2' ],['线下看车','3'],['意向洽谈','4'],['车款支付','5'],['提车','6'],['拍照办理','7'],['订单完成','8']]

##advertisements(广告表)
|字段名|类型|含义|备注|默认值
|--|--|--|--|
|id|int
|img_url|string|图片链接
|link|string|跳转链接
|description|text|描述
|position|int|显示位置
|sort_order|int|排序

>position：1=> banner, 2: 右侧广告， 3: 明星单品广告

##consultations(咨询表)
|字段名|类型|含义|备注|默认值
|--|--|--|--|
|id|int
|intention|string|意向车型
|province_id|integer|省份ID
|city_id|integer|城市ID
|name|string|姓名
|phone_num|string|联系方式

##order_consultations(联系客服表)
|字段名|类型|含义|备注|默认值
|--|--|--|--|
|id|int
|order_cn|string|所属订单号
|user_id|int|用户ID|
|mobile|string|用户手机号
|description|text|问题描述

##faqs(常见问题解答)
|字段名|类型|含义|备注|默认值
|--|--|--|--|
|id|int
|question|string|问题描述
|answer|text|解答

##环境依赖
* rails
* postgresql

## 开发环境执行流程
1.安装项目依赖
 `bundle install`
2. 执行迁移文件
 `rake db:migrate`
3.执行测试数据
注释掉photo.rb中以下两行
`before_validation { self.name = img_url.send(:original_filename) }`
`mount_uploader :img_url, ImageUploader`
执行测试数据
`rake test_datas:init`
4.运行rails s
`rails s -b 0.0.0.0`

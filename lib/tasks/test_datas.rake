namespace :test_datas do
  desc "add test datas"
  task :init => [:environment] do
    categories = Category.create!([
      { name: "SUV", sort_order: 1 },
      { name: "轿车", sort_order: 2 },
      { name: "跑车", sort_order: 3 },])
    puts ">>>>>>>创建分类完成<<<<<<<<"

    brands = Brand.create!([
      { cn_name: "宝马", logo: Faker::Avatar.image('logo1','50x50','jpg'), sort_order: 1, is_show: true },
      { cn_name: "奔驰", logo: Faker::Avatar.image('logo2','50x50','jpg'), sort_order: 2, is_show: true },
      { cn_name: "玛莎拉蒂", logo: Faker::Avatar.image('logo3','50x50','jpg'), sort_order: 3, is_show: true },
      { cn_name: "保时捷", logo: Faker::Avatar.image('logo4','50x50','jpg'), sort_order: 4, is_show: false },
      { cn_name: "路虎", logo: Faker::Avatar.image('logo5','50x50','jpg'), sort_order: 5, is_show: false }])
    puts ">>>>>>>创建品牌完成<<<<<<<<"

    #默认相册
    album = Album.create!(name: 'default')
    50.times do |i|
      Photo.create!(album_id: album.id,
                    name: 'img'+ i.to_s,
                    img_url: Faker::Avatar.image('car'+ i.to_s, '200x200', 'jpg'))
    end
    puts ">>>>>>>创建相册完成<<<<<<<<"

    #为每个品牌创建5个货品
    brands.each do |brand|
      5.times do |i|
        product = Product.create!(
                        name: brand.cn_name + ("A".."Z").to_a[rand(25)] + (i + 1).to_s,
                        brand_id: brand.id,
                        category_id: categories[rand(3)].id,
                        img_url: Faker::Avatar.image,
                        is_hot: Faker::Boolean.boolean(0.2),
                        is_recommended: Faker::Boolean.boolean(0.2),
                        slogan: Faker::Lorem.sentence,
                        min_price: rand(1000000))
        if product.is_recommended
          product.recommended_words = Faker::Lorem.sentence
          product.recommended_sub_title = Faker::Lorem.word
          product.save!
        end
      end
    end
    puts ">>>>>>>创建products完成<<<<<<<<"

    specs = Spec.create!([
      { name: "燃油" },
      { name: "排量" },
      { name: "外颜色" },
      { name: "内颜色" },
      { name: "可选车型" }
      ])
    puts ">>>>>>>创建specs完成<<<<<<<<"

    #货品与规格关联
    products = Product.all
    products.each do |product|
      specs.each do |spec|
        ProductSpec.create!(product_id: product.id, spec_id: spec.id)
      end
    end
    puts ">>>>>>>创建货品与规格关联完成<<<<<<<<"

    SpecOption.create!([
      { spec_id: 1, value: "汽油" },
      { spec_id: 1, value: "柴油" },
      { spec_id: 2, value: "2.0L" },
      { spec_id: 2, value: "2.4L" },
      { spec_id: 2, value: "3.0L" },
      { spec_id: 2, value: "3.5L" },
      { spec_id: 3, value: "白色" },
      { spec_id: 3, value: "黑色" },
      { spec_id: 3, value: "红色" },
      { spec_id: 3, value: "蓝色" },
      { spec_id: 4, value: "白色" },
      { spec_id: 4, value: "黑色" },
      { spec_id: 4, value: "红色" },
      { spec_id: 4, value: "蓝色" },
      { spec_id: 5, value: Faker::Lorem.word },
      { spec_id: 5, value: Faker::Lorem.word },
      { spec_id: 5, value: Faker::Lorem.word },
      { spec_id: 5, value: Faker::Lorem.word },
      ])
    puts ">>>>>>>创建规格选项完成<<<<<<<<"

    # 规格选项ID的排列组合
    a = [1, 2]
    b = [3, 4, 5, 6]
    c = [7, 8, 9, 10]
    d = [11, 12, 13, 14]
    e = [15, 16, 17, 18]
    results = []
    a.each do |i|
      b.each do |j|
        c.each do |k|
          d.each do |l|
            e.each do |m|
              results << [i, j, k, l, m]
            end
          end
        end
      end
    end

    #group_num对应关系 0: 基本参数， 1：车身， 2：发动机， 3：变速箱， 4：底盘转向，5：车轮制动，6：重要配置，7：更多配置
    attrs = Attr.create!([
      { key: "级别", group_num: 0, is_default: true },
      { key: "发动机", group_num: 0, is_default: true },
      { key: "变速箱", group_num: 0, is_default: true },
      { key: "长*宽*高（mm）", group_num: 0, is_default: true },
      { key: "车身结构", group_num: 0, is_default: true },
      { key: "最高车速（km/h）", group_num: 0, is_default: true },
      { key: "官方0-100km/h加速（s）", group_num: 0, is_default: true },
      { key: "长度（mm）", group_num: 1, is_default: true },
      { key: "宽度（mm）", group_num: 1, is_default: true },
      { key: "高度（mm）", group_num: 1, is_default: true },
      { key: "轴距（mm）", group_num: 1, is_default: true },
      { key: "车门数（个）", group_num: 1, is_default: true },
      { key: "座位数（个）", group_num: 1, is_default: true },
      { key: "发动机型号", group_num: 2, is_default: true },
      { key: "排量（L）", group_num: 2, is_default: true },
      { key: "进气形式", group_num: 2, is_default: true },
      { key: "气缸排列形式", group_num: 2, is_default: true },
      { key: "汽缸数（个）", group_num: 2, is_default: true },
      { key: "每缸气门数（个）", group_num: 2, is_default: true },
      { key: "压缩比", group_num: 2, is_default: true },
      { key: "最大马力（Ps）", group_num: 2, is_default: true },
      { key: "最大功率（kW）", group_num: 2, is_default: true },
      { key: "最大功率转速（rpm）", group_num: 2, is_default: true },
      { key: "最大扭矩（N·m）", group_num: 2, is_default: true },
      { key: "最大扭矩转速（rpm）", group_num: 2, is_default: true },
      { key: "燃料形式", group_num: 2, is_default: true },
      { key: "燃油标号", group_num: 2, is_default: true },
      { key: "供油方式", group_num: 2, is_default: true },
      { key: "缸盖材料", group_num: 2, is_default: true },
      { key: "缸体材料", group_num: 2, is_default: true },
      { key: "档位个数", group_num: 3, is_default: true },
      { key: "变速箱类型", group_num: 3, is_default: true },
      { key: "驱动方式", group_num: 4, is_default: true },
      { key: "四驱形式", group_num: 4, is_default: true },
      { key: "中央差速器结构", group_num: 4, is_default: true },
      { key: "前悬架类型", group_num: 4, is_default: true },
      { key: "后悬架类型", group_num: 4, is_default: true },
      { key: "助力类型", group_num: 4, is_default: true },
      { key: "车体结构", group_num: 4, is_default: true },
      { key: "前制动器类型", group_num: 5, is_default: true },
      { key: "后制动器类型", group_num: 5, is_default: true },
      { key: "驻车制动类型", group_num: 5, is_default: true },
      { key: "轮毂尺寸（英寸）", group_num: 5, is_default: true },
      { key: "备胎", group_num: 5, is_default: true },
      { key: "无钥匙启动系统", group_num: 6, is_default: true },
      { key: "无钥匙进入系统", group_num: 6, is_default: true },
      { key: "天窗", group_num: 6, is_default: true },
      { key: "定速巡航", group_num: 6, is_default: true },
      { key: "驻车雷达", group_num: 6, is_default: true },
      { key: "座椅材质", group_num: 6, is_default: true },
      { key: "驾驶座电动调节", group_num: 6, is_default: true },
      { key: "驾驶座记忆", group_num: 6, is_default: true },
      { key: "副驾驶座电动调节", group_num: 6, is_default: true },
      { key: "前排座椅加热", group_num: 6, is_default: true },
      { key: "前排座椅通风", group_num: 6, is_default: true },
      { key: "GPS导航系统", group_num: 6, is_default: true },
      { key: "多功能方向盘", group_num: 6, is_default: true },
      { key: "中控屏幕", group_num: 6, is_default: true },
      { key: "空调", group_num: 6, is_default: true },
      { key: "近光灯光源类型", group_num: 6, is_default: true },
      { key: "自动感应大灯", group_num: 6, is_default: true },
      { key: "前大灯随动转向功能", group_num: 6, is_default: true },
      { key: "大灯清洗", group_num: 6, is_default: true },
      { key: "后视镜加热", group_num: 6, is_default: true },
      { key: "车身稳定控制", group_num: 6, is_default: true },
      { key: "电动尾门", group_num: 7, is_default: true },
      { key: "倒车影像", group_num: 7, is_default: true },
      { key: "全景天窗", group_num: 7, is_default: true },
      { key: "电动尾门", group_num: 7, is_default: true },
      ])
    puts ">>>>>>>创建属性完成<<<<<<<<"

    attrs.each do |attr|
      3.times do
        AttrOption.create!(attr_id: attr.id,
                           value: Faker::Lorem.word)
      end
    end
    puts ">>>>>>>创建属性选项完成<<<<<<<<"

    # 为每个货品创建商品，包括所有的规格组合
    results_index = (0..results.length-1).to_a
    products.each do |product|
      10.times do
        good = product.goods.create!(
        name: product.name + Faker::Lorem.word,
        photo_ids: rand(1..50).to_s + ',' + rand(1..50).to_s + ',' + rand(1..50).to_s,
        source_from: Faker::Address.country,
        current_price: rand(1000000),
        market_price: rand(1000000),
        registered_info: "a,b,c,d,e",
        in_stock: Faker::Boolean.boolean,
        )
        result = results[results_index.sample]
        result.each do |id|
          GoodSpecOption.create!(good_id: good.id, spec_option_id: id)
        end
        #为商品关联具体属性
        attrs.each do |attr|
          GoodAttrOption.create!(
            good_id: good.id,
            attr_option_id: attr.attr_options[rand(3)].id
            )
        end
      end
      # results.each do |result|
      #   good = product.goods.create!(
      #     name: product.name + Faker::Lorem.word,
      #     photo_ids: rand(1..50).to_s + ',' + rand(1..50).to_s + ',' + rand(1..50).to_s,
      #     source_from: Faker::Address.country,
      #     current_price: rand(1000000),
      #     market_price: rand(1000000),
      #     registered_info: "a,b,c,d,e",
      #     in_stock: Faker::Boolean.boolean,
      #     )
      #   result.each do |id|
      #     GoodSpecOption.create!(good_id: good.id, spec_option_id: id)
      #   end
      #   #为商品关联具体属性
      #   attrs.each do |attr|
      #     GoodAttrOption.create!(
      #       good_id: good.id,
      #       attr_option_id: attr.attr_options[rand(3)].id
      #       )
      #   end
      # end
    end

    #用户表
    User.create!([
      {mobile: '13751124249',user_name: 'hikaru',password: '123456'},
      {mobile: '13751424248',user_name: 'shindou',password: '123456'},
      {mobile: '13751924247',user_name: 'hiro',password: '123456'},
      ])
    puts ">>>>>>>创建用户完成<<<<<<<<"
    #订单测试数据
    User.all.each do |o|
      Good.all.limit(3).each do |g|
        Order.create!(
          user_id: o.id,
          good_id: g.id,
          name: o.user_name,
          phone_num: o.mobile,
          province_id: 1,
          city_id: 1,
          requirements: '1',
          status: 0
        )
      end
    end
  end
end

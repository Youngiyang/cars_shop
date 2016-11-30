namespace :test_datas do
  desc "add test datas"
  task :init => [:environment] do
    categories = Category.create!([
      { name: "SUV", sort_order: 1 },
      { name: "轿车", sort_order: 2 },
      { name: "跑车", sort_order: 3 },])

    brands = Brand.create!([
      { cn_name: "宝马", logo: Faker::Avatar.image('logo','50x50','jpg'), sort_order: 1, is_show: true },
      { cn_name: "奔驰", logo: Faker::Avatar.image('logo','50x50','jpg'), sort_order: 2, is_show: true },
      { cn_name: "玛莎拉蒂", logo: Faker::Avatar.image('logo','50x50','jpg'), sort_order: 3, is_show: true },
      { cn_name: "保时捷", logo: Faker::Avatar.image('logo','50x50','jpg'), sort_order: 4, is_show: false },
      { cn_name: "路虎", logo: Faker::Avatar.image('logo','50x50','jpg'), sort_order: 5, is_show: false }])

    #默认相册
    album = Album.create!(name: 'default')
    50.times do |i|
      Photo.create!(album_id: album.id,
                    name: 'img'+ i.to_s,
                    img_url: Faker::Avatar.image('car','200x200','jpg'))
    end

    #为每个品牌创建5个货品
    brands.each do |brand|
      5.times do |i|
        product = Product.create!(
                        name: brand.cn_name + ("A".."Z").to_a[rand(25)] + (i + 1).to_s,
                        brand_id: brand.id,
                        category_id: categories[rand(2)].id,
                        photo_id: rand(1..50),
                        is_hot: Faker::Boolean.boolean(0.2),
                        is_recommended: Faker::Boolean.boolean(0.2),
                        slogan: Faker::Lorem.sentence,
                        min_price: rand(1000000))
        if product.is_recommended
          product.recommended_words = Faker::Lorem.sentence
          product.save!
        end
      end
    end

    specs = Spec.create!([
      { name: "燃油"},
      { name: "排量"},
      { name: "颜色"}
      ])

    #货品与规格关联
    products = Product.all
    products.each do |product|
      specs.each do |spec|
        ProductSpec.create!(product_id: product.id, spec_id: spec.id)
      end
    end

    SpecOption.create!([
      { spec_id: Spec.first.id, value: "汽油" },
      { spec_id: Spec.first.id, value: "柴油" },
      { spec_id: Spec.second.id, value: "2.0L" },
      { spec_id: Spec.second.id, value: "2.4L" },
      { spec_id: Spec.second.id, value: "3.0L" },
      { spec_id: Spec.second.id, value: "3.5L" },
      { spec_id: Spec.last.id, value: "白色" },
      { spec_id: Spec.last.id, value: "黑色" },
      { spec_id: Spec.last.id, value: "红色" },
      { spec_id: Spec.last.id, value: "蓝色" },
      ])

    # 规格选项ID的排列组合
    a = [1, 2]
    b = [3, 4, 5, 6]
    c = [7, 8, 9, 10]
    n = a.length * b.length * c.length
    results = []
    a.each do |i|
      b.each do |j|
        c.each do |k|
          results << [i, j, k]
        end
      end
    end

    attr_gs = AttrGroup.create!([
      { name: "基本参数" }, { name: "车身" }, { name: "发动机" }])

    attrs = Attr.create!([
      { attr_group_id: attr_gs[0].id, key: "发动机" },
      { attr_group_id: attr_gs[0].id, key: "变速箱" },
      { attr_group_id: attr_gs[0].id, key: "车身结构" },
      { attr_group_id: attr_gs[1].id, key: "长度（mm）" },
      { attr_group_id: attr_gs[1].id, key: "宽度（mm）" },
      { attr_group_id: attr_gs[1].id, key: "高度（mm）" },
      { attr_group_id: attr_gs[2].id, key: "排量（L）" },
      { attr_group_id: attr_gs[2].id, key: "进气形式" },
      { attr_group_id: attr_gs[2].id, key: "气缸排列形式" }
      ])

    attrs.each do |attr|
      3.times do
        AttrOption.create!(attr_id: attr.id,
                           value: Faker::Lorem.word)
      end
    end

    # 为每个货品创建商品，包括所有的规格组合
    products.each do |product|
      results.each do |result|
        good = product.goods.create!(
          name: product.name + Faker::Lorem.word,
          photo_ids: rand(1..50).to_s + ',' + rand(1..50).to_s + ',' + rand(1..50).to_s,
          source_from: Faker::Address.country,
          current_price: rand(1000000),
          market_price: rand(1000000),
          registered_info: "a,b,c,d,e",
          in_stock: Faker::Boolean.boolean,
          )
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
    end
  end
end

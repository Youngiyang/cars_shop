namespace :test_datas do
  desc "add test datas"
  task :add => [:environment] do
    bmw = Brand.create!(en_name: 'BMW', cn_name: '宝马', 
                        logo: 'logo', sort_order: 1 )

    benz = Brand.create!(en_name: 'Mercedes-Benz', cn_name: '梅赛德斯奔驰', 
                         logo: 'logo', sort_order: 2)

    suv = Category.create!(name: 'SUV', sort_order: 1)
    jc = Category.create!(name: '轿车', sort_order: 2)
    bmw_x6 = Product.create!(name: '宝马X6', brand_id: bmw.id,
                             category_id: suv.id, min_price: 0)
    s500 = Product.create!(name: '奔驰S500', brand_id: benz.id,
                           category_id: jc.id, min_price: 0)
    specs = Spec.create!([
      {name: '颜色'}, {name: '燃油'}, {name: '排量'}])

    spec_options = SpecOption.create!([
      {spec_id: specs[0].id, value: '外白色/内红色'},
      {spec_id: specs[0].id, value: '外红色/内棕色'},
      {spec_id: specs[1].id, value: '汽油'},
      {spec_id: specs[1].id, value: '柴油'},
      {spec_id: specs[2].id, value: '3.0T'},
      {spec_id: specs[2].id, value: '3.5T'}])
    ProductSpecOption.create!([
      {product_id: bmw_x6.id, spec_option_id: spec_options[0].id},
      {product_id: bmw_x6.id, spec_option_id: spec_options[1].id},
      {product_id: bmw_x6.id, spec_option_id: spec_options[2].id},
      {product_id: bmw_x6.id, spec_option_id: spec_options[3].id},
      {product_id: bmw_x6.id, spec_option_id: spec_options[4].id},
      {product_id: bmw_x6.id, spec_option_id: spec_options[5].id},
      {product_id: s500.id, spec_option_id: spec_options[0].id},
      {product_id: s500.id, spec_option_id: spec_options[1].id},
      {product_id: s500.id, spec_option_id: spec_options[2].id},
      {product_id: s500.id, spec_option_id: spec_options[3].id},
      {product_id: s500.id, spec_option_id: spec_options[4].id},
      {product_id: s500.id, spec_option_id: spec_options[5].id}])

    goods = Good.create!([
      {product_id: bmw.id, name: '宝马X6 3.0T汽油版', 
       photo_ids: '1,2,3,4', content_photo_ids: '5,6,7,8', 
       source_from: '中东', current_price: 500000,
       market_price: 530000, registered_info: 'a,b,c,d,e'
       },# 外白色/内红色, 汽油, 3.0T
       {product_id: bmw.id, name: '宝马X6 3.0T柴油版', 
       photo_ids: '1,2,3,4', content_photo_ids: '5,6,7,8', 
       source_from: '中东', current_price: 500000,
       market_price: 530000, registered_info: 'a,b,c,d,e'
       },# 外白色/内红色, 柴油, 3.0T
       {product_id: bmw.id, name: '宝马X6 3.5T柴油版', 
       photo_ids: '1,2,3,4', content_photo_ids: '5,6,7,8', 
       source_from: '中东', current_price: 500000,
       market_price: 530000, registered_info: 'a,b,c,d,e'
       },# 外白色/内红色, 柴油, 3.5T
       {product_id: bmw.id, name: '宝马X6 3.T汽油版', 
       photo_ids: '1,2,3,4', content_photo_ids: '5,6,7,8', 
       source_from: '中东', current_price: 500000,
       market_price: 530000, registered_info: 'a,b,c,d,e'
       },# 外红色/内棕色, 汽油, 3.5T
       {product_id: s500.id, name: '宝马X6 3.0T汽油版', 
       photo_ids: '1,2,3,4', content_photo_ids: '5,6,7,8', 
       source_from: '中东', current_price: 500000,
       market_price: 530000, registered_info: 'a,b,c,d,e'
       },# 外白色/内红色, 汽油, 3.0T
       {product_id: s500.id, name: '宝马X6 3.0T柴油版', 
       photo_ids: '1,2,3,4', content_photo_ids: '5,6,7,8', 
       source_from: '中东', current_price: 500000,
       market_price: 530000, registered_info: 'a,b,c,d,e'
       },# 外白色/内红色, 柴油, 3.0T
       {product_id: s500.id, name: '宝马X6 3.5T柴油版', 
       photo_ids: '1,2,3,4', content_photo_ids: '5,6,7,8', 
       source_from: '中东', current_price: 500000,
       market_price: 530000, registered_info: 'a,b,c,d,e'
       },# 外白色/内红色, 柴油, 3.5T
       {product_id: s500.id, name: '宝马X6 3.T汽油版', 
       photo_ids: '1,2,3,4', content_photo_ids: '5,6,7,8', 
       source_from: '中东', current_price: 500000,
       market_price: 530000, registered_info: 'a,b,c,d,e'
       }# 外红色/内棕色, 汽油, 3.5T
       ])

    GoodSpecOption.create!([
      {good_id: goods[0].id, spec_option_id: spec_options[0].id},
      {good_id: goods[0].id, spec_option_id: spec_options[2].id},
      {good_id: goods[0].id, spec_option_id: spec_options[4].id},
      {good_id: goods[1].id, spec_option_id: spec_options[0].id},
      {good_id: goods[1].id, spec_option_id: spec_options[3].id},
      {good_id: goods[1].id, spec_option_id: spec_options[4].id},
      {good_id: goods[2].id, spec_option_id: spec_options[0].id},
      {good_id: goods[2].id, spec_option_id: spec_options[3].id},
      {good_id: goods[2].id, spec_option_id: spec_options[5].id},
      {good_id: goods[3].id, spec_option_id: spec_options[1].id},
      {good_id: goods[3].id, spec_option_id: spec_options[2].id},
      {good_id: goods[3].id, spec_option_id: spec_options[5].id},
      {good_id: goods[4].id, spec_option_id: spec_options[0].id},
      {good_id: goods[4].id, spec_option_id: spec_options[2].id},
      {good_id: goods[4].id, spec_option_id: spec_options[4].id},
      {good_id: goods[5].id, spec_option_id: spec_options[0].id},
      {good_id: goods[5].id, spec_option_id: spec_options[3].id},
      {good_id: goods[5].id, spec_option_id: spec_options[4].id},
      {good_id: goods[6].id, spec_option_id: spec_options[0].id},
      {good_id: goods[6].id, spec_option_id: spec_options[3].id},
      {good_id: goods[6].id, spec_option_id: spec_options[5].id},
      {good_id: goods[7].id, spec_option_id: spec_options[1].id},
      {good_id: goods[7].id, spec_option_id: spec_options[2].id},
      {good_id: goods[7].id, spec_option_id: spec_options[5].id}
      ])
  end
end


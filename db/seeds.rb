# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

pages = [{title: "Цветной лом", slug: "colored_scrap"}, {title: "Редкоземельный металл", slug: "rare_earth_metal"},
         {title: "Черный лом", slug: "black_scrap"}, {title: "Реализация готовой продукции", slug: "sale_products"},
         {title: "Услуги", slug: "services"}, {title: "Контакты", slug: "contacts"}, {title: "Вакансии", slug: "vacancy"}]

pages.each do |page|
  Page.create(page)
end

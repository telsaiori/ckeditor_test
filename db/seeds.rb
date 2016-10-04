# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
1
2
3
Guestbook.create!(name: 'test1', post: 'これは本文です')
Guestbook.create!(name: 'test2', post: 'テクマクマヤコンテクマクマヤコン')
Guestbook.create!(name: 'test3', post: "非暴力\n非服従\n言葉は要らない")
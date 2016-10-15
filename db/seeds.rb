# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#use rake db:seed to get our seeds into our DB


require 'faker'

  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    150.times do |n|
      name  = Faker::Company.name
      height = 1+rand(1000);
      weight = 1+rand(1000);
      fly = 1+rand(100)
      fight = 1+rand(100)
      water = 1+rand(100)
      fire = 1+rand(100)
      electric = 1+rand(100)
      freezer = 1+rand(100)
      total = fly+fight+water+fire+electric+freezer
      watched = (1 == rand(2) ? true : false)
      imdb_id = rand(1000000)
      trainer = Trainer.create!(:name => name + " trainer",
                      :level => 1)

      Tokimon.create!(:name => name,
                    :height => height,
                    :weight => weight,
                    :fly => fly,
                    :fight => fight,
                    :water => water,
                    :fire => fire,
                    :electric => electric,
                    :freezer => freezer,
                    :total => total,
                    :trainer => trainer)

    end
  end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


@user = FactoryGirl.create :user
@user2 = User.create(name: Faker::Name.name,
                      email: Faker::Internet.email,
                      username:  Faker::Internet.user_name,
                      password: "password123",
                      password_confirmation: "password123")
@user3 = User.create(name: Faker::Name.name,
                      email: Faker::Internet.email,
                      username:  Faker::Internet.user_name,
                      password: "password123",
                      password_confirmation: "password123")

@user4 = User.create(name: Faker::Name.name,
                      email: Faker::Internet.email,
                      username:  Faker::Internet.user_name,
                      password: "password123",
                      password_confirmation: "password123")



@crawl = Crawl.new(name: "Steve is turning 30!",
            description: "Celebrating Steve's 30th birthday with a wicked scavenger hunt all over Portland!",
            user_id: @user.id, public: true)

@crawl2 = Crawl.new(name: "Kelly's Bachelorette Party",
            description: "Girls, we're going hunting for men. Objective: meet one from at least 5 different European countries.",
            user_id: @user2.id, public: true)


@place1 = Place.new(name: "Bar XV",
            description: "Divey little spot in Chinatown",
            address: "15 SW 2nd Ave, Portland, OR 97204")

@crawl.places << @place1
@place1.save

@place2 = Place.new(name: "Portland City Grill",
            description: "Class it up at this spot",
            address: "111 SW 5th Ave, Portland, OR 97204")

@crawl.places << @place2
@place2.save

@place3 = Place.new(name: "Bailey's Taproom",
            description: "A beer bar in downtown P town",
            address: "213 SW Broadway, Portland, OR 97205")

@crawl.places << @place3
@place3.save


@place4 = Place.new(name: "Paddy's Bar & Grill",
            description: "Corned beef sliders at this Irish pub",
            address: "65 SW Yamhill St, Portland, OR 97204")

@crawl.places << @place4
@place4.save

@crawl.save


@place5 = Place.new(name: "Tugboat Brewing",
            description: "Smallest brewery in PDX",
            address: "711 SW Ankeny St, Portland, OR 97205")

@crawl2.places << @place5
@place5.save

@place6 = Place.new(name: "Teardrop Lounge",
            description: "Fancy drinks for fancy folks",
            address: "1015 NW Everett St, Portland, OR 97209")

@crawl2.places << @place6
@place6.save

@place7 = Place.new(name: "Rialto Poolroom",
            description: "Best place to bet the ponies",
            address: "529 SW 4th Ave, Portland, OR 97204")

@crawl2.places << @place7
@place7.save

@crawl2.save

@crawl4 = FactoryGirl.build :crawl
@crawl4.update(description: "This is a fake pub crawl for the home screen", user_id: @user4.id, public: true)
@crawl4.save

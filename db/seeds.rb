# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Place.create(name: "Bar XV",
            description: "Divey little spot in Chinatown",
            address: "15 SW 2nd Ave, Portland, OR 97204")

Place.create(name: "Portland City Grill",
            description: "Class it up at this spot",
            address: "111 SW 5th Ave, Portland, OR 97204")

Place.create(name: "Bailey's Taproom",
            description: "A beer bar in downtown P town",
            address: "213 SW Broadway, Portland, OR 97205")

Place.create(name: "Tugboat Brewing",
            description: "Smallest brewery in PDX",
            address: "711 SW Ankeny St, Portland, OR 97205")

Place.create(name: "Paddy's Bar & Grill",
            description: "Corned beef sliders at this Irish pub",
            address: "65 SW Yamhill St, Portland, OR 97204")

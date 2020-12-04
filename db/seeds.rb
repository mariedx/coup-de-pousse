# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Address.destroy_all
Garden.destroy_all



20.times do
  user = User.new(email: Faker::Name.first_name+"@yopmail.com", password: Faker::Lorem.characters(number: 10))
  user.skip_confirmation!
  user.save!
end
tp User.all


20.times do
  Address.create!(
    city: ["Paris", "La-Celle-Saint-Cloud", "Saint-Gervais"].sample, 
    zip_code: Faker::Address.zip_code)
end
tp Address.all

pictures_array = ["https://www.gardendesign.com/pictures/images/600x600Max/landscape-design-pictures_757/dwarf-shrubs-land-morphology_11506.jpg","https://www.gardendesign.com/pictures/images/600x600Max/landscape-design-pictures_757/red-brick-path-foliage-daniel-shea-contemporary-garden-design_10137.jpg","https://i2.wp.com/jardinfute.com/wp-content/uploads/2019/06/carrepotager-1.jpg?resize=696%2C464&ssl=1",
"https://www.gardendesign.com/pictures/images/600x600Max/landscape-design-pictures_757/design-with-nature_3581.jpg","https://www.gardendesign.com/pictures/images/600x600Max/landscape-design-pictures_757/living-green-design_3636.jpg", "https://www.gardendesign.com/pictures/images/600x600Max/landscape-design-pictures_757/oehme-van-sweden-associates-inc_4972.jpg","https://www.gardendesign.com/pictures/images/600x600Max/landscape-design-pictures_757/hoerr-schaudt_5019.jpg","https://www.gardendesign.com/pictures/images/600x600Max/landscape-design-pictures_757/garden-diva-designs_5128.jpg","https://i.pinimg.com/originals/43/97/19/4397195be3f5c420eb117dcc6f25a998.jpg","https://ekladata.com/puGijl0elzRI6OPBERGaTIYCplU.jpg",
"https://i.redd.it/sko4xekab2f51.jpg","https://i.skyrock.net/8570/6858570/pics/1785965086_small.jpg", "https://i.skyrock.net/4243/81674243/pics/3303730980_1_3_mrXEDrUU.jpg","https://www.sudinfo.be/sites/default/files/dpistyles_v2/ena_sp_16_9_illustration_principale/2017/11/28/node_23556/84143/public/2017/11/28/B9713960705Z.1_20171128143107_000+G7HA805IA.3-0.jpg?itok=lLsl3L481511875877",
"https://p5.storage.canalblog.com/51/77/982369/121125380_o.jpg"]

20.times do
  Garden.create!(
    title: "Jardin de "+Faker::Superhero.name+" besoin d'aide urgente pour planter des "+["choux","poux","genoux","cailloux"].sample,
    description: ["Charmant jardin à partager, rempli de camélias, hêtres et myosotis. A besoin d'une main experte pour m'aider à les chouchouter", "Jardin dans un état déplorable, laissé à l'abandon par mes parents dans les années 70. J'ai besoin d'aide ASAP","Besoin d'aide pour planter un potager dans ce jardinet. Hors de question de remettre les pieds dans un supermarché", "Besoin d'aide pour entretenir ce jardin d'éden. Nous jardinerons nus afin de mieux nous connecter avec la nature.","SOS cucurbitacées ! J'ignore tout du repiquage de ces délicieux arômes, une âme charitable pour m'aider ?"].sample,
    orientation: ["Nord", "Sud","Est","Ouest"].sample,
    floor_type: ["Pauvre et humide","Riche et humide","Pauvre et sec", "Riche et sec"].sample,
    is_available: Faker::Boolean.boolean,
    parking: Faker::Boolean.boolean,
    tools_available: Faker::Boolean.boolean,
    surface: Faker::Number.between(from: 10, to: 300),
    image_url: pictures_array[rand(pictures_array.length)],
    user_id: User.ids.sample,
    address_id: Address.ids.sample
)
end

sharingcond = ["Potager","Entretien du jardin","Planter des fleurs"]
tp Garden.all 

Category.create(sharing_conditions: sharingcond[rand(sharingcond.length+1)])
tp Category.all 

20.times do
  GardenCategory.create!(
    garden_id: Garden.ids.sample,
    category_id: Category.ids.sample
  )
end

tp GardenCategory.all
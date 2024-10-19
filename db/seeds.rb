# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"

User.create!(
  email: "user@crazy4cats.cl",
  password: "123456",
  name: "Usuario",
  photo: File.open(Rails.root.join("./app/assets/images/user1.jpg")))

# Crear ciudades hasta que haya 20 diferentes
until Location.count == 20 do
  city_name = Faker::Address.city
  Location.create(name: city_name) unless Location.pluck(:name).include?(city_name)
end

cities = Location.all

# Crear artículos hasta que haya 50, filtrando aquellos que estén relacionados con 'cats'
until Article.count == 50 do
  title = Faker::Book.title
  description = Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false)

  # Solo creamos el artículo si está relacionado con 'cats'
  if title.downcase.include?('cat') || description.downcase.include?('cat')
    Article.create(
      title: title,
      description: description,
      when: Faker::Date.between(from: 10.years.ago, to: Date.today),
      location_id: cities.sample.id, # Asociamos el artículo a un lugar
      user_id: User.last.id)
  end
end

Article.create!(
  image: File.open(Rails.root.join("./app/assets/images/img1.jpg")),
  title: "¿Qué verduras pueden comer los gatos?",
  description: "¿Te has preguntado si los gatos pueden comer verduras o si es mejor evitarlas en su dieta? Resulta que los gatos son carnívoros estrictos, lo que significa que su alimentación debe estar principalmente compuesta por carne. Las verduras, siendo ricas en fibra y carbohidratos, no son realmente lo que necesitan estos felinos.
  Su dieta ideal se centra en proteínas y grasas, por lo que hacer que tu gato sea vegano sería un gran error.
  Las verduras son geniales para nosotros, pero para los gatos, la cosa cambia. Su sistema digestivo está diseñado para procesar carne, no para absorber los nutrientes de las verduras como lo hacemos nosotros.",
  when: Faker::Date.between(from: 10.years.ago, to: Date.today),
  location_id: cities.sample.id,
  user_id: User.last.id)

 Article.create!(
  image: File.open(Rails.root.join("./app/assets/images/img2.jpg")),
  title: "¿Por qué los gatos muerden? Y cómo hacer que paren",
  description: "¿Tu gato te da mordiscos a menudo? Descubre por qué lo hacen y cómo evitarlo con nuestros consejos. Los gatos muerden a veces, y hay varias razones detrás de esto. No te preocupes, la mayoría de las veces no es por agresión, ¡tu gatito no es malo!
  Los gatos son cazadores por naturaleza, así que jugar mordiendo y arañando forma parte de su comportamiento instintivo.
  Es crucial permitirles jugar de esta manera, pero también es importante establecer límites para evitar comportamientos agresivos.",
  when: Faker::Date.between(from: 10.years.ago, to: Date.today),
  location_id: cities.sample.id,
  user_id: User.last.id)

puts "Se han creado #{Location.count} ciudades."
puts "Se han creado #{Article.count} artículos relacionados con 'cats'."
puts "se han creado 2 artículos con imágenes"

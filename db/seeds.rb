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
  email: "usuario@crazy4cats.cl",
  password: "usuario",
  name: "Usuario",
  photo: File.open(Rails.root.join("./app/assets/images/user1.jpg")))

# Crear artículos hasta que haya 50, filtrando aquellos que estén relacionados con 'cats'
until Article.count == 50 do
  title = Faker::Book.title
  description = Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false)
  location = Faker::Address.city

  # Solo creamos el artículo si está relacionado con 'cats'
  if title.downcase.include?('cat') || description.downcase.include?('cat')
    Article.create(
      title: title,
      description: description,
      location: location,
      user_id: User.last.id)
    puts "creado artículo #{Article.count}"
  end
end

Article.create!(
  image: File.open(Rails.root.join("./app/assets/images/img3.jpg")),
  title: "5 razas de gatos sin pelo: Felinos para personas con alergia.",
  description: "No a todo el mundo le gustan los gatos, sobre todo a las personas alérgicas. Pero un gato sin pelo puede hacer posible que una familia amante de los gatos adopte una nueva mascota sin que sus alergias se agraven demasiado. Si tu único conocimiento de los gatos sin pelo es cuando Rachel Green de “Friends” adopta un Sphynx o esfinge, te recomendamos que sigas leyendo.",
  location: Faker::Address.city,
  user_id: User.last.id)

Article.create!(
  image: File.open(Rails.root.join("./app/assets/images/img2.jpg")),
  title: "¿Por qué los gatos muerden? Y cómo hacer que paren",
  description: "¿Tu gato te da mordiscos a menudo? Descubre por qué lo hacen y cómo evitarlo con nuestros consejos. Los gatos muerden a veces, y hay varias razones detrás de esto. No te preocupes, la mayoría de las veces no es por agresión, ¡tu gatito no es malo!
  Los gatos son cazadores por naturaleza, así que jugar mordiendo y arañando forma parte de su comportamiento instintivo.
  Es crucial permitirles jugar de esta manera, pero también es importante establecer límites para evitar comportamientos agresivos.",
  location: Faker::Address.city,
  user_id: User.last.id)

Article.create!(
  image: File.open(Rails.root.join("./app/assets/images/img1.jpg")),
  title: "¿Qué verduras pueden comer los gatos?",
  description: "¿Te has preguntado si los gatos pueden comer verduras o si es mejor evitarlas en su dieta? Resulta que los gatos son carnívoros estrictos, lo que significa que su alimentación debe estar principalmente compuesta por carne. Las verduras, siendo ricas en fibra y carbohidratos, no son realmente lo que necesitan estos felinos.
  Su dieta ideal se centra en proteínas y grasas, por lo que hacer que tu gato sea vegano sería un gran error.
  Las verduras son geniales para nosotros, pero para los gatos, la cosa cambia. Su sistema digestivo está diseñado para procesar carne, no para absorber los nutrientes de las verduras como lo hacemos nosotros.",
  location: Faker::Address.city,
  user_id: User.last.id)

puts "Se han creado #{Article.count} artículos relacionados con 'cats'."
puts ".. y dentro de esos #{Article.count} se crearon 3 artículos con imágenes"

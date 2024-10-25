# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
require "faker"

User.create!(
  email: "karina@karipic.cl",
  password: "123456",
  name: "Karina",
  photo: File.open(Rails.root.join("./app/assets/images/karina.jpg")))

# Ruta a las imágenes en el directorio db/seeds/images
image_paths = Dir["#{Rails.root}/db/seeds/images/*.jpg"] # Cambia la extensión si es necesario

# Adjuntar múltiples imágenes
image_paths.each do |image_path|
  exhibition.pictures.attach(io: File.open(image_path), filename: File.basename(image_path))
end

Exhibition.create!(
  title: "Tres Mundos, M.C. Escher",
  description: "M.C. Escher, es uno de los más grandes artistas gráficos del siglo XX. Tal vez la mejor definición que se ha dado de él sea la de «uno de los más reconocibles y admirados por el gran público». Esto viene a decir que muchas personas admiran y encuentran curiosos, intrigantes y bonitos sus trabajos. /n Sus más populares obras, figuras imposibles, fondos reticulados con diversos patrones y mundos imaginarios han sido reproducidas hasta la saciedad en portadas de libros, revistas, campañas publicitarias y en todo tipo de formatos.",
  image_paths.each do |image_path|
    exhibition.pictures.attach(io: File.open(image_path), filename: File.basename(image_path))
  end,
  user_id: User.last.id)

Exhibition.create!(
  title: "Un Mundo, M.C. Escher",
  description: "Dado que sus obras guardan ciertas similitudes entre sí debido a la recurrencia de los temas tratados son fácilmente reconocibles. /n Tal vez el carácter matemático de sus obras ha hecho también que sea uno de los artistas más populares en los entornos científicos, especialmente matemáticos e informáticos. Curiosamente, sus conocimientos matemáticos siempre fueron muy limitados. Muchas de las conclusiones gráficas y matemáticas a las que llegó, que le permitirían realizar algunos de sus trabajos.",
  image: File.open(Rails.root.join("./app/assets/images/img1.jpg")),
  user_id: User.last.id)

puts "Se creó el User Karina y 2 Exhibitions con imágenes para demo"

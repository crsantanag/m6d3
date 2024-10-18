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

  # Crear ciudades hasta que haya 20 diferentes
  until Country.count == 20 do
    city_name = Faker::Address.city
    Country.create(name: city_name) unless Country.pluck(:name).include?(city_name)
  end

cities = Country.all

# Crear artículos hasta que haya 100, filtrando aquellos que estén relacionados con 'cats'
until Article.count == 50 do
  title = Faker::Book.title
  description = Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false)

  # Solo creamos el artículo si está relacionado con 'cats'
  if title.downcase.include?('cat') || description.downcase.include?('cat')
    Article.create(
      title: title,
      description: description,
      when: Faker::Date.between(from: 10.years.ago, to: Date.today),
      country_id: cities.sample.id # Asociamos el artículo a una ciudad
    )
  end
end

puts "Se han creado #{Country.count} ciudades."
puts "Se han creado #{Article.count} artículos relacionados con 'cats'."

require 'open-uri'
require 'json'

#This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning database..."
Movie.destroy_all
List.destroy_all

puts "adding Movies"

url = "http://tmdb.lewagon.com/movie/top_rated"
10.times do |i|
  puts "Importing movies from page #{i + 1}"
  movies = JSON.parse(URI.open("#{url}?page=#{i + 1}").read)['results']
  movies.each do |movie|
    puts "Creating #{movie['title']}"
    base_poster_url = "https://image.tmdb.org/t/p/original"
    Movie.create(
      title: movie['title'],
      overview: movie['overview'],
      poster_url: "#{base_poster_url}#{movie['backdrop_path']}",
      rating: movie['vote_average']
    )
  end
end

puts "adding lists"

cat_horror = { name: 'Cat Horror', image_url: 'https://pet-happy.com/files/up/2014/09/scared-cat.jpg' }
cat_fantasy = { name: 'Fantasy Cat', image_url: 'https://assets.cosplaycentral.com/cat%20cosplay%20zelda.jpg/BROK/resize/1200x1200%3E/format/jpg/quality/70/cat%20cosplay%20zelda.jpg' }
cat_comedy = { name: 'Comedy Cat', image_url: 'https://i.ytimg.com/vi/317jz-PU7Mg/maxresdefault.jpg' }
cat_sci_fi = { name: 'Cat Sci Fi', image_url: 'https://i.ytimg.com/vi/gITJEvFyl7k/hqdefault.jpg' }
cat_documentaries = { name: 'Cat Documentaries', image_url: 'http://www.catcareofvinings.com/blog/wp-content/uploads/2017/05/CCV_iStock-619079366.jpg' }
cat_action = { name: 'Cat Action', image_url: 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/68a224ae-3904-4540-a1cd-fccd2133da20/dc5wmb-8f8cb34d-5c04-4e2e-ae3c-5fc38cc621d6.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzY4YTIyNGFlLTM5MDQtNDU0MC1hMWNkLWZjY2QyMTMzZGEyMFwvZGM1d21iLThmOGNiMzRkLTVjMDQtNGUyZS1hZTNjLTVmYzM4Y2M2MjFkNi5qcGcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.dcVhIdcubaxT1NzcJ7_QYudFMHcF96VirTByotqb1b8' }

[cat_horror, cat_fantasy, cat_comedy, cat_sci_fi, cat_documentaries,cat_action].each do |attributes|
  list = List.create!(attributes)
  puts "Created #{list.name}"
end
puts "Finished!"

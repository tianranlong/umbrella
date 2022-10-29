p "Where are you located?"

# user_location = gets.chomp

user_location = "Mephis"

p user_location

# gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=Memphsis&key=AIzaSyAgRzRHJZf-uoevSnYDTf08or8QFS_fb3U"

#gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + user_location + "&key=AIzaSyAgRzRHJZf-uoevSnYDTf08or8QFS_fb3U"

#gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_location}&key=AIzaSyAgRzRHJZf-uoevSnYDTf08or8QFS_fb3U"

gmaps_key = ENV.fetch("GMAPS_KEY")
#gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=PLACE&key=#{gmaps_key}".gsub("PLACE",user_location)
gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=PLACE&key=AIzaSyAgRzRHJZf-uoevSnYDTf08or8QFS_fb3U".gsub("PLACE",user_location)


require "open-uri"

puts URI.open(gmaps_url ).read

raw_date = URI.open(gmaps_url ).read

p raw_date.class #string is not harsh, so cannot use fetch

p raw_date.length

# raw_date.split({"{"}).at(14).split({":"}).read
require "json"

p parsed_date=JSON.parse(raw_date)
p parsed_date.keys

p parsed_date.fetch("results").class #its array again
first_array =  parsed_date.fetch("results").at(0) #its harsh again

p first_array.keys
loc = first_array.fetch("geometry").fetch("location")
latitude = loc.fetch("lat")
longitude = loc.fetch("lng")

p latitude 
p longitude


darksky_url = "https://api.darksky.net/forecast/26f63e92c5006b5c493906e7953da893/#{latitude},#{longitude}"

puts URI.open(darksky_url).read
link = URI.open(darksky_url).read
p link.class

par=JSON.parse(link)
p par.keys
p par.fetch("currently") 
alm = par.fetch("currently")
p alm.class
p alm.keys
weather = alm.fetch("temperature")
p weather 

hour = par.fetch("hourly") 
p hour.class
 hour.fetch("data")
next_hour = hour.fetch("data")
p next_hour.class
harsh = next_hour.at(0)
p harsh.class
p harsh.keys
 harsh.fetch("summary")
summary = harsh.fetch("summary")
p summary 
p latitude 
p longitude

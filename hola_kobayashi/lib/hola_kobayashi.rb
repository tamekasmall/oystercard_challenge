class HolaKobayashi
 def self.hi
   puts "Hello everyone!"
 end
end

source "https://rubygems.org/gems/hola_kobayashi"

ruby '2.5.1'

group :development, :test do
 gem "rspec"
end

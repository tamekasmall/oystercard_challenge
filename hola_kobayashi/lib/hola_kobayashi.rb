class HolaKobayashi
 def self.hi
   puts "Hello everyone!"
 end
end

source "https://rubygems.org/gems/hola_kobayashi"
group :development, :test do
 gem "rspec"
end

#!/usr/bin/ruby -w

require 'open-uri'
require 'nokogiri'  

print 'Quel pseudo : '
pseudo = gets.chomp

document = Nokogiri::HTML(open("https://twitter.com/#{pseudo}")) 
nb_followers = document.css("a.ProfileNav-stat[data-nav='followers']")[0]["title"].tr('^0-9', '').to_i

puts "Le compte de #{pseudo} a #{nb_followers} followers" 
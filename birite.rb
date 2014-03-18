#!/usr/bin/env ruby -w

require 'nokogiri'
require 'open-uri'

def icecream_list

	doc = Nokogiri::HTML(open('http://biritecreamery.com/icecream'))
	doc.at('h3:contains("scoops")').next_element.css('li').map {|flavor_li| flavor_li.inner_text}

end

puts icecream_list
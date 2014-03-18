#!/usr/bin/env ruby -w

require 'nokogiri'
require 'open-uri'
require 'optparse'

def icecream_list

	doc = Nokogiri::HTML(open('http://biritecreamery.com/icecream'))
	flavors = doc.at('h3:contains("scoops")').next_element.css('li').map {|flavor_li| flavor_li.inner_text}
	flavors.sort! if $options[:sort]
	flavors
end

$options = {}

OptionParser.new do |opts|
	opts.banner = 'Usage: birite [-s] <menu item>'

	opts.on('-s', '--sort', "Sort flavors") do |s|
		$options[:sort] = s
	end
end.parse!

puts icecream_list
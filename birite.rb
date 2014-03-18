#!/usr/bin/env ruby -w

require 'nokogiri'
require 'open-uri'
require 'optparse'

@food_search_terms = ['scoop', 'sandwich', 'combo', 'sundae']

def list_icecream(food)

	doc = Nokogiri::HTML(open('http://biritecreamery.com/icecream'))
	list = doc.at("h3:contains(\"#{food}\")").next_element#.css('li')
	if (list.nil?) 
		puts "sorry, that was not specific enough, please use one of these terms: #{@food_search_terms}"
		exit 1
	end
	flavors = list.css('li').map {|flavor_li| flavor_li.inner_text}
	flavors.sort! if $options[:sort]
	unless $options[:find].nil?
		flavors.select! { |flav| flav.include? $options[:find] }
	end
	flavors
end

# global var
$options = {}

OptionParser.new do |opts|
	# for birite.rb -h
	opts.banner = "Usage: birite [-s] #{@food_search_terms}"

	# switch option
	opts.on('-s', '--sort', "Sort flavors") do |s|
		$options[:sort] = s
	end
	#required arg
	opts.on('-f', '--find FLAVOR', "Find a flavor") do |f|
		$options[:find] = f
	end

end.parse!

# ARGV is all the stuff passed in
puts list_icecream ARGV.first
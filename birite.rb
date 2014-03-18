#!/usr/bin/ruby -w

require 'nokogiri'

def icecream_list

	doc = Nokogiri::HTML(open('icecream.html'))
	puts doc

end

icecream_list
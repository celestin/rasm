#!/bin/env ruby

fi = File.open("t1.l", "r");
fo = File.new("t1.h", "w");

fi.each_line { |line|
	puts "#{line}"
	nhex = line.split
	if(nhex[1] =~ /[A-Fa-f0-9]{8,8}/)
		puts nhex[2]
		fo.printf(nhex[2].gsub(/[\[\]]/, ''))
	end
}


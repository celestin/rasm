#!/bin/env ruby

fi = File.open("t1.h", "r")
fo = File.new("t1.b", "w")

while(!fi.eof)
	fo.printf("%c", fi.read(2).hex)
end

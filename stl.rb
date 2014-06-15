#!/bin/env ruby

require "./operands"

fi = File.open("t1.s", "r")
fo = File.new("t1.l", "w")

zero_operand = {
	"DAA" => "27",
	"DAS" => "2F",
	"AAA" => "37",
	"AAS" => "3F",
	"pusha" => "60",
	"popa" => "61",
	"nop" => "90",
	"cbw" => "98",
	"cwd" => "99",
	"wait" => "9B",
	"sahf" => "9E",
	"lahf" => "9F",
	"aam" => "D4",
	"aad" => "D5",
	"xlat" => "D7",
	"lock" => "F0",
	"repne" => "F2",
	"hlt" => "F4",
	"clc" => "F8",
	"stc" => "F9",
	"cli" => "FA",
	"sti" => "FB",
	"cld" => "FC",
	"std" => "FD",
}

one_operand =  {
	"push" => {
		"es" => "06",
		"cs" => "0E",
		"ss" => "16",
		"ds" => "1E",
	},
	"pop" => {
		"es" => "07",
		"ss" => "17",
		"ds" => "1E",
	},
}

def push_hex(line, push_h)
	line =~ /push (\w+)/i
	return push_h($1.downcase) if(regs.has_key?($1))
end

ln = 1
byte = 0

fi.each_line { |line|
	puts "#{line}"
	line =~ /(\w+:)?(.*)/
	label = $1
	op = $2.split
	opcode = op[0]

	case op[0].downcase
		when "add"
			line =~ /add (\w+), (\w+)/i
			puts "#$1 #$2"
		when "push"
			hex = push_hex(line, push_h)
	end

	fo.printf("% 6d %08X %- 24s%s", ln, byte, hex, line)
	ln = ln + 1
	byte = byte + hex.length / 2
}

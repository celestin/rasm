class Register

	attr_reader :bits, :num, :type
	def initialize(bits, num)
		@bits = bits
		@num = num
		@type = type
	end

end

class Operand

	def initialize(operand)
		@operand = operand
	end

	def reg?
		true if ($regs.has_key?(@operand))
	end

	def mem?
		true if (@operand =~ /\[.*\]/)
	end

	def imm?
		true if (@operand =~ /0x[a-f0-9]/i)
	end

	def imm8?
		true if (imm? && @operand.hex <= 0xFF)
	end

	def e?
		true if(reg? || mem?)
	end

	def e8?
		true if(reg8? || mem?)
	end

	def e16?
		true if(reg16? || mem?)
	end

	def al?
		true if(@operand == 'ax')
	end

	def reg8?
		true if($regs[@operand].bits == 8)
	end

	def reg16?
		true if($regs[@operand].bits == 16)
	end

	def regn
		$regs[@operand].num
	end

end

class Opcode
	
	attr_reader :operands
	def initialize(operands)
		@operands = operands
	end

end

$regs = {
	# 8 bits registers
	"al" => Register.new(8, 0),
	"cl" => Register.new(8, 1),
	"dl" => Register.new(8, 2),
	"bl" => Register.new(8, 3),
	"ah" => Register.new(8, 4),
	"ch" => Register.new(8, 5),
	"dh" => Register.new(8, 6),
	"bh" => Register.new(8, 7),
	
	# 16 bits registers
	"ax" => Register.new(16, 0),
	"cx" => Register.new(16, 1),
	"dx" => Register.new(16, 2),
	"bx" => Register.new(16, 3),
	"sp" => Register.new(16, 4),
	"bp" => Register.new(16, 5),
	"si" => Register.new(16, 6),
	"di" => Register.new(16, 7),
	
	# 32 bits registers
	"eax" => Register.new(32, 0),
	"ecx" => Register.new(32, 1),
	"edx" => Register.new(32, 2),
	"ebx" => Register.new(32, 3),
	"esp" => Register.new(32, 4),
	"ebp" => Register.new(32, 5),
	"esi" => Register.new(32, 6),
	"edi" => Register.new(32, 7),
}

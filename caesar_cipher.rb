# Returns a ciphered string shifted by key amount, excluding non-alphabetical characters
# If shifted key ends up in the same place, skip shifts and return original string
def caesar_cipher(string, key)
	key >= 0 ? key %= 26 : key = (key % 26) - 26 # reduces large numbers
	return string if key == 0

	shifted_string = ''
	string.each_char do |c|
		c = shift(c, key) if c.match(/[a-zA-Z]/) #only shift letters
		shifted_string << c
	end

	shifted_string
end


# Returns char after shifting,
def shift(char, key)
	# return "Invalid key - must be an integer" unless key.is_a?(Integer)
	shift_to = char.ord + key # post-shift numeric value

	# Wrap characters, case-sensitive
	case char
	when /[a-z]/
		shift_to += 26 if shift_to.chr < 'a'
		shift_to -= 26 if shift_to.chr > 'z'
	when /[A-Z]/
		shift_to += 26 if shift_to.chr < 'A'
		shift_to -= 26 if shift_to.chr > 'Z'
	else; end
	shifted_char = shift_to.chr

	shifted_char
end


puts "Input string to cipher: "
input = gets.strip
puts "Enter key (must be integer): "
key = gets.strip.to_i

puts caesar_cipher(input, key)

# TEST OUTPUT
# p caesar_cipher('What a string!', 5)
# 	=> "Bmfy f xywnsl!"
# p caesar_cipher('Bmfy f xywnsl!', -5)
# 	=> "What a string!"

# p caesar_cipher('What a string!', 395)
# 	=> "Bmfy f xywnsl!"
# p caesar_cipher('Bmfy f xywnsl!', -395)
# 	=> "What a string!"
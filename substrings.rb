# Returns a hash of {word => frequency} for each word
#    from a dictionary that is present in a given string
def substrings(words, dictionary)
	words.downcase! # ensures same case as dictionary
	valid_substrings = Hash.new(0)

	# Iterate through every substring and add the word and frequency to valid_substrings hash
	dictionary.each do |d|
		num_match = words.scan(d).count
		valid_substrings[d] = num_match if num_match > 0 # skip words that aren't found
	end

	valid_substrings
end

dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]
p substrings("below", dictionary)
	# => {"below"=>1, "low"=>1}
p substrings("Howdy partner, sit down! How's it going?", dictionary)
	# => {"down"=>1, "how"=>2, "howdy"=>1, "go"=>1, "going"=>1, "it"=>2, "i"=>3, "own"=>1, "part"=>1, "partner"=>1, "sit"=>1}
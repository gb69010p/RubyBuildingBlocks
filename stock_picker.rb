# Returns best combination of days given an array of stock prices
#   with index as the day starting from zero
def stock_picker(prices)

	# Best available [buy, sell] days for each buy day
	best_days = []
	prices.each_index do |i|
		available_days = prices[i...prices.size] # only same day or after are valid sell days
		best_days << [i, prices.index(available_days.max)]
	end

	# Calculates profit of each best day, same size and index as best_days
	profits = []
	best_days.each {|i| profits << prices[i[1]] - prices[i[0]] }

	# Returns [buy, sell] day pair matching index of highest profit
	best_days[profits.index(profits.max)]
end

prices = [17, 3, 6, 9, 15, 8, 6, 1, 10]
puts "#{stock_picker(prices)}"
# => [1, 4]
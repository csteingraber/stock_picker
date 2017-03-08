def stock_picker(prices)
	lowest_price = prices.min
	lowest_index = prices.index lowest_price
	highest_price = prices.max
	highest_index = prices.index highest_price
	if lowest_index <= highest_index
		[lowest_index, highest_index]
	else 
		region1 = stock_picker(prices[0..highest_index])
		region2 = stock_picker(prices[(highest_index + 1)..(lowest_index - 1)])
		region2[0] = region2[0] + highest_index + 1
		region2[1] = region2[1] + highest_index + 1
		region3 = stock_picker(prices[lowest_index..prices[-1]])
		region3[0] = region3[0] + lowest_index
		region3[1] = region3[1] + lowest_index
		profit1 = prices[region1[1]] - prices[region1[0]]
		profit2 = prices[region2[1]] - prices[region2[0]]
		profit3 = prices[region3[1]] - prices[region3[0]]
		if profit1 >= profit2
			if profit1 >= profit3
				region1
			else
				region3
			end
		else
			if profit2 >= profit3
				region2
			else 
				region3
			end
		end
	end
end

puts stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])

def has_no_repeats_and_cond(num)
	convert_num = num.to_s
	if (convert_num.length != 7) then return false end
	
	h = Hash.new()
	for i in 0..6 do
		if h.has_key?(convert_num[i]) then return false end
		h[ convert_num[i] ] = "has!" 
	end	
	check_cond convert_num 
end

def check_cond(convert_num)
	start = convert_num[0..2]
	mid = convert_num[2..4]
	back = convert_num[4..6]
	((products(start) == products(mid)) && (products(mid) == products(back)))
end

def products(num)
	x = num[0].to_i
	y = num[1].to_i
	z = num[2].to_i
	x*y*z
end


def fill_relevant_array
	a = Array.new
	for num in 1234567...9876543 do
		if !(has_no_repeats_and_cond num)
			next
		end
		a << num
	end
	a
end

$a = [1892436, 1892463, 3642918, 3642981, 6342918, 6342981, 8192436, 8192463]

def check_prods(arr)
	arr.each do |n|
		str = ""
		str = str + n.to_s + "  |  " + products(n.to_s[0..2]).to_s + "  |  " + products(n.to_s[4..6]).to_s
		puts str
	end
end
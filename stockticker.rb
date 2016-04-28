def stockticker(list)
  if list.length < 2
      result = [-1,-1]
  elsif list.max == list.min
      result = [-1,-1]
  else
      result = search_best_combo(list)
  end
  result
end

def search_best_combo(list)
  maxindex =list.index(list.max)
  minindex = list.index(list.min)
  if minindex < maxindex
    result = [minindex,maxindex]
  else
    buy_days = {}
    for i in 0..(list.length - 2) do
       diffs = {}
       for j in (i + 1)..(list.length - 1) do
          diffs[j] = list[j] - list[i]
       end
       best_diff = diffs.select {|k,v| v == diffs.values.max}
       buy_days[i] = best_diff
    end
    maxdiff = 0
    buy_days.each_pair do |bd,sell_diff|
       sellday = sell_diff.keys[0]
       sellval = sell_diff[sellday]
       if sellval > maxdiff
           result = [bd, sellday]
	   maxdiff = sellval
       end
    end
  end
  result
end

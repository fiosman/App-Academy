#O(n^2) time 
def sluggish_octopus(fish_arr)
  longest = nil
  
  fish_arr.each_index do |idx1| 
    (idx1...fish_arr.length).each do |idx2| 
      if fish_arr[idx2].length > fish_arr[idx1].length 
        longest = fish_arr[idx2]
      else
        longest = fish_arr[idx1]
      end
    end
  end
  longest
end

def merge(left_arr, right_arr) 
  merged_arr = []
  left_arr_idx, right_arr_idx = 0, 0

  while left_arr_idx < left_arr.length && right_arr_idx < right_arr.length 
    if left_arr[left_arr_idx].length <= right_arr[right_arr_idx].length
      merged_arr << left_arr[left_arr_idx] 
      left_arr_idx += 1 
    else
      merged_arr << right_arr[right_arr_idx]
      right_arr_idx += 1
    end 
  end

  while left_arr_idx < left_arr.length 
    merged_arr << left_arr[left_arr_idx] 
    left_arr_idx += 1
  end

  while right_arr_idx < right_arr.length 
    merged_arr << right_arr[right_arr_idx]
    right_arr_idx += 1
  end

  merged_arr
end

def merge_sort(arr)
  return arr if arr.length <= 1 


  mid = arr.length / 2 
  right_arr = arr[mid..-1]
  left_arr = arr[0...mid]

  sorted_right_arr = merge_sort(right_arr) 
  sorted_left_arr = merge_sort(left_arr) 

  merge(sorted_left_arr, sorted_right_arr)
end

#O(n log n) time
def dominant_octopus(fish_arr) 
  sorted_fish_arr = merge_sort(fish_arr) 
  return sorted_fish_arr[-1]
end

#O(n) time 
def clever_octopus(fish_arr)
  longest = fish_arr.first
  (1...fish_arr.length).each do |idx| 
    longest = fish_arr[idx] if fish_arr[idx].length > longest.length 
  end
  longest
end
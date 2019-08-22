#O(a * b) time 
#O(n) space === dependant on window size 

def first_windowed_max_range(arr, window_size)
  current_max_range = 0

  arr.each_index do |num_idx| 
    new_window = arr.slice(num_idx, window_size)
    max_range = new_window.max - new_window.min
    current_max_range = max_range if max_range > current_max_range
  end

  current_max_range
end



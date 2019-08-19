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

def 
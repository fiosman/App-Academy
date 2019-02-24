
def all_words_capitalized?(words_arr)
  words_arr.all? { |word| word.capitalize == word }
end

def no_valid_url?(url_array)
  domains = [".com", ".net", ".io", ".org"]

  url_array.none? do |url| 
    domains.any? { |domain| url.end_with?(domain) }
  end
end

def any_passing_students?(students)
  students.any? do |student| 
    (student[:grades].sum)/(student[:grades].count) >= 75
  end
end

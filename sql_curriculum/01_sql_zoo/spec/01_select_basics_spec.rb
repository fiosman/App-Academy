require 'rspec'
require '01_select_basics'

describe 'SELECT basics' do

  describe 'select_population_of_germany' do
    it 'selects the population of Germany' do
      expect(select_population_of_germany).to contain_exactly(["82500000"])
    end
  end

  describe 'per_capita_gdp' do
    it 'selects the per capita GDP of large countries' do
      expect(per_capita_gdp).to contain_exactly(
        ["Australia", "26900"],
        ["Brazil", "3090"],
        ["Canada", "28390"],
        ["China", "1290"],
        ["Russia", "3410"],
        ["United States of America", "41400"]
      )
    end
  end

  describe 'small_and_wealthy' do
    it 'selects countries with an area under 2,000 and a GDP over 5 billion' do
      expect(small_and_wealthy).to contain_exactly(
        ["Bahrain", "Middle East"],
        ["Singapore", "Asia-Pacific"]
      )
    end
  end

  describe 'scandinavia' do
    it 'shows the names and populations of Scandinavian countries' do
      expect(scandinavia).to contain_exactly(
        ["Denmark", "5400000"],
        ["Finland", "5200000"],
        ["Norway", "4600000"],
        ["Sweden", "8900000"]
      )
    end
  end

  describe 'starts_with_g' do
    it 'selects countries whose names start with G' do
      expect(starts_with_g).to contain_exactly(
        ["Gabon"],
        ["Georgia"],
        ["Germany"],
        ["Ghana"],
        ["Greece"],
        ["Grenada"],
        ["Guatemala"],
        ["Guinea"],
        ["Guinea-Bissau"],
        ["Guyana"]
      )
    end
  end

  describe 'just_the_right_size' do
    it 'selects countries within the size constraints' do
      expect(just_the_right_size).to contain_exactly(
        ["Belarus", "207"],
        ["Ghana", "238"],
        ["Guinea", "245"],
        ["Guyana", "214"],
        ["Laos", "236"],
        ["Romania", "238"],
        ["Uganda", "241"],
        ["United Kingdom", "242"]
      )
    end
  end
end

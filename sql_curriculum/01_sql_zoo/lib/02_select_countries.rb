# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

def example_select
  execute(<<-SQL)
    SELECT
      population
    FROM
      countries
    WHERE
      name = 'France'
  SQL
end

def large_countries
  # Show the names of the countries that have a population of at least
  # 200 million. 200 million is 200,000,000 (eight zeros).
  execute(<<-SQL)
  SQL
end

def high_population_gdps
  # Give the names and the per capita GDPs of countries with a population
  # of at least 200 million.
  execute(<<-SQL)
  SQL
end

def population_in_millions
  # Show the name and population in millions for the countries with continent
  # 'South America'. Divide the population by 1,000,000 to get population in
  # millions.
  execute(<<-SQL)
  SQL
end

def name_and_population
  # Show the name and population for 'France', 'Germany', and 'Italy'
  execute(<<-SQL)
  SQL
end

def united_we_stand
  # Show the countries that have a name that includes the word 'United'
  execute(<<-SQL)
  SQL
end

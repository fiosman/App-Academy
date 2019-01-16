# ### `eval_block`
#
# Write an `eval_block` method that takes some arguments and a block. It should
# call the block, passing all the arguments to the block at once (individually,
# not as an array) using the splat operator. If the user doesn't supply the
# block, it should raise an error and print out "NO BLOCK GIVEN!".
#
# To take possibly multiple arguments, check out the Ruby
# splat operator: http://kconrails.com/2010/12/22/rubys-splat-operator
#
# Note that the wonderful splat operator can allow a method to take **any**
# number of arguments. It **also** allows us to pass an array of arguments to a
# method **as separate arguments**. See the example below:
#
# ```ruby
# #ex1
# my_neat_method(thing1, thing2, banana)
#
# #ex2
# my_arg_array = [thing1, thing2, banana]
# my_neat_method(*my_arg_array)
# ```
#
# In the example above, `my_neat_method` gets the arguments in **exactly**
# the same way in both `ex1` and `ex2`. It has **no idea** the arguments
# were **ever** in `my_arg_array`. The splat operator passed in the
# individual arguments as separate, distinct, discrete, un-array-ified
# arguments.
#
# Examples of calling `eval_block`:
#
# ```ruby
# # Example calls to eval_block
# eval_block("Kerry", "Washington", 23) do |fname, lname, score|
#   puts "#{lname}, #{fname} won #{score} votes."
# end
# # Washington, Kerry won 23 votes.
# # => nil
#
# eval_block(1,2,3,4,5) do |*args|
#   args.inject(:+)
# end
# # => 15
#
# eval_block(1, 2, 3)
# # => "NO BLOCK GIVEN"
# ```

def eval_block(*args, &prc)
  if prc == nil
    raise 'NO BLOCK GIVEN'
  else prc.call(*args)
  end
end




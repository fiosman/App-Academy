require_relative 'questions_database' 

class Question
  attr_accessor :title, :body, :author_id

  def self.find_by_id(id)
    #this returns a hash, but we want an instance with all the attribtues of the table
    #so, we can map over the array (which comprises of a hash), and make a Question 
    #instance for every element, with the hash passed in. Our initialize method will 
    #then decompose the hash key, value pairs. 
    questions = QuestionsDatabase.instance.execute(<<-SQL, id) 
      SELECT 
        * 
      FROM 
        questions 
      WHERE 
        id = ? 
    SQL
    
    questions.map { |question| Question.new(question) }
  end

  def initialize(options)
    #options is a hash that we pass in from our database! 
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

end
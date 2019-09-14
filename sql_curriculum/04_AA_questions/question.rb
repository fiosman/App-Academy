require_relative 'questions_database' 
require_relative 'user'
require_relative 'reply'

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

  def self.find_by_author_id(author_id)
    authors = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        * 
      FROM 
        questions
      WHERE
        author_id = ? 
    SQL

    authors.map { |question| Question.new(question) }
  end

  def initialize(options)
    #options is a hash that we pass in from our database! 
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def author
    User.find_by_id(@author_id)
  end

  def replies 
    Reply.find_by_question_id(@id)
  end

end
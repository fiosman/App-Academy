require_relative 'questions_database' 
require_relative 'user'
require_relative 'reply'
require_relative 'question_follow'

class Question
  attr_accessor :title, :body, :author_id
  attr_reader :id

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

  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
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

  def followers 
    Question.followers_for_question_id(@id)
  end

  def likers 
    QuestionLike.likers_for_question_id(@id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(@id)
  end

  def save 
    if @id 
      QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @author_id, @id) 
        UPDATE 
          questions 
        SET 
          title = ?, body = ?, author_id = ?
        WHERE 
          questions.id = ?; 
      SQL
    else
       QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @author_id) 
        INSERT INTO 
          questions (title, body, author_id)
        VALUES 
          (?, ?);
      SQL

       @id = QuestionsDatabase.instance.last_insert_row_id
    end
    
    self
  end

  end


end
require_relative 'questions_database'
require_relative 'user'
require_relative 'question'

class Reply
  attr_accessor :body, :subject_question_id, :user_id, :parent_reply_id
  
  def self.find_by_id(id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        * 
      FROM 
        replies 
      WHERE 
        id = ?
    SQL

    replies.map { |reply| Reply.new(reply) }
  end

  def self.find_by_user_id(user_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT 
        * 
      FROM 
        replies
      WHERE
        user_id = ?
    SQL

    replies.map { |reply| Reply.new(reply) }
  end

  def self.find_by_question_id(question_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        * 
      FROM 
        replies 
      WHERE 
        subject_question_id = ?
    SQL

    replies.map { |reply| Reply.new(reply) }
  end

  def initialize(options)
    @id = options['id']
    @body = options['body']
    @subject_question_id = options['subject_question_id']
    @user_id = options['user_id']
    @parent_reply_id = options['parent_reply_id']
  end
  
  def author 
    User.find_by_id(@user_id)
  end

  def question 
    Question.find_by_id(@subject_question_id)
  end

  def parent_reply 
    Reply.find_by_id(@parent_reply_id)
  end

  def child_replies 
    child_replies = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT 
        * 
      FROM 
        replies 
      WHERE 
        parent_reply_id = ?
    SQL

    child_replies.map { |child_reply| Reply.new(child_reply) }
  end
end
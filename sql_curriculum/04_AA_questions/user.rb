require_relative 'questions_database'
require_relative 'question'
require_relative 'reply' 
require_relative 'question_follow'

class User
  attr_accessor :fname, :lname

  def self.find_by_id(id) 
    users = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        * 
      FROM 
        users 
      WHERE 
        id = ? 
    SQL

    users.map { |user| User.new(user) }
  end

  def self.find_by_name(fname, lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT 
        * 
      FROM 
        users
      WHERE 
        fname = ? AND lname = ? 
    SQL

    User.new(user.first)
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    Question.find_by_author_id(@id)
  end

  def authored_replies
    Reply.find_by_user_id(@id)
  end
  
  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def liked_questions 
    QuestionLike.liked_questions_for_user_id(@id)
  end
  
end
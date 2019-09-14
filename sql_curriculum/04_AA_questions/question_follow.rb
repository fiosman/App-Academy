require_relative 'questions_database'
require_relative 'user'

class QuestionFollow
  attr_accessor :user_id, :question_id

  def self.find_by_id(id)
    question_follows = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        * 
      FROM 
        question_follows
      WHERE 
        id = ? 
    SQL

    question_follows.map { |question_follow| QuestionFollow.new(question_follow) }
  end

  def self.followers_for_question_id(question_id)
    #return followers for a question 
    users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        fname, lname
      FROM 
        question_follows
      JOIN 
        users ON users.id = question_follows.user_id
      JOIN 
        questions ON questions.id = question_follows.question_id
      WHERE 
        question_id = ?
    SQL

    users.map { |user| User.new(user) }
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

end
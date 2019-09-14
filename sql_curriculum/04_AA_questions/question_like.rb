require_relative 'questions_database'
require_relative 'user'

class QuestionLike
  attr_accessor :user_id, :question_id

  def self.find_by_id(id)
    question_likes = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        * 
      FROM 
        question_likes 
      WHERE 
        id = ?
    SQL

    question_likes.map { |question_like| QuestionLike.new(question_like) }
  end

  def self.likers_for_question_id(question_id)
    question_likers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        * 
      FROM 
        users
      JOIN 
        question_likes ON question_likes.user_id = users.id
      WHERE 
        question_id = ?
    SQL

    question_likers.map { |question_liker| User.new(question_liker) }
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

end
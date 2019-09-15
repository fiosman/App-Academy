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

  def self.num_likes_for_question_id(question_id) 
    question_likes = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        question_id, COUNT(question_id) AS count
      FROM 
        question_likes 
      WHERE 
        question_id = ?
      GROUP BY 
        question_id
    SQL

    question_likes.first['count']
  end

  def self.liked_questions_for_user_id(user_id)
    liked_questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT 
        * 
      FROM 
        questions
      JOIN 
        question_likes ON question_likes.question_id = questions.id
      WHERE 
        question_likes.user_id = ? 
    SQL
  end

  def self.most_liked_questions(n)
    most_liked = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT 
        *
      FROM 
        questions
      JOIN 
        question_likes ON question_likes.question_id = questions.id 
      GROUP BY 
        question_likes.question_id
      ORDER BY 
        COUNT(question_likes.user_id) DESC 
      LIMIT ?
    SQL

    most_liked.map { |like| Question.new(like) }
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

end
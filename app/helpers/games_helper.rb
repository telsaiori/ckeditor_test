module GamesHelper
  def has_user_review?(game)
    !!game.comments.find_by(name: current_user.name)
  end
end

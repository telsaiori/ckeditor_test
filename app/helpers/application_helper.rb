module ApplicationHelper

  def is_admin?(user)
    user.try(:is_admin)
  end

  def user_image(user)
    if user.image
      user.image
    else
      "http://placehold.it/50x50"
    end
  end


  
end

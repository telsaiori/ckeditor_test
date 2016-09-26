module ApplicationHelper

  def is_admin?(user)
    user.try(:is_admin)
  end


  
end

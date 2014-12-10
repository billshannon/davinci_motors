class UserNotifier < ActionMailer::Base
  default from: "instructor@jasonnoble.org"

  def signed_up(user)
    @user = user
    mail to: @user.email
  end

  def verified(user)
    @user = user
    mail to: @user.email
  end

  def verify(user)
    @user = user
    mail to: @user.email
  end
end

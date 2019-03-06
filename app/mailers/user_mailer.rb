class UserMailer < ApplicationMailer

  def invitation
    @shared_url = shared_url
    mail to: "florence.martino.fm@gmail.com"
  end
end

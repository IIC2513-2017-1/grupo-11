module Verification

  include HTTParty

  def get_mail_info(mail)
    response = HTTParty.get("http://api.fullcontact.com/v2/verification/email?email=#{mail}&apiKey=56426dfa2f86e29e")
  end

end
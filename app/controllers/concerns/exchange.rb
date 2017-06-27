module Exchange

  include HTTParty

  def get_latest
    response = HTTParty.get('http://api.fixer.io/latest?base=USD')
    if response.success?
      response
    else
      raise response.response
    end
  end

end




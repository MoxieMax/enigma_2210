module Generatable
  def random_key
    rand(00000..99999).to_s.rjust(5, "0")
  end
  
  def encrypt_date
    Date::today.strftime('%d%m%y')
  end
end
class Bar

  attr_reader :bar_till

  def initialize
    @bar_till = 50.0
    @whisky_price = 5.00
  end

  def buy_drink(guest)
    if guest.drink_tokens > 0
      price = @whisky_price/2
      if guest.sufficient_money(price) == true
        guest.remove_fee(price)
        guest.drink_tokens -= 1 
        @bar_till += price
      else
        return
      end
    else
      price = @whisky_price
      if guest.sufficient_money(price) == true
        guest.remove_fee(price)
        @bar_till += price
      end
    end
  end






end

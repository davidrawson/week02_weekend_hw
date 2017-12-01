class Bar

  attr_reader :bar_till

  def initialize
    @bar_till = 50
    @whisky_price = 5.00
  end

  def buy_drink(guest)
    if guest.drink_tokens > 0
      price = @whisky_price/2
      p price
      if guest.sufficient_money(price) == true
        guest.remove_fee(price)
        p guest.wallet
        guest.drink_tokens -= 1
        @bar_till += price
      else
        price = @whisky_price
        p price
        if guest.sufficient_money(price) == true
          guest.remove_fee(price)
          @bar_till += price
        end
      end
    end
  end






end

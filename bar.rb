class Bar

  attr_reader :bar_till

  def initialize
    @bar_till = 50.0
    # There's not much choice at this bar.
    @whisky_price = 5.00
    @fee = @whisky_price
  end

  def buy_drink(guest)
    calculate_drink_price(guest)
    return if guest.sufficient_money?(@fee) == false
    guest.remove_fee(@fee)
    guest.drink_tokens -= 1 if guest.drink_tokens > 0
    @bar_till += @fee
  end

  def calculate_drink_price(guest)
    if guest.drink_tokens > 0
      @fee = @whisky_price/2
    else
      @fee = @whisky_price
    end
  end

end

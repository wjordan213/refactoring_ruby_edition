class Movie
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDRENS = 2

  attr_reader :title, :price_code

  def initialize(title:, the_price_code:)
    @title, self.price_code = title, the_price_code
  end

  def price_code=(value)
    @price_code = value
    @price = case price_code
             when REGULAR
               RegularPrice.new
             when NEW_RELEASE
               NewReleasePrice.new
             when CHILDRENS
               ChildrensPrice.new
             end
  end

  def charge(days_rented)
    result = 0

    case price_code
    when Movie::REGULAR
      return @price.charge(days_rented)
    when Movie::NEW_RELEASE
      result += days_rented * 3
    when Movie::CHILDRENS
      result += 1.5
      result += (days_rented - 3) * 1.5 if days_rented > 3
    end

    result
  end

  def frequent_renter_points(days_rented)
    (price_code == Movie::NEW_RELEASE && days_rented > 1) ? 2 : 1
  end
end

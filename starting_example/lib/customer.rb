class Customer
  attr_reader :name

  def initialize(name:)
    @name = name
    @rentals = []
  end

  def add_rentals(arg)
    @rentals << arg
  end

  def statement
    total_amount, frequent_renter_points = 0, 0
    result = "Rental Record for #{@name}\n"

    @rentals.each do |rental|
      this_amount = amount_for(rental)

      # add frequent renter points
      frequent_renter_points += 1
      if rental.movie.price_code == Movie::NEW_RELEASE && rental.days_rented > 1
        frequent_renter_points += 1
      end

      # add bonus for a two day new release rental
      result += "\t" + rental.movie.title + "\t" + this_amount.to_s + "\n"

      total_amount += this_amount
    end

    # add footer lines
    result += "Amount owed is #{total_amount}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
    result
  end

  private

  def amount_for(rental)
    result = 0

    case rental.movie.price_code
    when Movie::REGULAR
      result += 2
      result += (rental.days_rented - 2) * 1.5 if rental.days_rented > 2
    when Movie::NEW_RELEASE
      result += rental.days_rented * 3
    when Movie::CHILDRENS
      result += 1.5
      result += (rental.days_rented - 3) * 1.5 if rental.days_rented > 3
    end

    result
  end
end

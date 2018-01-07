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
      # add frequent renter points
      frequent_renter_points += rental.frequent_renter_points

      # add bonus for a two day new release rental
      result += "\t" + rental.movie.title + "\t" + rental.charge.to_s + "\n"

      total_amount += rental.charge
    end

    # add footer lines
    result += "Amount owed is #{total_amount}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
    result
  end

  private
end

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
    frequent_renter_points = 0
    result = "Rental Record for #{@name}\n"

    @rentals.each do |rental|
      # add bonus for a two day new release rental
      result += "\t" + rental.movie.title + "\t" + rental.charge.to_s + "\n"
    end

    # add footer lines
    result += "Amount owed is #{total_charge}\n"
    result += "You earned #{total_frequent_renter_points} frequent renter points"
    result
  end

  def html_statement
    result = "<h1>Rentals for <em>#{@name}</em></h1><p>\n"
    @rentals.each do |rental|
      # show figures for this rental
      result += "\t" + rental.movie.title + ": " +  rental.charge.to_s + "<br>\n"
    end

    # add footer lines
    result += "<p>You owe <em>#{total_charge}</em><p>\n"
    result += "on this rental you earned " +
      "<em>#{total_frequent_renter_points}</em> " +
      "frequent renter points<p>"
  end

  private

  def total_frequent_renter_points
    @rentals.sum(&:frequent_renter_points)
  end

  def total_charge
    @rentals.sum(&:charge)
  end
end

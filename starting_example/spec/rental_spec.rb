describe Rental do
  let(:regular_movie) { Movie.new(title: 'The Land Before Time', price: RegularPrice.new)}

  let(:days_rented) { 12 }
  let(:rental) { Rental.new(movie: regular_movie, days_rented: 12) }

  it 'has the attributes regular_movie and days_rented' do
    expect(rental.movie).to eq(regular_movie)
    expect(rental.days_rented).to eq(days_rented)
  end
end


describe 'app' do
  let(:regular_movie) { Movie.new(title: 'The Land Before Time', price_code: Movie::REGULAR)}

  let(:days_rented) { 12 }
  let(:rental) { Rental.new(movie: regular_movie, days_rented: 12) }

  let(:name) { "Harris" }
  let(:customer) { Customer.new(name: name) }

  describe Movie do
    it 'has readable attributes title and price_code' do
      expect(regular_movie.title).to eq('The Land Before Time')
      expect(regular_movie.price_code).to eq(Movie::REGULAR)
    end

    it 'has the writeable attribute price_code' do
      regular_movie.price_code = Movie::NEW_RELEASE
      expect(regular_movie.price_code).to eq(Movie::NEW_RELEASE)
    end
  end

  describe Rental do
    it 'has the attributes regular_movie and days_rented' do
      expect(rental.movie).to eq(regular_movie)
      expect(rental.days_rented).to eq(days_rented)
    end
  end

  describe Customer do
    describe 'attributes' do
      it 'should have the name attribute' do
        expect(customer.name).to eq(name)
      end
    end

    describe '#statement' do
      let(:regular_rental_case1_stub) { Rental.new(movie: regular_movie, days_rented: 1) }
      let(:regular_rental_case2_stub) { Rental.new(movie: regular_movie, days_rented: 3) }

      let(:new_release_movie) { Movie.new(title: 'The Land Before Time', price_code: Movie::NEW_RELEASE )}
      let(:new_rental_stub) { Rental.new(movie: new_release_movie, days_rented: 8) }

      let(:childrens_movie) { Movie.new(title: "Some Children's movie", price_code: Movie::CHILDRENS)}
      let(:childrens_rental_case1_stub) { Rental.new(movie: childrens_movie, days_rented: 1) }
      let(:childrens_rental_case2_stub) { Rental.new(movie: childrens_movie, days_rented: 4) }

      let(:prepared_statement) do
        ['Rental Record for Harris', "\tThe Land Before Time\t2", "\tThe Land Before Time\t3.5",
       "\tThe Land Before Time\t24", "\tSome Children's movie\t1.5", "\tSome Children's movie\t3.0",
       'Amount owed is 34.0', 'You earned 6 frequent renter points'
        ].join("\n")
      end

      before do
        customer.add_rentals(regular_rental_case1_stub)
        customer.add_rentals(regular_rental_case2_stub)
        customer.add_rentals(new_rental_stub)
        customer.add_rentals(childrens_rental_case1_stub)
        customer.add_rentals(childrens_rental_case2_stub)
      end

      it 'prepares the correct statement' do
        expect(customer.statement).to eq(prepared_statement)
      end
    end
  end
end

describe Customer do
  let(:regular_movie) { Movie.new(title: 'The Land Before Time', price: RegularPrice.new)}

  let(:name) { "Harris" }
  let(:customer) { Customer.new(name: name) }

  describe 'attributes' do
    it 'should have the name attribute' do
      expect(customer.name).to eq(name)
    end
  end

  describe '#statement' do
    let(:regular_rental_case1_stub) { Rental.new(movie: regular_movie, days_rented: 1) }
    let(:regular_rental_case2_stub) { Rental.new(movie: regular_movie, days_rented: 3) }

    let(:new_release_movie) { Movie.new(title: 'The Land Before Time', price: NewReleasePrice.new )}
    let(:new_rental_stub) { Rental.new(movie: new_release_movie, days_rented: 8) }

    let(:childrens_movie) { Movie.new(title: "Some Children's movie", price: ChildrensPrice.new)}
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

  describe '#html_statement' do
    let(:regular_rental_case1_stub) { Rental.new(movie: regular_movie, days_rented: 1) }
    let(:prepared_statement) {
      [
        "<h1>Rentals for <em>Harris</em></h1><p>", "\tThe Land Before Time: 2<br>", "<p>You owe <em>2</em><p>",
        "on this rental you earned <em>1</em> frequent renter points<p>"
      ].join("\n")
    }

    before do
      customer.add_rentals(regular_rental_case1_stub)
    end

    it 'prepares the correct statement' do
      expect(customer.html_statement).to eq(prepared_statement)
    end
  end
end

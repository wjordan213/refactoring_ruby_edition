describe Movie do
  let(:regular_movie) { Movie.new(title: 'The Land Before Time', price_code: Movie::REGULAR)}


  it 'has readable attributes title and price_code' do
    expect(regular_movie.title).to eq('The Land Before Time')
    expect(regular_movie.price_code).to eq(Movie::REGULAR)
  end

  it 'has the writeable attribute price_code' do
    regular_movie.price_code = Movie::NEW_RELEASE
    expect(regular_movie.price_code).to eq(Movie::NEW_RELEASE)
  end
end

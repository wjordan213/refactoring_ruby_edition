describe Movie do
  let(:regular_movie) { Movie.new(title: 'The Land Before Time', price: RegularPrice.new)}


  it 'has readable attribute title' do
    expect(regular_movie.title).to eq('The Land Before Time')
  end
end

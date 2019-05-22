require 'csv'

csv_text = File.read(Rails.root.to_s + "/db/data-series.csv")
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  @serie = Item.new
  @serie.id = row['index'].to_i
  @serie.company = row['company']
  @serie.genre = row['genre']
  @serie.image = row['image']
  @serie.title = row['title']
  @serie.yearLastSeason = row['yearLastSeason']

  @serie.save
  
end


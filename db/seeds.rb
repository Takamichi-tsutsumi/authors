10.times do |i|
  Novel.create(
           title: "#{i}番目の恋",
           author_id: i
  )
end
more_medias =
[
    {:title => "3", :release_date => "25-nov-1992"},
    {:title => "2", :release_date => "25-nov-1993"},
    {:title => "1", :release_date => "25-nov-1994"},
]

more_medias.each do |media|
    Media.create!(media)
end
code_names = %w(tiny_whale smart_donkey wild_pony kind_shark scary_spider mighty_duck soaring_eagle dancing_wolf smiling_gator happy_hippo zealous_zebra witty_tiger proud_lion fun_squirrel jolly_cheetah fast_ostrich black_panther silver_fox cool_giraffe fancy_bear silly_deer big_cat funny_whale top_dog).sort

code_names.each_with_index do |code_name, number|
  container_name = "lewagon_ide_#{code_name}"
  `docker stop #{container_name}`
  `docker rm #{container_name}`
  `sudo rm -rf ~/#{code_name}`
end

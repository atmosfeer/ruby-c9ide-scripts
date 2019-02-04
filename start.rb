#!/usr/bin/env ruby

code_names = %w(funny_snake tiny_whale smart_donkey wild_pony kind_shark scary_spider mighty_duck soaring_eagle dancing_wolf smiling_gator happy_hippo zealous_zebra witty_tiger proud_lion fun_squirrel jolly_cheetah fast_ostrich black_panther silver_fox cool_giraffe fancy_bear silly_deer big_cat top_dog).sort

code_names.each_with_index do |code_name, number|
  # Just for billy #
  # code_name = "billy"
  # number = 0
  ##############################

  path = "~/#{code_name}"

  # Clean ENV
  `sudo rm -rf #{path}`
  `mkdir -p #{path}`

  # Copy the fresh challenge
  # `cp -pr challenges/#{challenge} #{path}/`
  # `cp #{path}/#{challenge}/tmp/total_examples.txt #{path}/tmp`


  # Prepare the run.sh script
  # `echo "cd /workspace/#{challenge} && bundle exec rspec --format progress --format json --out ../tmp/test_results.txt && bundle exec rubocop --format simple --format quiet -o ../tmp/rubocop_results.txt" > #{path}/run.sh`
  `git clone https://github.com/atmosfeer/lewagon-ruby-workshop-c9.git #{path}/challenges`
  `rm -rf challenges/.git`
  # Prepare the cloud9 settings
  `mkdir #{path}/.c9/`
  `cp project.settings #{path}/.c9/`
  `cp state.settings #{path}/.c9/`



  # Restart docker instance
  container_name = "lewagon_ide_#{code_name}"
  # `docker stop #{container_name}`
  # `docker rm #{container_name}`

  two_digit_number = "%02d" % (number).to_s
  `docker run -it -d -p 100#{two_digit_number}:80 -v ~/#{code_name}/:/workspace/ --name #{container_name} ruby_ide:latest`
  `docker restart #{container_name}`
end

#!/usr/bin/env ruby


# Just for billy##############
code_name = "fancy_bear"
number = 0
##############################

path = "~/#{code_name}"

# Clean ENV
`rm -rf #{path}`
`mkdir -p #{path}`

# Copy the fresh challenge
# `cp -pr challenges/#{challenge} #{path}/`
# `cp #{path}/#{challenge}/tmp/total_examples.txt #{path}/tmp`


# Prepare the run.sh script
# `echo "cd /workspace/#{challenge} && bundle exec rspec --format progress --format json --out ../tmp/test_results.txt && bundle exec rubocop --format simple --format quiet -o ../tmp/rubocop_results.txt" > #{path}/run.sh`
`git clone https://github.com/atmosfeer/lewagon-weekend-workshop.git #{path}/challenges`
# Prepare the cloud9 settings
`mkdir #{path}/.c9/`
`cp project.settings #{path}/.c9/`
`cp state.settings #{path}/.c9/`



# Restart docker instance
container_name = "lewagon_ide_#{code_name}"
# `docker stop #{container_name}`
# `docker rm #{container_name}`

two_digit_number = "%02d" % (number).to_s
# `docker run -it -d -p 100#{two_digit_number}:80 --name #{container_name} ruby_ide:latest`
`docker run -it -d -p 100#{two_digit_number}:80 -v ~/#{code_name}/:/workspace/ --name #{container_name} ruby_ide:latest`
`docker restart #{container_name}`

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

spree_opts = '>= 4.4.0.rc2'
gem 'spree', spree_opts
gem 'spree_sample', spree_opts
gem 'spree_emails', spree_opts
gem 'spree_backend', spree_opts
gem 'spree_gateway'
gem 'spree_auth_devise'
gem 'spree_i18n', '>= 5.0'
gem 'pg'
gem 'awesome_print'
gem 'down'
gem 'rails-controller-testing'

gemspec

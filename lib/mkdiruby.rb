#Creatin d'un repertoire complet de projet ruby
#1. les dossiers : 			-NAME/    						
# 					-NAME/lib/
# 					-NAME/spec/
#2. les fichiers :  XNAME/lib/app.rb
# 					-NAME/Readme.md
# 					-NAME/spec/app_spec.rb
# 					-NAME/Gemfile
# 					-NAME/.env
#   					-NAME/.gitignore
# => INITIALISER GEMFILE AVEC UN PACKAGE DE BASE
#3. initialiser le dossier
# 					-cd NAME
# 					-rspec --init
# 					-bundle install
# 					-git init
# 					-git add .
# 					-git commit -m "First commit"
#					-git remote add origin git@github.com:fthiounn/NAME.git
# 					-git push -u origin master

def perform

	check_if_user_gave_input
	repo_name = get_user_input
	gemfile_content = "source 'https://rubygems.org'\nruby '2.5.1'\ngem 'rubocop', '~> 0.57.2'\ngem 'rspec'\ngem 'pry'\ngem 'colorize'"
	app_rb_content = "require 'colorize'\nrequire 'nokogiri'\nrequire 'open-uri'\n\n\ndef perform\n\nend\n\nperform"
	app_rb_spec_content = "require_relative '../lib/app'\n\ndescribe 'perform method, it should perform' do\n\tit 'my test' do\n\texpect(make_hash("","")).to eq(nil)\n\tend\nend"
	gitignore_content = ".env"
	readme_content = "COMPLETER LE READ ME \n"
	name_curl = "name"

	Dir.mkdir(repo_name)
	Dir.mkdir("#{repo_name}/lib")
	Dir.mkdir("#{repo_name}/spec")
	file = File.new("#{repo_name}/Gemfile", "w")
	file.puts gemfile_content
	file.close
	file = File.new("#{repo_name}/lib/app.rb", 'w')
	file.puts app_rb_content
	file.close
	file = File.new("#{repo_name}/spec/app_spec.rb", 'w')
	file.puts app_rb_spec_content
	file.close
	File.new("#{repo_name}/.env", 'w')
	file = File.new("#{repo_name}/.gitignore", 'w')
	file.puts gitignore_content
	file.close
	file = File.new("#{repo_name}/Readme.md", 'w')
	file.puts readme_content
	file.close

	Dir.chdir("#{repo_name}")
	system 'bundle install'
	system 'rspec --init'
	system 'git init'
	system "hub create -d '#{repo_name} - This repo was generated with a ruby script'"
	system 'git add .'
	system "git commit -m 'Initial commit'"
	system 'git push -u origin master'

end
def check_if_user_gave_input
  abort("mkdiruby : Please enter the new Repository name") if ARGV.empty?
end
def get_user_input
  return user_input = ARGV.first
end

perform

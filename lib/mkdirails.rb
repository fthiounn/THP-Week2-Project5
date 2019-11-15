#Creation d'un repertoire complet de projet rails avec creation d'un repo github

def perform

	#setting the content of the files we will create
	check_if_user_gave_input
	repo_name = get_user_input
  gitignore = ".env\n.DS_Store\npublic/assets"
  gems = "#gem for this project\ngem 'font-awesome-sass', '~> 5.11.2'\ngem 'bcrypt'\ngem 'table_print'\ngem 'faker'\ngem 'dotenv-rails'\ngem 'devise'"
  assets = "Rails.application.config.assets.paths << Rails.root.join('lib', 'assets', 'stylesheets')\nRails.application.config.assets.paths << Rails.root.join('lib', 'assets', 'javascripts')\nRails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'stylesheets')\nRails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'javascripts')"
	#Creating the git repo and initialization of gemfile and rspec
	system " rails _5.2.3_ new -d postgresql #{repo_name} "
	Dir.chdir("#{repo_name}")

  #adding .env and .ds_store to gitignore
  open('.gitignore', 'a') { |f|
  f.puts gitignore
  }
  #adding a few of my usual gems to the project
  open('Gemfile', 'a') { |f|
  f.puts gems
  }
  #adding assets setup
  open('config/initializers/assets.rb', 'a') { |f|
  f.puts assets
  }
  system 'mkdir lib/assets/ vendor/assets/ '
  system 'mkdir lib/assets/stylesheets/ lib/assets/javascripts/ vendor/assets/stylesheets/ vendor/assets/javascripts/'
	system 'bundle install'
	system 'rspec --init'
	system 'git init'
	system "hub create -d '#{repo_name} - Automated rails repo'"
	system 'git add .'
	system "git commit -m 'Initial commit'"
	system 'git push -u origin master'

end
#Both methods handle the user input
def check_if_user_gave_input
  abort("mkdirails : Please enter the new Repository name") if ARGV.empty?
end
def get_user_input
  return user_input = ARGV.first
end

perform



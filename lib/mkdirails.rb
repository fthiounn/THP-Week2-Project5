#Creation d'un repertoire complet de projet rails avec creation d'un repo github

def perform

	#setting the content of the files we will create
	check_if_user_gave_input
	repo_name = get_user_input

	#Creating the git repo and initialization of gemfile and rspec
	system " rails _5.2.3_ new -d postgresql #{repo_name} "
	Dir.chdir("#{repo_name}")
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



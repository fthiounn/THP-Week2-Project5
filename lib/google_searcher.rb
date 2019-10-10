require 'launchy'


def perform
	check_if_user_gave_input
	Launchy::Browser.run(landing_url)
end

def get_user_input
  return user_input = ARGV
end

def check_if_user_gave_input
  abort("Google Search : Missing input \nPlease enter a query") if ARGV.empty?
end

def landing_url
	return "https://www.google.com/search?q="+get_user_input.join("+")
end
perform
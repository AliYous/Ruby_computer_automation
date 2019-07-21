require 'watir'
require 'launchy'
#browser = Watir::Browser.new



def check_if_user_gave_input
    abort("mkdir: missing input") if ARGV.empty?
end

def get_search_url
  user_search = ARGV.first
  return "https://www.google.com/search?q=#{user_search}"
end




Launchy.open(get_search_url)



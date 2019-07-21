def check_if_user_gave_input
  abort("mkdir: missing input") if ARGV.empty?
end

def get_folder_name
  return folder_name = ARGV.first
end

def create_folder(name)
    Dir.mkdir(name)
end

def touch(name)
  File.new(name, "a")
end



def perform
    check_if_user_gave_input
    folder_name = get_folder_name
    create_folder(folder_name)
    Dir.chdir(folder_name)

    #Initialize Gemfile
    gemfile = touch("Gemfile")
    gemfile.puts('source "https://rubygems.org"')
    gemfile.puts("ruby '2.5.1'")
    gemfile.puts("gem 'rspec'")
    gemfile.puts("gem 'rubocop', '~> 0.57.2'")
    gemfile.puts("gem 'pry'")

    #Initialize .env file
    touch(".env")

    #Initialise git repo
    system("git init")
    gitignore = touch(".gitignore")
    gitignore.puts(".env")

    #Initialize rspec for running tests
    system("rspec --init")

    #Initialize README.md
    readme = touch("README.md")
    readme.puts("This is a ruby program")

    #Create lib directory 
    create_folder("lib")
end

perform
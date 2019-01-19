# création dossier général
def check_if_user_gave_input
  abort("Relance la commande suivie du nom du dossier à créer") if ARGV.empty?
end
def get_folder_name
  return folder_name = ARGV.join("_")
end
def create_folder(folder_name)
  Dir.mkdir(folder_name)
end

# création et écriture du Gemfile dans un dossier
def create_gemfile(folder_name)
  file = File.open("#{folder_name}/Gemfile", "a")
  file.puts("source 'https://rubygems.org'")
  file.puts("ruby '2.5.1'")
  file.puts("gem 'dotenv'")
  file.puts("gem 'pry'")
  file.puts("gem 'rspec'")
  file.puts("gem 'rubocop', '~> 0.57.2'")
  file.close
end

# Git init dans un dossier
def git_init(folder_name)
  system("cd #{folder_name}\ngit init")
end

# Rspec --init dans un dossier
def rspec(folder_name)
  system("cd #{folder_name}\nrspec --init")
end

# Création du fichier .env, puis on le met dans le fichier gitignore
def create_env_file_gitignore(folder_name)
  system("cd #{folder_name}\ntouch .env")
  file = File.open("#{folder_name}/.gitignore", "a")
  file.puts(".env")
  file.close
end

# Création du dossier lib
def create_folder_lib(folder_name)
  Dir.mkdir("#{folder_name}/lib")
end

# Création d'un Readme.md qui va dire que c'est un programme Ruby
def create_readme_ruby_program(folder_name)
  file = File.open("#{folder_name}/README.md", "a")
  file.puts("# #{folder_name}\n\n*Programme Ruby réalisé dans le cadre de la formation THP – The Hacking Project*.")
  file.close
end

# bundle
def bundle_install(folder_name)
  system("cd #{folder_name}\nbundle install")
end

# repo github + 1er commit
def create_github_repo(folder_name)
    system("cd #{folder_name}\nhub create")
    system("cd #{folder_name}\ngit add .")
    system("cd #{folder_name}\ngit commit -m \"First commit\"")
    system("cd #{folder_name}\ngit push origin master")
end

# Création d'un fichier .rubocop.yml pour que rubocop soit moins strict
def create_rubocop_file(folder_name)
  file = File.open("#{folder_name}/lib/.rubocop.yml", "a")
  file.puts("inherit_from:\n- http://relaxed.ruby.style/rubocop.yml\n
AllCops:
DisplayStyleGuide: true
DisplayCopNames: true\n
Exclude:
- 'db/schema.rb'
- 'vendor/**/*'
- 'config/environments/*.rb'
- 'bin/*'\n
Rails:
Enabled: True\n
Metrics/BlockLength:
Exclude:
- '../spec/**/*.rb'
- '../spec/spec_helper.rb'
- 'Guardfile'
- 'vendor/bundle')")
  file.close
end

def perform
  check_if_user_gave_input
  folder_name = get_folder_name # variable qui récupère le nom de fichier

  create_folder(folder_name)
  create_gemfile(folder_name)
  git_init(folder_name)
  rspec(folder_name)
  create_env_file_gitignore(folder_name)
  create_folder_lib(folder_name)
  create_readme_ruby_program(folder_name)
  bundle_install(folder_name)
  create_github_repo(folder_name)
  create_rubocop_file(folder_name)
end

perform

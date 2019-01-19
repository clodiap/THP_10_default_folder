    # Création d'un dossier qui porte le nom de l'ARGV de l'utilisateur
    #     Si l'utilisateur ne rentre pas de ARGV ou s'il rentre un ARGV avec plusieurs mots, le programme doit dire à l'utilisateur comment s'en servir et s'arrêter
    # Création du Gemfile avec les gems de THP
    # Git init
    # Création du fichier .env, puis on le met dans le fichier gitignore
    # Création du dossier lib
    # rspec --init
    # Création d'un Readme.md qui va dire que c'est un programme Ruby
    # Évidemment, tu vas créer un alias qui va s'occuper de pouvoir appeler ton programme avec mkdiruby (ou autre)

# création dossier général
def check_if_user_gave_input
  abort("missing input") if ARGV.empty?
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
  file.puts("source \"https://rubygems.org\"")
  file.puts("ruby '2.5.1'")
  file.puts("gem 'rubocop', '~> 0.57.2'")
  file.puts("gem 'rspec'")
  file.puts("gem 'pry'")
  file.puts("gem 'dotenv'")
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
  file.puts("# #{folder_name}\n\nProgramme Ruby réalisé par Claudia Partonnau")
  file.close
end

# bundle
def bundle_install(folder_name)
  system("cd #{folder_name}\nbundle install")
end

# repo github + 1er commit



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
end

perform



def find_makefile_path ()
  candidates = [ ENV["TM_MAKE_FILE"], File.expand_path('Makefile', ENV["TM_PROJECT_DIRECTORY"]) ]

  dir = ENV["TM_DIRECTORY"]
  while dir && dir != ENV["TM_PROJECT_DIRECTORY"] && dir != "/" && dir[0] == ?/
    candidates << File.join(dir, "Makefile")
    dir = File.dirname(dir)
  end

  candidates.find { |path| path && File.file?(path) }
end

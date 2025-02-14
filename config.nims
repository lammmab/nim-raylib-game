#
# Get the dependencies
#

task dependencies, "Get dependencies":
  exec "nimble install naylib classes"

#
# Build the project
#

task build, "build project":
  exec "nim c --d:release -o:Game.exe --outdir:./build ./src/main.nim"
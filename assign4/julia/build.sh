julia -e 'import Pkg; Pkg.add("Lazy")'
julia -e 'import Pkg; Pkg.add("IterTools")'


case $1 in
  run) julia assign/src/game.jl;;
  *) julia assign/test/runtests.jl;;
esac

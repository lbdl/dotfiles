
function pink_noise
    play -n -c2 -r44.1k synth brownnoise synth pinknoise mix synth 0 0 0 10 10 40 trapezium amod 0.1 30 $argv
end

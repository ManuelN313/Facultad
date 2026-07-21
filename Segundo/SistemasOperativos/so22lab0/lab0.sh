1) cat /proc/cpuinfo | grep -m 1 "model name"
2) cat /proc/cpuinfo | grep "processor" | wc -l
3) wget https://www.gutenberg.org/files/11/11-0.txt -O Manu_in_wonderland.txt && sed -i 's/Alice/Manu/g' Manu_in_wonderland.txt
4) sort -n -k 5 weather_cordoba.in | head -n 1 | cut -d ' ' -f-3 && sort -n -k 5 weather_cordoba.in | tail -n 1 | cut -d ' ' -f-3
5) sort -n -k 3 atpplayers.in
6) awk '{$9 = $7 - $8}1' superliga.in | sort -n -k 2 -k 9 | cut -d ' ' -f-8
7) ip addr | grep -o -E 'link/ether ([0-9a-f][0-9a-f]:?){6}?'
8a) mkdir fullmetal_alchemist && cd fullmetal_alchemist && touch fma_S01E{01..10}_es.srt && ls
8b) for i in {01..10}; do mv "fma_S01E${i}_es.srt" "fma_S01E${i}.srt"; done && ls
Oa) ffmpeg -i example.mp4 -ss 00:00:04 -to 00:00:24 -c:v copy -c:a copy example2.mp4
Ob) ffmpeg -i sound2.mp3 -i sound1.mp3 -filter_complex amix=inputs=2:duration=longest:dropout_transition=0:normalize=0 sound3.mp3

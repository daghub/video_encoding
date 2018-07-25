for i in *.dv ; do

#/usr/bin/HandBrakeCLI -i "$i" -o "../out/${i%dv}mp4" -e x264 --strict-anamorphic --deinterlace slower --two-pass -E faac -B 160 -f mp4;
cvlc -vvv "$i" --sout="#transcode{vcodec=h264,vb=2500,acodec=mp4a,ab=128,deinterlace,vfilter=canvas{no-padd,height=576,width=720,aspect=4:3}}:standard{mux=ts,dst=\"../out/temp.ts\",access=file}" vlc://quit
ffmpeg -i ../out/temp.ts -bsf:a aac_adtstoasc -vcodec copy -acodec copy ../out/${i%dv}mp4
rm ../out/temp.ts
mv "$i" "$i-done"
done


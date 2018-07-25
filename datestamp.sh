cd out
for i in $(find $document_root -name sony-\*.mp4) ; do
     touch -t $(echo $i | sed 's/.*sony-\([0-9]\{4\}\)\.\([0-9]\{2\}\)\.\([0-9]\{2\}\)_\([0-9]\{2\}\)-\([0-9]\{2\}\)-\([0-9]\{2\}\).mp4/\1\2\3\4\5.\6/')  $i;
done

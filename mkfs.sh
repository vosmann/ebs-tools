sudo apt-get install xfsprogs

sudo mkfs -t xfs /dev/xvdf
sudo mkdir /data
sudo mount -o rw /dev/xvdf /data
echo "Prepared xvdf volume (data)." > /data/prepared.note
unmount /data

sudo mkfs -t xfs /dev/xvdg
sudo mkdir /commitlog
sudo mount -o rw /dev/xvdg /commitlog
echo "Prepared xvdg volume (commitlog)." > /commitlog/prepared.note
unmount /commitlog


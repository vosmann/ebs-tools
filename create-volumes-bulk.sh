NR_NODES_PER_AZ=${1:-1}  # 5
DATA_SIZE=${2:-16}     # 1024
COMMITLOG_SIZE=${3:-4} # 256

VOL_IDS=""
for INDEX in `seq 1 $NR_NODES_PER_AZ`; do
    for AZ in eu-west-1a eu-west-1b eu-west-1c; do

        echo "Creating data volume $INDEX in AZ $AZ."
        DATA_VOL_ID=$(aws ec2 create-volume --size $DATA_SIZE --availability-zone $AZ --volume-type gp2 | jq -r '.VolumeId')
        echo "Created data volume $INDEX in AZ $AZ. ID: $DATA_VOL_ID"
        aws ec2 create-tags --resources $DATA_VOL_ID --tags Key=Name,Value=cassandra-data-volume
        DATA_VOL_IDS="$DATA_VOL_IDS $DATA_VOL_ID"

        echo "Creating commitlog volume $INDEX in AZ $AZ."
        COMMITLOG_VOL_ID=$(aws ec2 create-volume --size $COMMITLOG_SIZE --availability-zone $AZ --volume-type gp2 | jq -r '.VolumeId')
        echo "Created data volume $INDEX in AZ $AZ. ID: $COMMITLOG_VOL_ID"
        aws ec2 create-tags --resources $COMMITLOG_VOL_ID --tags Key=Name,Value=cassandra-commitlog-volume
        COMMITLOG_VOL_IDS="$COMMITLOG_VOL_IDS $COMMITLOG_VOL_ID"
    done
done
echo "Created the following data volumes: $DATA_VOL_IDS"
echo "Created the following commitlog volumes: $COMMITLOG_VOL_IDS"


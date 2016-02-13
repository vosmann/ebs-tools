# EBS tools

The purpose of the scripts in this repository is to prepare EBS volumes for use with EC2 instances.
The scripts make use of Zalando's [STUPS platform](https://stups.io/). Senza is used to create 
Taupage AMI instances that automatically attach a volume and create a file system on them. Of course,
this can be achieved in other ways, but using Senza and Taupage offer an out-of-the-box solution for this.

The prepared EBS volumes can then be used in scenarios where they need to be attached to running EC2
instances with their file systems and data untouched.
An example use case would be [Cassandra node maintenance](https://github.com/vosmann/cassandra-ebs-tools).


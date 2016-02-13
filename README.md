# EBS tools

The purpose of the scripts in this repository is to prepare EBS volumes for use with EC2 instances.
The scripts make use of Zalando's [STUPS platform](https://stups.io/). Senza is used to create 
Taupage AMI instances that automatically attach a volume and create a file system on them. Of course,
this can be achieved in other ways, but using Senza and Taupage offer an out-of-the-box solution for this.


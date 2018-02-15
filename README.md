# DevOps

This repository contains a basic example of vagrant file and puppet provisioning configuration files.
This example  has been copied from the book DevOps in practice.

## run

The following vagrant file creates three VMs: database VM, server VM and a monitoring VM.

If you want to run the this example you should download an ubuntu box: hashicorp/precise32 of instance.

Add it to vagrant using the command 

    vagrant box add hashicorp/precise32

Then you can deploy the configuration file in vagrant, you only have to go to the directory containing the vagrant file and then run the following command:

    vagrant up

If you want to provision using puppet files then use the following command where VM is a configured virtual machine in vagrant file:

    vagrant provision {VM}

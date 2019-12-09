STM32 Common Development Environment (CDE)
----

This repo is a template for creating CDE images for Docker and AWS,
using Packer and Vagrant and using Ansible for provisioning. This
repo is part of a post series about using DevOps on embedded, that
you can find here:

[https://www.stupid-projects.com/devops-for-embedded-part-1/](https://www.stupid-projects.com/devops-for-embedded-part-1/)
[https://www.stupid-projects.com/devops-for-embedded-part-2/](https://www.stupid-projects.com/devops-for-embedded-part-2/)

> Note: for complete information details also advise the post, but
in general this README will updated more often than the post.

## Prerequisites
To use this repo you need to have Packer, Vagrant, Ansible and Docker
installed to your host. The versions for each tool used for this repo
are:

* Packer: 1.4.5
* Vagrant: 2.2.6
* Ansible: 2.9.1
* Docker: 19.03.5

For creating the AWS EC2 AMI you also need to have an AWS account and
create your credentials. You can find more about how to do this in the
AWS online documentation. This template assumes that you have an AWS free
tier account, therefore you shouldn't expect any costs by using this
repo to build the image. The usage of the AMI may have additional costs,
though, depending your usage.

You also need a docker.io account and create a new repository and tokens
in order to be able to push images to the docker hub.

## Usage
To build the docker image and push it to the registry you need first to
change the `docker_repo` variable in the `stm32-cde-docker.json` and
`stm32-cde-images.json` path with your repository name. Then build the
image running this command:
```sh
packer build stm32-cde-docker.json
```

or if you want to build both docker and aws AMI:
```sh
packer build stm32-cde-images.json
```

To build only the aws AMI then run this command:
```sh
packer build stm32-cde-images.json
```

## What now?
Please read these post [here](https://www.stupid-projects.com/devops-for-embedded-part-1/) and [here](https://www.stupid-projects.com/devops-for-embedded-part-2/)
for more information.

## Author
Dimitris Tassopoulos <dimtass@gmail.com>
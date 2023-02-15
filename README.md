# ansible & terraform project

## description

- This project is a demonstration of how to use Terraform and Ansible to create a VPC with 4 subnets, 2 availability zones, 2 public and 2 private subnets, a bastion host, 2 private instances, a NAT gateway, an internet-facing load balancer and then configure the private instances with nexus, postgresql, and sonarqube

- ansible folder consists of playbook.yaml, inventory.txt, and roles folder

- roles
    1. nexus
    2. postgresql (sonarqube requirement)
    3. sonarqube

- versions of the abovementioned roles can be edited through roles/*required-role*/vars/main.yml file

---

![Alt text](./photos/project-description.png?raw=true "Title")


## prerequisites

Before you begin, ensure you have met the following requirements:

- You have installed Terraform and Ansible
- You have an AWS account with administrative access
- config ~/.ssh/config to include your bastion host data as follow

```bash
    Host bastion

        hostname bastion_public_ip
        user ubuntu
        port 22
        identityfile /path/to/bastion/key.pem

```

## usage

1. clone the project
2. in terraform folder, init and apply
3. use public ip address and private ip addesses in all-ips.txt file (generated from terraform) to create your inventory ansible file
4. in ansible folder, run ansible-playbook playbook.yaml -i inventory.txt

## photos

- I have created AWS ALB rules manually
- These photos are taken before automating infra creation using terraform

---

- created ec2 instances

![Alt text](./photos/ec2-instances.png?raw=true "Title")

---

- target groups, btw autoscalling groups will be simillar to them

![Alt text](./photos/target-groups.png?raw=true "Title")

---

- created internet facing load balancer, can be used as reverse proxy for private instances :wink:

![Alt text](./photos/internet-facing-load-balancer.png?raw=true "Title")

---

- load balancer listener routing rules

![Alt text](./photos/listener-rules.png?raw=true "Title")

---

- default load balancer page

![Alt text](./photos/default-lb-page.png?raw=true "Title")

---

- routed sonarqube page

![Alt text](./photos/sonar.png?raw=true "Title")

---

- routed nexus page

![Alt text](./photos/nexus.png?raw=true "Title")

---

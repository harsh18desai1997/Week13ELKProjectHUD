# ELKSTACKProject
## Automated ELK Stack Deployment
Repository for Week 13 Project of Harsh Desai

The Files that are attached in this repository are depicted in the network diagram below.

[Network Diagram](Diagrams/ELK_STACK_DIAGRAM.jpg)

Files such as filebeat-playbook.yml, metricbeat-playbook.yml have been installed on elk server with the help of docker container in jump box privisioner vm and working in web-1 vm.

  - _[Filebeat Playbook](Ansible/filebeat-playbook.yml)_

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build

### Description of the Topology

The purpose of this project is to explain the function of virtual machines, resource groups, network security groups, and different virtual networks. In this project, I used:

|       Function Name            |   Name USED   |
|--------------------------------|---------------|
| Resource Group                 | RedTEAMRG     |
| Network Security Group         | ELK-SERVER-nsg|
|                                | RedTEAMNSG    |
| Virtual Networks               | ELKVNET       |
|                                | RedTEAMVNET   |
| Load Balancer                  | RedTeamLB     |

Load balancing is a device that acts as a reverse proxy and distributes network or application traffic across a number of servers. Load balancers are used to increase capacity (concurrent users) and reliability of applications.

- _We also use the jumpbox to ensure the integrity of our web servers by restricting where access can come from._

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the servers and system files.
- _Filebeat handles the system files by monitoring log files._
- _Metricbeat handles the servers by collecting metrics from the system and services running on it._

The configuration details of each machine may be found below.

| Name                 | Function     | IP Address    | Operating System |
|----------------------|--------------|---------------|------------------|
| Jump-Box-Provisioner | Gateway      | 20.9.8.71     | Linux            |
| Web #1               | Web Server   | 20.9.54.192   | Linux            |
| Web #2               | Web Server   | 20.9.54.192   | Linux            |
| Web #3               | Web Server   | 20.9.54.192   | Linux            |
| ELK-SERVER           | Log Server   | 20.127.31.165 | Linux            |

### Access Policies

Access to the Jump Box VM, Web VMs and ELK Server VM are available through Inbound Security Rules on NSG named: RedTEAMNSG and ELK-SERVER-nsg: 

| NSG Name       | Priority | Name              |  Port  | Protocol |     Source     |   Destination  |
|----------------|----------|-------------------|--------|----------|----------------|----------------|
| RedTEAMNSG     |   350    | SSHFromJumpBox    |  22    |   TCP    | 10.0.0.4       | VirtualNetwork |
|                |   4000   | SSH               |  22    |   TCP    | 73.101.106.120 | VirtualNetwork |
|                |   4010   | Port_80           |  80    |   ANY    | 73.101.106.120 | VirtualNetwork |
| ELK-SERVER-nsg |   700    | Kibana9200        |  9200  |   ANY    | 73.101.106.120 | VirtualNetwork |
|                |   800    | Kibana5601        |  5601  |   ANY    | 73.101.106.120 | ANY            |
|                |   1000   | default-allow-ssh |  22    |   TCP    | ANY            | ANY            |

 
Machines within the network can only be accessed by the Jump Box. More specifically the Docker container within the Jumpbox with the proper ssh keys.
- _The ELK server can also be accessed through my personal computer using the IP 73.101.106.120 on port 5601 to view the Kibana dashboard._

A summary of the access policies in place can be found in the table below.

| Name                   | Publicly Accessible |   Allowed IP Addresses   |
|------------------------|---------------------|--------------------------|
| Jump-Box-Provisioner   | No                  | 73.101.106.120           |
| Web #1                 | Yes                 | 73.101.106.120, 10.0.0.4 |
| Web #2                 | Yes                 | 73.101.106.120, 10.0.0.4 |
| Web #3                 | Yes                 | 73.101.106.120, 10.0.0.4 |
| ELK-SERVER             | No                  | 73.101.106.120, 10.0.0.4 |

### Elk Configuration

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.
`
![](Images/ELK_Docker_PS.jpg)

### Target Machines & Beats
The ELK server and DWVA container are configured to monitor the following machines:
- _Web #1: 10.0.0.5_
- _Web #2: 10.0.0.6_
- _Web #3: 10.0.0.7_

We have installed the following Beats on Elk:
- _Filebeats and Metricbeats_

These Beats allow us to collect the following information from each machine:
- _Filebeat follows and harvests info on files that we specify and many other modules. EX: We can receive info from a syslog for number of sudo commands or ssh logins._
- _Metricbeat allows us to collect metrics or numbers the system or other modules keep track of. EX: We can recieve info from the system on cpu usage and remaining space on the hard drive._

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy both the filebeat and metricbeat playbooks and config files to the `/etc/ansible` directory.
- Update the config files to include the IPs and ports of the machines you are looking to monitor.
- Run the playbook, and navigate to `http://[your.VM.IP]:5601/app/kibana#/home/tutorial/systemLogs` to check that the installation worked as expected. Check this by scrolling to the bottom and hit the "Check Data" button. You should receive a message similar to this
![](Images/FileBeat_Activated.png)
- For Meatricbeat, navigate to `http://[your.VM.IP]:5601/app/kibana#/home/tutorial/dockerMetrics`, and again scroll to the bottom and hit check data. You should receive a message similar to this.
![](Images/Metric_Beat_Activated.png)

### FAQ
- _Which file is the playbook? Where do you copy it?_
  - there are four files
  - _[Filebeat Playbook](Ansible/filebeat-playbook.yml)_
  - _[Metricbeat Playbook](Ansible/metricbeat-playbook.yml)_
  - _[DVWA Install Playbook](Ansible/dvwa_install.yml)_
  - _[ELK Install Playbook](Ansible/install-elk.yml)_
  - These files are installed and located in /etc/ansible/hosts directory in web vm file explorer.
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
  - _While in the `/etc/ansible` directory you should see a file called `hosts`. In this file you can create web server groups in which to specify what computers you want to install files on._
  - _[HOSTS FILE](Ansible/hosts)_
- _Which URL do you navigate to in order to check that the ELK server is running?_
  - _To check if the ELK server is running you can navigate to `http://[your.VM.IP]:5601/app/kibana`. It should look similar to the following image:_
![](Images/Kibana_Setup.jpg)

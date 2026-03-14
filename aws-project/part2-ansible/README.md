# ⚙️ Part 2 — Ansible Automation

## What it does

Instead of manually SSHing into the EC2 and running commands, Ansible automates the entire setup from your local machine.

## Files

| File | Purpose |
|------|---------|
| `install-docker.yml` | Playbook — installs Docker, adds user to docker group, changes SSH to port 4444 |
| `inventory.ini` | Tells Ansible which server to target |

## How to Run

**1. Update inventory.ini with your EC2's IP:**
```ini
[webservers]
<your-ec2-ip> ansible_user=ubuntu ansible_ssh_private_key_file=~/your-key.pem ansible_port=22
```

**2. Run the playbook:**
```bash
ansible-playbook -i inventory.ini install-docker.yml
```

**3. After it runs, update inventory to port 4444 and reconnect:**
```bash
ssh -i ~/your-key.pem -p 4444 ubuntu@<your-ec2-ip>
```

## What Ansible Does vs Doing it Manually

| Manual | Ansible |
|--------|---------|
| SSH in | Runs remotely |
| `apt install docker.io` | `apt` module |
| `usermod -aG docker ubuntu` | `user` module |
| Edit sshd_config | `lineinfile` module |
| `systemctl restart ssh` | `systemd` module |

Same result. One command instead of five manual steps. Scale to 100 servers with zero extra effort.

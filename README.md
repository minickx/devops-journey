# ☁️ AWS Project

End-to-end project covering containerization, cloud deployment, SSH hardening, and infrastructure automation.

---

## Structure
```
aws-project/
├── part1-docker/    # Dockerfile, ECR push, EC2 deployment
└── part2-ansible/   # Ansible playbook to automate EC2 setup
```

---

## What This Project Does

1. Builds a Docker image from a custom Dockerfile
2. Pushes it to AWS ECR (Elastic Container Registry)
3. Deploys it to an EC2 instance — accessible from the internet
4. Hardens SSH by moving it from port 22 to port 4444
5. Automates the entire EC2 setup using Ansible

---

## Parts

| Part | Description |
|------|-------------|
| [Part 1 — Docker](./part1-docker/) | Build, push, and run a container on AWS |
| [Part 2 — Ansible](./part2-ansible/) | Automate EC2 configuration with a playbook |

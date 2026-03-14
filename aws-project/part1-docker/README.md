# 🐳 Part 1 — Docker + AWS Deployment

## What it does

Builds a containerized Nginx web app and deploys it to AWS EC2 via ECR so anyone on the internet can access it.

## Stack

- **Docker** — containerization
- **AWS ECR** — container registry
- **AWS EC2** — cloud VM (t3.micro, Ubuntu 22.04)
- **AWS CLI** — everything done from the terminal, no clickops

## Files

| File | Purpose |
|------|---------|
| `dockerfile` | Recipe for the Docker image |
| `index.html` | The app being served |

## How to Reproduce

**1. Build the image locally:**
```bash
docker build -t my-first-app .
docker run -p 8080:80 my-first-app
# hit localhost:8080 to verify
```

**2. Push to ECR:**
```bash
aws ecr create-repository --repository-name my-first-app --region us-east-1
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <account-id>.dkr.ecr.us-east-1.amazonaws.com
docker tag my-first-app:latest <account-id>.dkr.ecr.us-east-1.amazonaws.com/my-first-app:latest
docker push <account-id>.dkr.ecr.us-east-1.amazonaws.com/my-first-app:latest
```

**3. Launch EC2 and pull the image:**
```bash
aws ec2 run-instances \
  --image-id ami-0c7217cdde317cfec \
  --instance-type t3.micro \
  --key-name your-key \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=devops-lab}]'
```

Then SSH in, install Docker, authenticate to ECR, and run:
```bash
docker run -d -p 80:80 <account-id>.dkr.ecr.us-east-1.amazonaws.com/my-first-app:latest
```

## Security

- SSH moved from port 22 to **port 4444**
- Port 22 removed from security group after confirmed access on 4444
- `.pem` keys excluded via `.gitignore` — never committed

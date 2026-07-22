# AWS Three-Tier Infrastructure — Terraform

A small, self-contained Terraform project that provisions a basic three-tier
AWS environment: a VPC with public/private subnets, an EC2 web tier, and an
RDS database tier. Built as a portfolio piece to demonstrate Infrastructure
as Code fundamentals — modular structure, remote state, and a CI pipeline
that validates every change before it can be applied.

## Architecture

```
                        ┌────────────────────┐
                        │        VPC          │
                        │  10.0.0.0/16         │
                        │                      │
   Internet ──────────► │  Public Subnet       │
                        │   └── EC2 (web)      │
                        │                      │
                        │  Private Subnet      │
                        │   └── RDS (Postgres) │
                        └────────────────────┘
```

## Structure

```
.
├── main.tf              # root module — wires vpc/ec2/rds together
├── variables.tf         # input variables
├── outputs.tf           # exposed outputs (VPC id, EC2 public IP, RDS endpoint)
├── providers.tf         # AWS provider + backend config
├── terraform.tfvars.example
├── modules/
│   ├── vpc/              # VPC, subnets, route tables, IGW
│   ├── ec2/              # web tier instance + security group
│   └── rds/              # Postgres instance + subnet group + security group
└── .github/workflows/
    └── terraform-ci.yml  # fmt check, validate, plan on every PR
```

## Usage

```bash
cp terraform.tfvars.example terraform.tfvars   # fill in your values
terraform init
terraform plan
terraform apply
```

## CI/CD

Every pull request triggers `terraform fmt -check`, `terraform validate`,
and `terraform plan` via GitHub Actions (see `.github/workflows/terraform-ci.yml`).
Apply is intentionally left as a manual step — this repo is a demonstration
of pipeline hygiene, not a production deployment target.

## Notes

This is a portfolio/demo project showing IaC and CI/CD practices. It is not
connected to any live AWS account by default — you'll need to supply your
own credentials and state backend to actually run it.

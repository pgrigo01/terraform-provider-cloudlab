<!-- markdownlint-disable first-line-h1 no-inline-html -->
<a href="https://terraform.io">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset=".github/terraform_logo_dark.svg">
    <source media="(prefers-color-scheme: light)" srcset=".github/terraform_logo_light.svg">
    <img src=".github/terraform_logo_light.svg" alt="Terraform logo" title="Terraform" align="right" height="50">
  </picture>
</a>

# Terraform CloudLab Provider
[discuss-badge]: https://img.shields.io/badge/discuss-terraform--cloudlab-623CE4.svg?style=flat
![Forums][discuss-badge]

The [CloudLab Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) allows [Terraform](https://terraform.io) to manage [CloudLab](https://www.cloudlab.us/) resources.

## Usage Example
```

# CloudLab provider configuration, specifying the path to the credentials file and API endpoint
terraform {
  required_providers {
    cloudlab = {
      source  = "pgrigo01/cloudlab"
      version = "1.0.0" 
    }
  }
}

provider "cloudlab" {
  project          = "UCY-CS499-DC"
  credentials_path = "cloudlab-decrypted.pem" 
  browser= "chrome" 
}


# resource "cloudlab_simple_experiment" "experiment1"{
#     name = "exp1"
#     routable_ip = true
#     image        = "UBUNTU 24.04"
#     aggregate   = "utah.cloudlab.us"
# }

# resource "cloudlab_simple_experiment" "experiment2"{
#     name = "exp1"
#     routable_ip = true
#     image        = "UBUNTU 24.04"
#     aggregate   = "emulab.net"
# }

```

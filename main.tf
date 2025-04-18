
# CloudLab provider configuration, specifying the path to the credentials file and API endpoint
terraform {
  required_providers {
    cloudlab = {
      source  = "pgrigo01/cloudlab"
      version = "1.0.2" #change to 1.0.1 if you want to use firefox
      
    }
  }
}

provider "cloudlab" {
  project          = "UCY-CS499-DC"
  credentials_path = "cloudlab-decrypted.pem" 
  # browser= "firefox" # uncomment with version 1.0.1 above
  browser= "chrome" #uncomment with version 1.0.0 above
}


# resource "cloudlab_simple_experiment" "experiment1"{
#     name = "experiment1"
#     routable_ip = true
#     image        = "UBUNTU 22.04"
#     aggregate    = "emulab.net"
# }


# resource "cloudlab_simple_experiment" "experiment2"{
#     name = "experiment2"
#     routable_ip = true
#     image        = "UBUNTU 22.04"
#     aggregate    = "emulab.net"
# }

# resource "cloudlab_simple_experiment" "experiment3"{
#     name = "vm1"
#     routable_ip = true
#     image        = "UBUNTU 22.04"
#     aggregate    = "emulab.net"
# }
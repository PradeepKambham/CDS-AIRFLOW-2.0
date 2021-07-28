provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "/Users/prade/.aws/credentials"
  profile                 = "customprofile"
}


module "pradeep_vpc" {
  source = "git::https://github.com/PradeepKambham/CDS-AIRFLOW-2.0.git//modules/vpc"
  vpc_id=module.pradeep_vpc.vpc_id
  vpc_cidr="10.0.0.0/16"
  subnet_cidr_block="10.0.1.0/24"
}



module "pradeep_webserver" {
  source = "git::https://github.com/PradeepKambham/CDS-AIRFLOW-2.0.git//modules/ec2"
  ami="ami-0dc2d3e4c0f9ebd18"
  subnet_id=module.pradeep_vpc.subnet_id
  instance_type="t2.micro"
  iam_instance_profile=module.pradeep_iam.ec2_profile
  webserver_name="pradeep"
  
}

module "pradeep_iam" {
  source = "git::https://github.com/PradeepKambham/CDS-AIRFLOW-2.0.git//modules/IAM"
  ec2_policy_path="ec2_policy.json"
  ec2_assume_policy_path="ec2-assume-policy.json"
  ec2_role_id=module.pradeep_iam.ec2_role_id
  ec2_role_tag_name="ec2_role"
  ec2_policy_name="ec2_policy"
  ec2_role_name=module.pradeep_iam.ec2_role_name
  ec2_profile_name="ec2_profile"


  
}






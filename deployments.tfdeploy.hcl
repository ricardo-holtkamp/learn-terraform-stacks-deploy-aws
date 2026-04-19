# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "aws" {
  audience = ["aws.workload.identity"]
}

deployment "development" {
  inputs = {
    regions        = ["us-east-1"]
    role_arn       = "arn:aws:iam::718959508365:role/stacks-Learn-Stacks-Learn-Stacks"
    identity_token = identity_token.aws.jwt
    default_tags = {
      Stack       = "learn-stacks-deploy-aws",
      Environment = "dev"
    }
  }
  destroy = true
}

deployment "production" {
  inputs = {
    regions        = ["us-east-1", "eu-central-1"]
    role_arn       = "arn:aws:iam::718959508365:role/stacks-Learn-Stacks-Learn-Stacks"
    identity_token = identity_token.aws.jwt
    default_tags = {
      Stack       = "learn-stacks-deploy-aws",
      Environment = "prod"
    }
  }
}




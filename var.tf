locals {
    bucket_settings = {
        bucket = "my-random-bucket-1234567"
        acl = "public-read"
    }
    files = ["cat.png", "error.html", "index.html"]
}
variable "secret_key" {
    type = string
    description = "Access key for your AWS account"

}

variable "secret_id" {
    type = string
    description = "Secret key for your AWS account"
}
variable "region" {
    type = string
    description = "Define AWS region"
    default = "eu-west-1"
}
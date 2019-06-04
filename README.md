# Terraform AWS

This is a repository containing a demo on how to implement [terraform-modules](https://github.com/marnas/terraform-modules).

## Folder structure

```
├── live
    ├── global
    │   └── s3
    │       ├── backend.tf
    │       └── main.tf
    └── stage
        ├── data-stores
        │   └── mysql
        │       ├── main.tf
        │       ├── output.tf
        │       └── variables.tf
        └── services
            └── webserver-cluster
                ├── main.tf
                └── output.tf
```

## Global

### S3

Simple S3 Bucket used to store Terraform tfstate files remotely.

* Versioning enabled
* Encryption enabled

## Stage

### MySql

In order to deploy the MySql Database a password will be required.

```
export TF_VAR_db_password="(YOUR_DB_PASSWORD)"
```


### Webserver Cluster

The DNS name of the cluster will be displayed when the plan will be applied.

## Deploying

Easiest way to setup the AWS credentials is via the AWS CLI

```
aws configure
```

Please note that this is just a demo and many variables have been hardcoded *(e.g. S3 Bucket name)*, so you will need to replace them in order to deploy the infrastructure.
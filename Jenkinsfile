pipeline {
	parameters {
		choice(name:'action', choices:'create\ndestroy', description:'Create/update or destroy an EKS cluster')
	}
	agent any
	environment {
  PATH = "${PATH}:${getTerraformPath()}"
    }
	stages {
		stage("Terraform init in default namespace") {
			when {
				expression { params.action == 'create' }
			}
			steps {
				withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'my-aws-creds', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
					sh "terraform init"
				}
			}
		}
		stage("Terraform plan") {
			when {
				expression { params.action == "create" }
			}
			steps {
				withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'my-aws-creds', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
					sh "terraform plan"
				}
			}
		}
		stage("Terraform apply") {
			when {
				expression { params.action == 'create' }
			}
			steps {
				withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'my-aws-creds', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
					sh "terraform apply -auto-approve"
				}
			}
		}
		stage("Terraform destroy") {
			when {
				expression { params.action == 'destroy' }
			}
			steps {
				withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'my-aws-creds', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
					sh "terraform destroy -auto-approve"
				}
			}
		}
	}
}

def getTerraformPath(){
	def tfHome = tool name: 'terraform', type: 'terraform'
	return tfHome
}

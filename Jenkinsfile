pipeline {
	agent any
	environment {
  PATH = "${PATH}:${getTerraformPath()}"
    }
	stages {
		stage("Terraform init in default namespace") {
			steps {
				sh "terraform init"
			}
		}
		stage("Terraform plan") {
			steps {
				sh "terraform plan"
			}
		}
		stage("Terraform apply") {
			steps {
				sh "terraform apply -auto-approve"
			}
		}
	}
}

def getTerraformPath(){
	def tfHome = tool name: 'terraform', type: 'terraform'
	return tfHome
}
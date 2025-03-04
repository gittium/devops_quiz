
terraform { 
  required_providers { 
    docker = { 
      source  = "kreuzwerker/docker" 
      version = "3.0.2" 
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.3"
    } 
  } 
} 

provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}

resource "docker_image" "my_app" {
  name = "node-express-app:latest"

  build {
    context    = "devops_quiz-main\node_modules"
    dockerfile = "Dockerfile"
  }


}



resource "docker_container" "my_container" {
  name = "my-express-app"
  image = docker_image.my_app.name
  ports {
    internal = 3000
    external = 3000
  }
}

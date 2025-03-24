variable "frontend_image" {
  description = "Docker image for the frontend"
  type        = string
  default     = "react-frontend:latest"
}

variable "backend_image" {
  description = "Docker image for the backend"
  type        = string
  default     = "node-backend:latest"
}

variable "frontend_port" {
  description = "Frontend application port"
  type        = number
  default     = 3000
}

variable "backend_port" {
  description = "Backend application port"
  type        = number
  default     = 3001
}


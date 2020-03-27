variable "user_names" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = ["Paul_Dirac", "Erwin_Schrodinger", "Wolfgang_Pauli"]
}

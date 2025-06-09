output "subnets_output" {
  value = {
    for key, value in aws_subnet.my_subnets : key => value.id
  }
  description = "Output the Subnets for usage in the Compute Environment"
}

output "security_groups_output" {
  value = {
    for key, value in aws_security_group.sg : key => value.id
  }
  description = "Output the Security Groups for usage in the Compute Environment"
}
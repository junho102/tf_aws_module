resource "aws_iam_user" "db_manager" {
  for_each = {
    alice = {
      level = "low"
      manager = "posquit0"
    }
    bob = {
      level = "mid"
      manager = "steve"
    }
  }
  name = each.key
  tags = each.value
}
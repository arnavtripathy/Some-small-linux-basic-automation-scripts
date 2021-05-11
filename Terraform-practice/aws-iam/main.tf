resource "aws_iam_user" "iam_user"{
      name="test_user"
}
resource "aws_iam_policy" "admin_access_policy"{
	name="admin_policy"
	description="Admin Access Policy"
	policy=file("policy.json")
}
resource "aws_iam_user_policy_attachment" "test-attach" {
  user       = aws_iam_user.iam_user.name
  policy_arn = aws_iam_policy.admin_acess_policy.arn
}



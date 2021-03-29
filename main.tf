resource "aws_instance" "Lamp" {
  ami                    = "ami-013fffc873b1eaa1c"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.secret2.id]
  key_name               = aws_key_pair.deploy2.key_name
  user_data              = file("lamp1.sh")
  tags = {
    Name    = "lamp-web"
    Owner   = "test"
    project = "terraform-lamp"
  }
}
#resource "aws_db_instance" "my_database_instance" {
#  allocated_storage      = 20
#  storage_type           = "gp2"
#  engine                 = "mysql"
#  engine_version         = "5.7"
#  instance_class         = "db.t2.micro"
#  port                   = 3306
#  vpc_security_group_ids = [aws_security_group.secret2.id]
#  name                   = "mydb"
#  identifier             = "mysqldb"
#  username               = "myuser"
#  password               = "mypassword"
#  parameter_group_name   = "default.mysql5.7"
#  skip_final_snapshot    = true
#  tags = {
#    Name = "my_database_instance"
#  }
#}

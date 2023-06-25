lbname="tf-lb-from-tfvar"
alb_name="tf-terraform-elb"
az_list=["us-west-2a", "us-west-2b", "us-west-2c"]
timeout=400
protocol=["http","https"]
ports={"port80":80,"port8080":8080,"port443":443}
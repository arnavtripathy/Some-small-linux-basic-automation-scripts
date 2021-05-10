resource "local_file" "test" {
	content= "$(static_time.Time.id)"
	filename = "Test"

}

resource "static_time" "Time"{
}



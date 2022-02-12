# This is a hilarious usecase for a Makefile.
image: Dockerfile
	docker build --platform linux/amd64 -t hackerman:latest . 

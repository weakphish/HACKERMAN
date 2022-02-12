# This is a hilarious usecase for a Makefile.
image: Dockerfile
	docker build -t hackerman:latest .

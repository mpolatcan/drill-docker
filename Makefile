# TODO All versions will be added
.PHONY: publish-drill
publish-drill:
	sudo docker build -q -t mpolatcan/drill:ubuntu ./ubuntu/drill/
	sudo docker push mpolatcan/drill:ubuntu
	sudo docker rmi mpolatcan/drill:ubuntu

	sudo docker build -q -t mpolatcan/drill:alpine ./alpine/drill/
	sudo docker push mpolatcan/drill:alpine
	sudo docker rmi mpolatcan/drill:alpine
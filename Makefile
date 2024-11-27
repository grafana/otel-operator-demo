KUBECTL := kubectl --context kind-otel-onboarding

.PHONY: setup-cluster
setup-cluster:
	kind create cluster -n otel-onboarding

.PHONY: cleanup
cleanup:
	kind delete cluster -n otel-onboarding

.PHONY: setup-cert-manager
setup-cert-manager:
	$(KUBECTL) apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.16.1/cert-manager.yaml
	$(KUBECTL) wait --for=condition=Available deployments/cert-manager -n cert-manager

.PHONY: setup-instrumentation
setup-instrumentation:
	$(KUBECTL) apply -f manifests/operator.yaml
	$(KUBECTL) apply -f manifests/collector.yaml
	$(KUBECTL) apply -f manifests/instrumentation.yaml

.PHONY: setup-apps
setup-apps: build-apps import-images
	$(KUBECTL) apply -f manifests/applications/python.yaml
	$(KUBECTL) apply -f manifests/applications/nodejs.yaml
	$(KUBECTL) apply -f manifests/applications/java.yaml
	$(KUBECTL) apply -f manifests/applications/dotnet.yaml

.PHONY: build-apps
build-apps: build-python build-nodejs build-java build-dotnet

.PHONY: build-python
build-python:
	docker build -f applications/python/Dockerfile -t rolldice-python:latest applications/python

.PHONY: build-nodejs
build-nodejs:
	docker build -f applications/nodejs/Dockerfile -t rolldice-nodejs:latest applications/nodejs

.PHONY: build-java
build-java:
	docker build -f applications/java/Dockerfile -t rolldice-java:latest applications/java

.PHONY: build-dotnet
build-dotnet:
	docker build -f applications/dotnet/Dockerfile -t rolldice-dotnet:latest applications/dotnet

.PHONY: import-images
import-images:
	kind load docker-image -n otel-onboarding rolldice-python:latest
	kind load docker-image -n otel-onboarding rolldice-nodejs:latest
	kind load docker-image -n otel-onboarding rolldice-java:latest
	kind load docker-image -n otel-onboarding rolldice-dotnet:latest

SHELL := bash
KUSTOMIZE ?= kubectl kustomize
KUBECTL ?= kubectl

.PHONY: ns pvc secrets build-qa apply-qa delete-qa build-prod apply-prod delete-prod

ns:
	$(KUBECTL) apply -f base/namespaces.yaml

pvc:
	$(KUBECTL) apply -f base/pvc/

secrets:
	$(KUBECTL) apply -f base/secrets/

build-qa:
	$(KUSTOMIZE) overlays/qa > dist-qa.yaml

apply-qa: ns pvc secrets
	$(KUBECTL) apply -k overlays/qa

delete-qa:
	$(KUBECTL) delete -k overlays/qa || true

build-prod:
	$(KUSTOMIZE) overlays/prod > dist-prod.yaml

apply-prod: ns pvc secrets
	$(KUBECTL) apply -k overlays/prod

delete-prod:
	$(KUBECTL) delete -k overlays/prod || true

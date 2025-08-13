# CANDIG Kubernetes Deployment

This repository contains Kustomize manifests for deploying CANDIG services on Kubernetes.

## Main Kustomization File Location
The main kustomization.yaml is located at `base/kustomization.yaml`.

## Structure
- `base/`: Core resources (deployments, services, PVCs, secrets, configmaps, ingress)
- `overlays/qa`: QA environment overlays
- `overlays/prod`: Production environment overlays

## Usage
- `make deploy-base` — Deploy base resources
- `make deploy-qa` — Deploy QA overlay
- `make deploy-prod` — Deploy Production overlay

## Requirements
- Kubernetes cluster
- kubectl
- kustomize
- make

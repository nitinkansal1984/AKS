#!/bin/bash

export BOOKBUYER_NAMESPACE=bookbuyer
export BOOKTHIEF_NAMESPACE=bookthief
export BOOKSTORE_NAMESPACE=bookstore
export BOOKWAREHOUSE_NAMESPACE=bookwarehouse

## forward bookbuyer port
BOOKBUYER_LOCAL_PORT="${BOOKBUYER_LOCAL_PORT:-7070}"
POD="$(kubectl get pods --selector app=bookbuyer -n "$BOOKBUYER_NAMESPACE" --no-headers  | grep 'Running' | awk 'NR==1{print $1}')"
kubectl port-forward "$POD" -n "$BOOKBUYER_NAMESPACE" "$BOOKBUYER_LOCAL_PORT":14001 &

## forward bookstore version 1
BOOKSTOREv1_LOCAL_PORT="${BOOKSTOREv1_LOCAL_PORT:-7071}"
POD="$(kubectl get pods --selector app=bookstore-v1 -n "$BOOKSTORE_NAMESPACE" --no-headers | grep 'Running' | awk 'NR==1{print $1}')"
kubectl port-forward "$POD" -n "$BOOKSTORE_NAMESPACE" "$BOOKSTOREv1_LOCAL_PORT":14001 &

## forward bookstore version 2
BOOKSTOREv2_LOCAL_PORT="${BOOKSTOREv2_LOCAL_PORT:-7072}"
POD="$(kubectl get pods --selector app=bookstore-v2 -n "$BOOKSTORE_NAMESPACE" --no-headers | grep 'Running' | awk 'NR==1{print $1}')"
kubectl port-forward "$POD" -n "$BOOKSTORE_NAMESPACE" "$BOOKSTOREv2_LOCAL_PORT":14001 &

## forward bookthief 
BOOKTHIEF_LOCAL_PORT="${BOOKTHIEF_LOCAL_PORT:-7073}"
POD="$(kubectl get pods --selector app=bookthief -n "$BOOKTHIEF_NAMESPACE" --no-headers | grep 'Running' | awk 'NR==1{print $1}')"
kubectl port-forward "$POD" -n "$BOOKTHIEF_NAMESPACE" "$BOOKTHIEF_LOCAL_PORT":14001 &

#!/bin/bash
set -e

if [[ -z "${INPUT_REPO}" || -z "${INPUT_AUTH_USER}" || -z "${INPUT_AUTH_SECRET}" || -z "${INPUT_ACTION}" || -z "${INPUT_PAYLOAD_JSON}" ]]; then
	echo "Required input parameter missing"
	exit -1
fi

exec curl \
	-X POST \
	-H "Accept: application/vnd.github.everest-preview+json" \
	-H "Content-Type: application/json" \
	--data "{\"event_type\": \"${INPUT_ACTION}\", \"client_payload\": ${INPUT_PAYLOAD_JSON}}" \
	--url "https://api.github.com/repos/${INPUT_REPO}/dispatches" \
	-K- <<< "-u \"${INPUT_AUTH_USER}:${INPUT_AUTH_SECRET}\""

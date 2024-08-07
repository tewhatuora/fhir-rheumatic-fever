### Setting up a webhook for automatic branch publishing
# Change "ref" value to refs/heads/<remote branch name>

#!/bin/bash
curl -X POST  "https://us-central1-fhir-org-starter-project.cloudfunctions.net/ig-commit-trigger" \
  -H "Content-type: application/json" \
  --data '{"ref": "refs/heads/main", "repository": {"full_name": "tewhatuora/rheumatic-fever"}}'

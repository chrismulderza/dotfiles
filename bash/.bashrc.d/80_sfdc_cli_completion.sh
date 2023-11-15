#!/usr/bin/env bash

# This function joins an array using a character passed in
# e.g. ARRAY=(one two three) -> join_by ":" ${ARRAY[@]} -> "one:two:three"
function join_by { local IFS="$1"; shift; echo "$*"; }

_sf_autocomplete()
{

  local cur="${COMP_WORDS[COMP_CWORD]}" opts normalizedCommand colonPrefix IFS=$' \t\n'
  COMPREPLY=()

  local commands="
cmdt:generate:field --json --name --type --picklist-values --decimal-places --label --output-directory
force:cmdt:field:create --json --name --type --picklist-values --decimal-places --label --output-directory
cmdt:field:create --json --name --type --picklist-values --decimal-places --label --output-directory
cmdt:generate:fromorg --json --target-org --api-version --dev-name --label --plural-label --visibility --sobject --ignore-unsupported --type-output-directory --records-output-dir
force:cmdt:generate --json --target-org --api-version --dev-name --label --plural-label --visibility --sobject --ignore-unsupported --type-output-directory --records-output-dir
cmdt:generate:object --json --type-name --label --plural-label --visibility --output-directory
force:cmdt:create --json --type-name --label --plural-label --visibility --output-directory
cmdt:create --json --type-name --label --plural-label --visibility --output-directory
cmdt:generate:record --json --type-name --record-name --label --protected --input-directory --output-directory
force:cmdt:record:create --json --type-name --record-name --label --protected --input-directory --output-directory
cmdt:record:create --json --type-name --record-name --label --protected --input-directory --output-directory
cmdt:generate:records --json --csv --type-name --input-directory --output-directory --name-column
force:cmdt:record:insert --json --csv --type-name --input-directory --output-directory --name-column
cmdt:record:insert --json --csv --type-name --input-directory --output-directory --name-column
community:create --json --name --template-name --url-path-prefix --description --target-org --api-version
force:community:create --json --name --template-name --url-path-prefix --description --target-org --api-version
community:list:template --json --target-org --api-version
force:community:template:list --json --target-org --api-version
community:publish --json --name --target-org --api-version
force:community:publish --json --name --target-org --api-version
deploy:functions --json --connected-org --branch --force --quiet
dev:audit:messages --json --project-dir --messages-dir --source-dir
dev:configure:repo --json --repository --dry-run --bot
dev:configure:secrets --json --repository --dry-run
dev:convert:messages --json --project-dir --file-name
dev:generate:command --name --force --nuts --unit
dev:generate:flag --dry-run
dev:generate:hook --force --event
dev:generate:library 
dev:generate:plugin 
plugins:generate 
dev:hook --json --plugin
env:compute:collaborator:add --heroku-user
env:create:compute --json --connected-org --alias
env:delete --json --target-compute --confirm
env:log --target-compute --num
env:log:tail --target-compute
env:logdrain:add --json --target-compute --drain-url
env:logdrain:list --json --target-compute
env:logdrain:remove --json --target-compute --drain-url
env:var:get --json --target-compute
env:var:list --json --target-compute
env:var:set --json --target-compute
env:var:unset --json --target-compute
generate:function --function-name --language
login:functions --json
login:functions:jwt --json --username --keyfile --clientid --instance-url --alias --set-default --set-default-dev-hub
logout:functions --json
org:create:shape --json --target-org --api-version
force:org:shape:create --json --target-org --api-version
org:create:snapshot --json --target-dev-hub --api-version --source-org --name --description
force:org:snapshot:create --json --target-dev-hub --api-version --source-org --name --description
org:delete:shape --json --target-org --api-version --no-prompt
force:org:shape:delete --json --target-org --api-version --no-prompt
org:delete:snapshot --json --target-dev-hub --api-version --snapshot
force:org:snapshot:delete --json --target-dev-hub --api-version --snapshot
org:get:snapshot --json --target-dev-hub --api-version --snapshot
force:org:snapshot:get --json --target-dev-hub --api-version --snapshot
org:list:shape --json
force:org:shape:list --json
org:list:snapshot --json --target-dev-hub --api-version
force:org:snapshot:list --json --target-dev-hub --api-version
package:create --json --target-dev-hub --api-version --name --package-type --description --no-namespace --path --org-dependent --error-notification-username
force:package:beta:create --json --target-dev-hub --api-version --name --package-type --description --no-namespace --path --org-dependent --error-notification-username
force:package:create --json --target-dev-hub --api-version --name --package-type --description --no-namespace --path --org-dependent --error-notification-username
package:delete --json --target-dev-hub --api-version --no-prompt --package
force:package:beta:delete --json --target-dev-hub --api-version --no-prompt --package
force:package:delete --json --target-dev-hub --api-version --no-prompt --package
package:install --json --target-org --api-version --wait --installation-key --publish-wait --no-prompt --package --apex-compile --security-type --upgrade-type
force:package:beta:install --json --target-org --api-version --wait --installation-key --publish-wait --no-prompt --package --apex-compile --security-type --upgrade-type
force:package:install --json --target-org --api-version --wait --installation-key --publish-wait --no-prompt --package --apex-compile --security-type --upgrade-type
package:install:report --json --target-org --api-version --request-id
force:package:beta:install:report --json --target-org --api-version --request-id
force:package:install:report --json --target-org --api-version --request-id
package:installed:list --json --target-org --api-version
force:package:beta:installed:list --json --target-org --api-version
force:package:installed:list --json --target-org --api-version
package:list --json --target-dev-hub --api-version --verbose
force:package:beta:list --json --target-dev-hub --api-version --verbose
force:package:list --json --target-dev-hub --api-version --verbose
package:uninstall --json --target-org --api-version --wait --package
force:package:beta:uninstall --json --target-org --api-version --wait --package
force:package:uninstall --json --target-org --api-version --wait --package
package:uninstall:report --json --target-org --api-version --request-id
force:package:beta:uninstall:report --json --target-org --api-version --request-id
force:package:uninstall:report --json --target-org --api-version --request-id
package:update --json --target-dev-hub --api-version --package --name --description --error-notification-username
force:package:beta:update --json --target-dev-hub --api-version --package --name --description --error-notification-username
force:package:update --json --target-dev-hub --api-version --package --name --description --error-notification-username
package:version:create --json --target-dev-hub --api-version --branch --code-coverage --definition-file --installation-key --installation-key-bypass --package --path --post-install-script --post-install-url --releasenotes-url --skip-ancestor-check --skip-validation --tag --uninstall-script --version-description --version-name --version-number --wait --language --verbose
force:package:beta:version:create --json --target-dev-hub --api-version --branch --code-coverage --definition-file --installation-key --installation-key-bypass --package --path --post-install-script --post-install-url --releasenotes-url --skip-ancestor-check --skip-validation --tag --uninstall-script --version-description --version-name --version-number --wait --language --verbose
force:package:version:create --json --target-dev-hub --api-version --branch --code-coverage --definition-file --installation-key --installation-key-bypass --package --path --post-install-script --post-install-url --releasenotes-url --skip-ancestor-check --skip-validation --tag --uninstall-script --version-description --version-name --version-number --wait --language --verbose
package:version:create:list --json --target-dev-hub --api-version --created-last-days --status
force:package:beta:version:create:list --json --target-dev-hub --api-version --created-last-days --status
force:package:version:create:list --json --target-dev-hub --api-version --created-last-days --status
package:version:create:report --json --target-dev-hub --api-version --package-create-request-id
force:package:beta:version:create:report --json --target-dev-hub --api-version --package-create-request-id
force:package:version:create:report --json --target-dev-hub --api-version --package-create-request-id
package:version:delete --json --target-dev-hub --api-version --no-prompt --package
force:package:beta:version:delete --json --target-dev-hub --api-version --no-prompt --package
force:package:version:delete --json --target-dev-hub --api-version --no-prompt --package
package:version:displayancestry --json --target-dev-hub --api-version --package --dot-code --verbose
force:package:beta:version:displayancestry --json --target-dev-hub --api-version --package --dot-code --verbose
force:package:version:displayancestry --json --target-dev-hub --api-version --package --dot-code --verbose
package:version:list --json --target-dev-hub --api-version --created-last-days --concise --modified-last-days --packages --released --order-by --verbose
force:package:beta:version:list --json --target-dev-hub --api-version --created-last-days --concise --modified-last-days --packages --released --order-by --verbose
force:package:version:list --json --target-dev-hub --api-version --created-last-days --concise --modified-last-days --packages --released --order-by --verbose
package:version:promote --json --target-dev-hub --api-version --package --no-prompt
force:package:beta:version:promote --json --target-dev-hub --api-version --package --no-prompt
force:package:version:promote --json --target-dev-hub --api-version --package --no-prompt
package:version:report --json --target-dev-hub --api-version --package --verbose
force:package:beta:version:report --json --target-dev-hub --api-version --package --verbose
force:package:version:report --json --target-dev-hub --api-version --package --verbose
package:version:update --json --target-dev-hub --api-version --package --version-name --version-description --branch --tag --installation-key
force:package:beta:version:update --json --target-dev-hub --api-version --package --version-name --version-description --branch --tag --installation-key
force:package:version:update --json --target-dev-hub --api-version --package --version-name --version-description --branch --tag --installation-key
package1:version:create --json --target-org --api-version --package-id --name --description --version --managed-released --release-notes-url --post-install-url --installation-key --wait
force:package1:beta:version:create --json --target-org --api-version --package-id --name --description --version --managed-released --release-notes-url --post-install-url --installation-key --wait
force:package1:version:create --json --target-org --api-version --package-id --name --description --version --managed-released --release-notes-url --post-install-url --installation-key --wait
package1:version:create:get --json --target-org --api-version --request-id
force:package1:beta:version:create:get --json --target-org --api-version --request-id
force:package1:version:create:get --json --target-org --api-version --request-id
package1:version:display --json --target-org --api-version --package-version-id
force:package1:beta:version:display --json --target-org --api-version --package-version-id
force:package1:version:display --json --target-org --api-version --package-version-id
package1:version:list --json --target-org --api-version --package-id
force:package1:beta:version:list --json --target-org --api-version --package-id
force:package1:version:list --json --target-org --api-version --package-id
run:function --json --function-url --headers --payload --structured --connected-org
run:function:start --port --debug-port --language --verbose
run:function:start:container 
run:function:start:local --port --debug-port --language
scanner:rule:add --json --loglevel --language --path
scanner:rule:describe --json --loglevel --rulename --verbose
scanner:rule:list --json --loglevel --verbose --category --ruleset --language --engine
scanner:rule:remove --json --loglevel --verbose --force --path
scanner:run --json --loglevel --verbose --format --outfile --severity-threshold --normalize-severity --projectdir --category --ruleset --engine --target --tsconfig --eslintconfig --pmdconfig --env --verbose-violations
scanner:run:dfa --json --loglevel --verbose --format --outfile --severity-threshold --normalize-severity --projectdir --target --rule-thread-count --rule-thread-timeout --rule-disable-warning-violation --sfgejvmargs --pathexplimit
whoami:functions --json
autocomplete --refresh-cache
update --available --version --interactive --force
help --nested-commands
commands --json --help --hidden --tree --columns --sort --filter --csv --output --extended --no-truncate --no-header
plugins --core
plugins:inspect --json --help --verbose
plugins:install --help --verbose --force
plugins:add --help --verbose --force
plugins:link --help --verbose
plugins:uninstall --help --verbose
plugins:unlink --help --verbose
plugins:remove --help --verbose
plugins:update --help --verbose
search 
version --json --verbose
which 
apex:get:log --json --target-org --api-version --log-id --number --output-dir
force:apex:log:get --json --target-org --api-version --log-id --number --output-dir
apex:get:test --json --target-org --api-version --test-run-id --code-coverage --output-dir --result-format
force:apex:test:report --json --target-org --api-version --test-run-id --code-coverage --output-dir --result-format
apex:list:log --json --target-org --api-version
force:apex:log:list --json --target-org --api-version
apex:run --json --target-org --api-version --file
force:apex:execute --json --target-org --api-version --file
apex:run:test --json --target-org --api-version --code-coverage --output-dir --test-level --class-names --result-format --suite-names --tests --wait --synchronous --detailed-coverage
force:apex:test:run --json --target-org --api-version --code-coverage --output-dir --test-level --class-names --result-format --suite-names --tests --wait --synchronous --detailed-coverage
apex:tail:log --json --target-org --api-version --color --debug-level --skip-trace-flag
force:apex:log:tail --json --target-org --api-version --color --debug-level --skip-trace-flag
org:list:auth --json
force:auth:list --json
auth:list --json
org:login:access-token --json --instance-url --set-default-dev-hub --set-default --alias --no-prompt
force:auth:accesstoken:store --json --instance-url --set-default-dev-hub --set-default --alias --no-prompt
auth:accesstoken:store --json --instance-url --set-default-dev-hub --set-default --alias --no-prompt
org:login:device --json --client-id --instance-url --set-default-dev-hub --set-default --alias
force:auth:device:login --json --client-id --instance-url --set-default-dev-hub --set-default --alias
auth:device:login --json --client-id --instance-url --set-default-dev-hub --set-default --alias
org:login:jwt --json --username --jwt-key-file --client-id --instance-url --set-default-dev-hub --set-default --alias
force:auth:jwt:grant --json --username --jwt-key-file --client-id --instance-url --set-default-dev-hub --set-default --alias
auth:jwt:grant --json --username --jwt-key-file --client-id --instance-url --set-default-dev-hub --set-default --alias
org:login:sfdx-url --json --sfdx-url-file --set-default-dev-hub --set-default --alias
force:auth:sfdxurl:store --json --sfdx-url-file --set-default-dev-hub --set-default --alias
auth:sfdxurl:store --json --sfdx-url-file --set-default-dev-hub --set-default --alias
org:login:web --json --browser --client-id --instance-url --set-default-dev-hub --set-default --alias
force:auth:web:login --json --browser --client-id --instance-url --set-default-dev-hub --set-default --alias
auth:web:login --json --browser --client-id --instance-url --set-default-dev-hub --set-default --alias
org:logout --json --target-org --all --no-prompt
force:auth:logout --json --target-org --all --no-prompt
auth:logout --json --target-org --all --no-prompt
env:display --json --target-env
env:list --json --all --columns --csv --filter --no-header --no-truncate --output --sort
env:open --json --path --url-only --target-env --browser
doctor --json --command --plugin --output-dir --create-issue
info:releasenotes:display --json --version
whatsnew --json --version
limits:api:display --json --target-org --api-version
force:limits:api:display --json --target-org --api-version
org:list:limits --json --target-org --api-version
limits:recordcounts:display --json --sobject --target-org --api-version
force:limits:recordcounts:display --json --sobject --target-org --api-version
org:list:sobject:record-counts --json --sobject --target-org --api-version
login 
logout --json --no-prompt
data:create:record --json --target-org --api-version --sobject --values --use-tooling-api
force:data:record:create --json --target-org --api-version --sobject --values --use-tooling-api
data:delete:bulk --json --target-org --api-version --file --sobject --wait --async
data:delete:record --json --target-org --api-version --sobject --record-id --where --use-tooling-api
force:data:record:delete --json --target-org --api-version --sobject --record-id --where --use-tooling-api
data:delete:resume --json --target-org --job-id --use-most-recent --wait --api-version
data:export:tree --json --target-org --api-version --query --plan --prefix --output-dir
force:data:tree:export --json --target-org --api-version --query --plan --prefix --output-dir
data:get:record --json --target-org --api-version --sobject --record-id --where --use-tooling-api
force:data:record:get --json --target-org --api-version --sobject --record-id --where --use-tooling-api
data:import:tree --json --target-org --api-version --files --plan --config-help
force:data:tree:import --json --target-org --api-version --files --plan --config-help
data:query --json --target-org --api-version --query --file --use-tooling-api --bulk --wait --async --result-format
force:data:soql:query --json --target-org --api-version --query --file --use-tooling-api --bulk --wait --async --result-format
data:query:resume --json --target-org --api-version --result-format --bulk-query-id --use-most-recent
force:data:soql:bulk:report --json --target-org --api-version --result-format --bulk-query-id --use-most-recent
data:resume --json --target-org --api-version --batch-id --job-id
data:update:record --json --target-org --api-version --sobject --record-id --where --values --use-tooling-api
force:data:record:update --json --target-org --api-version --sobject --record-id --where --values --use-tooling-api
data:upsert:bulk --json --target-org --api-version --file --sobject --wait --async --external-id
data:upsert:resume --json --target-org --job-id --use-most-recent --wait --api-version
force:data:bulk:delete --json --target-org --api-version --file --sobject --wait
force:data:bulk:status --json --target-org --api-version --batch-id --job-id
force:data:bulk:upsert --json --target-org --api-version --external-id --file --sobject --wait --serial
deploy --interactive
deploy:metadata --json --api-version --async --concise --dry-run --ignore-conflicts --ignore-errors --ignore-warnings --manifest --metadata --metadata-dir --single-package --source-dir --target-org --tests --test-level --verbose --wait
deploy:metadata:cancel --json --async --job-id --use-most-recent --wait
deploy:metadata:preview --json --ignore-conflicts --manifest --metadata --source-dir --target-org
deploy:metadata:quick --json --async --concise --job-id --target-org --use-most-recent --verbose --wait
deploy:metadata:report --json --job-id --use-most-recent
deploy:metadata:resume --json --concise --job-id --use-most-recent --verbose --wait
deploy:metadata:validate --json --api-version --async --concise --manifest --metadata --source-dir --metadata-dir --single-package --target-org --tests --test-level --verbose --wait
retrieve:metadata --json --api-version --ignore-conflicts --manifest --metadata --package-name --single-package --source-dir --target-metadata-dir --target-org --wait --unzip --zip-file-name
retrieve:metadata:preview --json --ignore-conflicts --target-org
sobject:describe --json --target-org --api-version --sobject --use-tooling-api
force:schema:sobject:describe --json --target-org --api-version --sobject --use-tooling-api
sobject:list --json --target-org --api-version --sobject
force:schema:sobject:list --json --target-org --api-version --sobject
alias:list --json
force:alias:list --json
alias:set --json
force:alias:set --json
alias:unset --json --all --no-prompt
force:alias:unset --json --all --no-prompt
config:get --json --verbose
force:config:get --json --verbose
config:list --json
force:config:list --json
config:set --json --global
force:config:set --json --global
config:unset --json --global
force:config:unset --json --global
schema:generate:field --label --object
generate:metadata:field --label --object
schema:generate:platformevent --label
generate:metadata:platformevent --label
schema:generate:sobject --label --use-default-features
generate:metadata:sobject --label --use-default-features
schema:generate:tab --json --object --directory --icon
generate:metadata:tab --json --object --directory --icon
force:org:clone --json --target-org --api-version --type --definitionfile --setdefaultusername --setalias --wait
force:org:create --json --target-org --target-dev-hub --api-version --type --definitionfile --nonamespace --noancestors --clientid --setdefaultusername --setalias --wait --durationdays
force:org:delete --json --target-org --api-version --no-prompt
force:org:status --json --target-org --api-version --sandboxname --setdefaultusername --setalias --wait
org:create:sandbox --json --definition-file --set-default --alias --wait --poll-interval --async --name --clone --license-type --target-org --no-prompt --no-track-source
env:create:sandbox --json --definition-file --set-default --alias --wait --poll-interval --async --name --clone --license-type --target-org --no-prompt --no-track-source
org:create:scratch --json --alias --async --set-default --definition-file --target-dev-hub --no-ancestors --edition --no-namespace --duration-days --wait --api-version --client-id --track-source
env:create:scratch --json --alias --async --set-default --definition-file --target-dev-hub --no-ancestors --edition --no-namespace --duration-days --wait --api-version --client-id --track-source
org:delete:sandbox --json --target-org --no-prompt
env:delete:sandbox --json --target-org --no-prompt
org:delete:scratch --json --target-org --no-prompt
env:delete:scratch --json --target-org --no-prompt
org:display --json --target-org --api-version --verbose
force:org:display --json --target-org --api-version --verbose
org:list --json --verbose --all --clean --no-prompt --skip-connection-status
force:org:list --json --verbose --all --clean --no-prompt --skip-connection-status
org:list:metadata --json --api-version --target-org --output-file --metadata-type --folder
force:mdapi:listmetadata --json --api-version --target-org --output-file --metadata-type --folder
org:list:metadata-types --json --api-version --target-org --output-file
force:mdapi:describemetadata --json --api-version --target-org --output-file
org:open --json --target-org --api-version --browser --path --url-only --source-file
force:org:open --json --target-org --api-version --browser --path --url-only --source-file
force:source:open --json --target-org --api-version --browser --path --url-only --source-file
org:resume:sandbox --json --wait --name --job-id --use-most-recent --target-org
env:resume:sandbox --json --wait --name --job-id --use-most-recent --target-org
org:resume:scratch --json --job-id --use-most-recent
env:resume:scratch --json --job-id --use-most-recent
plugins:trust:verify --json --npm --registry
analytics:generate:template --json --output-dir --api-version --name
force:analytics:template:create --json --output-dir --api-version --name
apex:generate:class --json --name --template --output-dir --api-version
force:apex:class:create --json --name --template --output-dir --api-version
apex:generate:trigger --json --name --template --output-dir --api-version --sobject --event
force:apex:trigger:create --json --name --template --output-dir --api-version --sobject --event
lightning:generate:app --json --name --template --output-dir --api-version
force:lightning:app:create --json --name --template --output-dir --api-version
lightning:generate:component --json --name --template --output-dir --api-version --type
force:lightning:component:create --json --name --template --output-dir --api-version --type
lightning:generate:event --json --name --template --output-dir --api-version
force:lightning:event:create --json --name --template --output-dir --api-version
lightning:generate:interface --json --name --template --output-dir --api-version
force:lightning:interface:create --json --name --template --output-dir --api-version
lightning:generate:test --json --name --template --output-dir --api-version
force:lightning:test:create --json --name --template --output-dir --api-version
project:generate --json --name --template --output-dir --namespace --default-package-dir --manifest
force:project:create --json --name --template --output-dir --namespace --default-package-dir --manifest
static-resource:generate --json --name --type --output-dir --api-version
force:staticresource:create --json --name --type --output-dir --api-version
visualforce:generate:component --json --name --template --output-dir --api-version --label
force:visualforce:component:create --json --name --template --output-dir --api-version --label
visualforce:generate:page --json --name --output-dir --api-version --label
force:visualforce:page:create --json --name --output-dir --api-version --label
force:user:password:generate --json --on-behalf-of --length --complexity --target-org --api-version
org:assign:permset --json --name --on-behalf-of --target-org --api-version
org:assign:permsetlicense --json --name --on-behalf-of --target-org --api-version
org:create:user --json --set-alias --definition-file --set-unique-username --target-org --api-version
force:user:create --json --set-alias --definition-file --set-unique-username --target-org --api-version
org:display:user --json --target-org --api-version
force:user:display --json --target-org --api-version
org:generate:password --json --on-behalf-of --length --complexity --target-org --api-version
org:list:users --json --target-org --api-version
force:user:list --json --target-org --api-version
"

  function __trim_colon_commands()
  {
    # Turn $commands into an array
    commands=("${commands[@]}")

    if [[ -z "$colonPrefix" ]]; then
      colonPrefix="$normalizedCommand:"
    fi

    # Remove colon-word prefix from $commands
    commands=( "${commands[@]/$colonPrefix}" )

    for i in "${!commands[@]}"; do
      if [[ "${commands[$i]}" == "$normalizedCommand" ]]; then
        # If the currently typed in command is a topic command we need to remove it to avoid suggesting it again
        unset "${commands[$i]}"
      else
        # Trim subcommands from each command
        commands[$i]="${commands[$i]%%:*}"
      fi
    done
  }

  if [[ "$cur" != "-"* ]]; then
    # Command
    __COMP_WORDS=( "${COMP_WORDS[@]:1}" )

    # The command typed by the user but separated by colons (e.g. "mycli command subcom" -> "command:subcom")
    normalizedCommand="$( printf "%s" "$(join_by ":" "${__COMP_WORDS[@]}")" )"

    # The command hirarchy, with colons, leading up to the last subcommand entered (e.g. "mycli com subcommand subsubcom" -> "com:subcommand:")
    colonPrefix="${normalizedCommand%"${normalizedCommand##*:}"}"

    if [[ -z "$normalizedCommand" ]]; then
      # If there is no normalizedCommand yet the user hasn't typed in a full command
      # So we should trim all subcommands & flags from $commands so we can suggest all top level commands
      opts=$(printf "%s " "${commands[@]}" | grep -Eo '^[a-zA-Z0-9_-]+')
    else
      # Filter $commands to just the ones that match the $normalizedCommand and turn into an array
      commands=( $(compgen -W "$commands" -- "${normalizedCommand}") )
      # Trim higher level and subcommands from the subcommands to suggest
      __trim_colon_commands "$colonPrefix"

      opts=$(printf "%s " "${commands[@]}") # | grep -Eo '^[a-zA-Z0-9_-]+'
    fi
  else 
    # Flag

    # The full CLI command separated by colons (e.g. "mycli command subcommand --fl" -> "command:subcommand")
    # This needs to be defined with $COMP_CWORD-1 as opposed to above because the current "word" on the command line is a flag and the command is everything before the flag
    normalizedCommand="$( printf "%s" "$(join_by ":" "${COMP_WORDS[@]:1:($COMP_CWORD - 1)}")" )"

    # The line below finds the command in $commands using grep
    # Then, using sed, it removes everything from the found command before the --flags (e.g. "command:subcommand:subsubcom --flag1 --flag2" -> "--flag1 --flag2")
    opts=$(printf "%s " "${commands[@]}" | grep "${normalizedCommand}" | sed -n "s/^${normalizedCommand} //p")
  fi

  COMPREPLY=($(compgen -W "$opts" -- "${cur}"))
}

complete -F _sf_autocomplete sf

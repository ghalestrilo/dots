export BEND_DIR="~/git/bend"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export DISABLE_SPRING=true

alias hosts='sudo vim /etc/hosts'
alias pack='cat package.json'

alias k="kubectl"
alias b="bender-go"
alias api='cd $BEND_DIR/Bend-API && mise use ruby@3.2.2'
alias ui='cd $BEND_DIR/Bend-API/ui/ehr'
alias mp='cd $BEND_DIR/Bend-API/ui/member'
alias pp='cd $BEND_DIR/Bend-API/ui/partner'
alias reg='cd $BEND_DIR/Bend-API/testing/regressions'
alias rs='api && cd applications/bend_health && clear && bundle exec rspec --color'
alias uptest="b update -i testing"
alias upstag="b update -i staging"
alias upprod="b update -i production"
alias t1="b -e testing-one"
alias t2="b -e testing-two"
alias t3="b -e testing-three"
alias t4="b -e testing-four"
alias t5="b -e testing-five"
alias t6="b -e testing-six"
alias t7="b -e testing-seven"
alias t8="b -e testing-eight"
alias t9="b -e testing-nine"
alias t10="b -e testing-ten"
alias stag="b -e staging"
alias prod="b -e production"
alias pgstart="pg_ctl -D $HOME/.pgdata -l $HOME/.pglogfile start"
alias pgstop="pg_ctl -D $HOME/.pgdata stop"

alias rapi='api && cd ./applications/bend_health && rails s -p 21003'
alias rui='ui && y start:no-auth'

alias cdapi='cd $BEND_DIR/Bend-API/applications/bend_health'
alias cdreg='cd $BEND_DIR/Bend-API/testing/regressions'
alias cdcommon='cd $BEND_DIR/Bend-API/common'
alias cdehr='cd $BEND_DIR/Bend-API/ui/ehr'
alias cdmember='cd $BEND_DIR/Bend-API/ui/member'
alias cdpartner='cd $BEND_DIR/Bend-API/ui/partner'

function testplay
  if [ -z "$argv[1]" ]
    echo "Usage: testplay <environment> <test>"
    return 1
  end
  echo "Testing playwright suite against $argv[1]"
  APP_ENV="$argv[1]" yarn --cwd $HOME/git/bend/Bend-API/testing/regressions/ run test $argv[2] --reporter=line --trace on --ui
end

function reset-local-db
  rails db:schema:load
  rails runner "DynamicConfigImportJob.perform_now(truncate: true, fail_silently: false, clear_redis_cache: false, sync_accounts: true)"

  rails runner "~/git/dots/scripts/reset-local-db.rb"
  rails data:migrate
end

function sync-with-main 
  git fetch origin main
  git checkout $argv[1]
  git pull origin main --no-rebase
  git add --all
  git commit -m "Sync with main"
  git push
end

alias teste2e="APP_ENV=testing-eight PW_GLOBAL_TIMEOUT=240000 yarn run test --reporter=line --trace on --ui"

function gh-redeploy
  if [ -z "$argv[1]" ]
    echo "Usage: gh-redeploy <environment>"
    return 1 
  end
  gh pr edit $(git branch --show-current) --add-label deploy-$argv[1]
end

function gh-regressions
  if [ -z "$argv[1]" ]
    echo "Usage: gh-regressions <environment>"
    return 1
  end
  gh pr edit $(git branch --show-current) --add-label regressions
end


# Let's update this alias to become a function. The first and only argument will replace "testing-five" in the string.
function creds
  if [ -z "$argv[1]" ]
    echo "Usage: creds <environment>"
    return 1
  end
  kubectl exec -i svc/api-dev-$argv[1] -- env | grep RAILS_DB
end
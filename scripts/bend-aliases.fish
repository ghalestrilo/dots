alias ws='cd /Users/douglasmuraoka/workspace'
alias p='git pull'
alias gis='git status'
alias gic='git cola'
alias gil='git log --graph --oneline'
alias hosts='sudo vim /etc/hosts'
alias c='git checkout'
alias reload='source ~/.zshrc'
alias gp='git push'
alias y='yarn'
alias rc='subl ~/.zshrc'
alias pack='cat package.json'
alias push-new='git push origin $(git branch --show-current) -u'
alias save='git stash save'
alias pop='git stash pop'

alias k="kubectl"
alias b="bender-go"
alias api='cd ~/workspace/Bend-API && mise use ruby@3.2.2'
alias ui='cd ~/workspace/Bend-API/ui/ehr'
alias mp='cd ~/workspace/Bend-API/ui/member'
alias pp='cd ~/workspace/Bend-API/ui/partner'
alias reg='cd ~/workspace/Bend-API/testing/regressions'
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

alias rapi='api && cd ./applications/bend_health && rails s -p 21003'
alias rui='ui && y start:no-auth'

alias play='APP_ENV=staging yarn run test tests/referrals.spec.ts --reporter=line --trace on --ui'

function play
  APP_ENV="$argv[0]" yarn run test tests/referrals.spec.ts --reporter=line --trace on --ui
end

function gh-redeploy
  if [ -z "$argv[0]" ]
    echo "Usage: gh-redeploy <environment>"
    return 1 
  end
  gh pr edit $(git branch --show-current) --add-label deploy-$argv[0]
end

function gh-regressions
  if [ -z "$argv[0]" ]
    echo "Usage: gh-regressions <environment>"
    return 1
  end
  gh pr edit $(git branch --show-current) --add-label regressions
end
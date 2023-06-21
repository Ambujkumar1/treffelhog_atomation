
gh auth login 
enter auth token
gh repo list --json name --limit 500 git_organisation_name --jq '.[].name' > gitrepo.txt 
cat gitrepo.txt

for i in $(cat gitrepo.txt) ; do docker run --platform linux/arm64 -it -v "$PWD:/pwd" trufflesecurity/trufflehog:latest github --repo https://github.com/organisation_name/$i.git --only-verified --token=auth_token ; done > output$(date +%d-%m-%Y).txt

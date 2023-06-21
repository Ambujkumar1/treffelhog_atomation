# treffelhog_atomation
Step By step process to Automate truffelhog scan

This automation script will help you detect hardcoded creds in git repo in mass scale 

Step 1:

Run Gh scan utility to fetch all the git repo
gh auth login
enter auth token
gh repo list --json name --limit 500 git_organisation_name --jq '.[].name' > gitrepo.txt
cat gitrepo.txt

After running these command you can store git repo name in one file now it's time to detect all the secrets in these files

step 2: 

for i in $(cat gitrepo.txt) ; do docker run --platform linux/arm64 -it -v "$PWD:/pwd" trufflesecurity/trufflehog:latest github --repo https://github.com/organisation_name/$i.git --only-verified  --token=auth_token ; done > output$(date +%d-%m-%Y).txt 

# Git-related scripts

## Mirror - Clone a repository into a new one

### What is it

This is a script that creates a replica of a given GitHub user's repository.

### Requisites

- Git
- GitHub cli
- Be logged-in through the GitHub cli (`gh auth login`)

### How it works

Launch the `mirror.sh` with the following three arguments:

- Username the github username
- Name of the repo to be cloned
- Name of the new repo to be mirrored

#### Example

```console
./mirror.sh myGitHubUsername repoToBeCloned newRepo
```
